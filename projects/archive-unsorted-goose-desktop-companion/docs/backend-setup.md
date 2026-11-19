# Cloud Sync Backend Setup

Dieses Dokument beschreibt die Einrichtung der Supabase Self-Hosted Backend-Infrastruktur für Goose Desktop Companion.

## Voraussetzungen

- Docker & Docker Compose
- PostgreSQL Kenntnisse
- (Optional) Domain/SSL für Produktion

---

## Schnellstart

### 1. Supabase starten

```bash
# Verzeichnis erstellen
mkdir -p supabase/data

# Docker Compose Datei erstellen
cat > supabase/docker-compose.yml << 'EOF'
version: '3.8'

services:
  db:
    image: supabase/postgres:15.1.0.147
    container_name: goose-supabase-db
    environment:
      POSTGRES_PASSWORD: your-secure-password
      POSTGRES_DB: postgres
    volumes:
      - ./data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5

  kong:
    image: kong:3.4
    container_name: goose-supabase-kong
    environment:
      KONG_DATABASE: "off"
      KONG_DECLARATIVE_CONFIG: /var/lib/kong/kong.yml
      KONG_DNS_ORDER: LAST,A,CNAME
      KONG_PLUGINS: request-transformer,cors,key-auth,acl
      KONG_PROXY_ACCESS_LOG: /dev/stdout
      KONG_ADMIN_ACCESS_LOG: /dev/stdout
      KONG_PROXY_ERROR_LOG: /stderr
      KONG_ADMIN_ERROR_LOG: /stderr
      KONG_ADMIN_LISTEN: 0.0.0.0:8001
    ports:
      - "8000:8000"
      - "8001:8001"
    volumes:
      - ./kong.yml:/var/lib/kong/kong.yml:ro
    depends_on:
      db:
        condition: service_healthy

  auth:
    image: supabase/gotrue:v2.151.0
    container_name: goose-supabase-auth
    environment:
      GOTRUE_API_HOST: 0.0.0.0
      GOTRUE_API_PORT: 9999
      API_EXTERNAL_URL: http://localhost:8000
      GOTRUE_DB_DRIVER: postgres
      GOTRUE_DB_DSN: postgres://postgres:your-secure-password@db:5432/postgres?search_path=auth
      GOTRUE_SITE_URL: http://localhost:8000
      GOTRUE_URI_ALLOW_LIST: '*'
      GOTRUE_DISABLE_SIGNUP: "false"
      GOTRUE_JWT_ADMIN_ROLES: service_role
      GOTRUE_JWT_AUD: authenticated
      GOTRUE_JWT_DEFAULT_GROUP_NAME: authenticated
      GOTRUE_JWT_EXP: 3600
      GOTRUE_JWT_SECRET: your-jwt-secret-at-least-32-chars
      GOTRUE_EXTERNAL_EMAIL_ENABLED: "true"
      GOTRUE_MAILER_AUTOCONFIRM: "true"
    ports:
      - "9999:9999"
    depends_on:
      db:
        condition: service_healthy

  meta:
    image: supabase/postgres-meta:v0.83.2
    container_name: goose-supabase-meta
    environment:
      PG_META_PORT: 8080
      PG_META_DB_HOST: db
      PG_META_DB_PORT: 5432
      PG_META_DB_NAME: postgres
      PG_META_DB_USER: postgres
      PG_META_DB_PASS: your-secure-password
    ports:
      - "8080:8080"
    depends_on:
      db:
        condition: service_healthy

  storage:
    image: supabase/storage-api:v1.11.7
    container_name: goose-supabase-storage
    environment:
      ANON_KEY: your-anon-key
      SERVICE_KEY: your-service-key
      POSTGREST_URL: http://kong:8000
      PGRST_JWT_SECRET: your-jwt-secret-at-least-32-chars
      DATABASE_URL: postgres://postgres:your-secure-password@db:5432/postgres
      FILE_SIZE_LIMIT: 52428800
      STORAGE_BACKEND: file
      FILE_STORAGE_BACKEND_PATH: /var/lib/storage
      TENANT_ID: stub
      REGION: stub
      GLOBAL_S3_BUCKET: stub
    ports:
      - "5000:5000"
    volumes:
      - ./storage:/var/lib/storage
    depends_on:
      db:
        condition: service_healthy

networks:
  default:
    name: goose-network
EOF
```

### 2. Kong Konfiguration erstellen

```bash
cat > supabase/kong.yml << 'EOF'
_format_version: "3.0"

services:
  - name: auth
    url: http://auth:9999
    routes:
      - name: auth-route
        paths:
          - /auth/v1
        strip_path: true
        plugins:
          - name: cors

  - name: meta
    url: http://meta:8080
    routes:
      - name: meta-route
        paths:
          - /meta/v1
        strip_path: true
        plugins:
          - name: cors

  - name: storage
    url: http://storage:5000
    routes:
      - name: storage-route
        paths:
          - /storage/v1
        strip_path: true
        plugins:
          - name: cors

  - name: db
    url: http://db:5432
    routes:
      - name: db-route
        paths:
          - /rest/v1
        strip_path: true
        plugins:
          - name: cors
          - name: key-auth
            config:
              key_names:
                - apikey
              key_in_header: true
              key_in_query: true

plugins:
  - name: cors
    config:
      origins:
        - "*"
      methods:
        - GET
        - POST
        - PUT
        - PATCH
        - DELETE
        - OPTIONS
      headers:
        - Accept
        - Authorization
        - Content-Type
        - apikey
      credentials: true
      max_age: 3600
EOF
```

### 3. Container starten

```bash
cd supabase
docker-compose up -d
```

---

## Datenbank Schema installieren

### Option A: Direkt via psql

```bash
docker exec -i goose-supabase-db psql -U postgres < supabase-setup.sql
```

### Option B: Über pgAdmin

1. pgAdmin installieren oder Adminer Docker Container starten
2. Mit `localhost:5432` verbinden
3. `supabase-setup.sql` ausführen

---

## Goose Desktop Companion konfigurieren

### Keys generieren

```bash
# JWT Secret generieren (mindestens 32 Zeichen)
openssl rand -base64 32
# Beispiel: dGhpcyBpcyBhIDMyIGNoYXJhY3RlciBzZWNyZXQga2V5ISEhISEhIQ==

# Anon Key generieren
openssl rand -base64 32
# Beispiel: YW5vbiBrZXkgZm9yIGNsaWVudCBzaWRlIGFjY2Vzcw==
```

### config.ini anpassen

```ini
CloudSyncEnabled=True
SupabaseUrl=http://localhost:8000
SupabaseAnonKey=your-anon-key
SupabaseServiceKey=your-service-key
DeviceName=My-Desktop-Goose
```

---

## API Endpoints

| Endpoint | Beschreibung |
|----------|-------------|
| `POST /rest/v1/sync_data` | Daten synchronisieren |
| `GET /rest/v1/sync_data?user_id=eq.xxx` | Daten abrufen |
| `PATCH /rest/v1/sync_data?id=eq.xxx` | Daten aktualisieren |
| `DELETE /rest/v1/sync_data?id=eq.xxx` | Daten löschen |

### Auth Header

```
apikey: your-anon-key
Authorization: Bearer your-anon-key
```

---

## Troubleshooting

### Connection verweigert

```bash
# Prüfen ob Container laufen
docker ps

# Logs anzeigen
docker logs goose-supabase-db
docker logs goose-supabase-kong
```

### Datenbank Schema fehlt

```bash
# In Container rein gehen
docker exec -it goose-supabase-db psql -U postgres

# Tables prüfen
\dt
```

### CORS Fehler

Kong CORS Konfiguration prüfen in `kong.yml`:

```yaml
plugins:
  - name: cors
    config:
      origins:
        - "*"
```

---

## Production Deployment

### Mit SSL/TLS

1. Nginx Reverse Proxy mit Let's Encrypt
2. Domain konfigurieren
3. HTTP zu HTTPS redirect

### Beispiel Nginx Config

```nginx
server {
    listen 80;
    server_name goose-api.yourdomain.com;
    
    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Security Checklist

- [ ] Starke PostgreSQL Passwörter
- [ ] JWT Secret ändern (nicht default)
- [ ] CORS auf spezifische Domains einschränken
- [ ] Rate Limiting aktivieren
- [ ] Regelmäßige Backups
- [ ] SSL/TLS erzwingen

---

## Backup & Restore

### Backup erstellen

```bash
docker exec goose-supabase-db pg_dump -U postgres goose_db > backup_$(date +%Y%m%d).sql
```

### Restore

```bash
docker exec -i goose-supabase-db psql -U postgres goose_db < backup_20240312.sql
```

---

## Monitoring

### Health Checks

```bash
# Datenbank
curl http://localhost:5432/health

# Kong Admin
curl http://localhost:8001/status
```

### Logs

```bash
docker logs -f goose-supabase-db
docker logs -f goose-supabase-kong
docker logs -f goose-supabase-auth
```

---

## incident.io Integration

incident.io ist ein Incident-Management-Tool, das automatisch Incidents erstellt, wenn Fehler in der Goose Desktop Companion Anwendung auftreten.

### Voraussetzungen

- Kostenloses [incident.io](https://incident.io) Konto
- Microsoft Teams oder Discord für Benachrichtigungen

### 1. incident.io Setup

#### Konto erstellen
1. Gehe zu [incident.io](https://incident.io) und registriere dich
2. Verbinde deinen Slack/Teams Workspace
3. Erstelle ein Team

#### API Key generieren
1. Gehe zu **Settings** → **API Keys**
2. Klicke auf **Create API Key**
3. Wähle folgende Berechtigungen:
   - `View all incident data`
   - `Create incidents`
   - `Edit incidents`
4. Kopiere den Key (wird nur einmal angezeigt!)

#### MS Teams Integration
1. Gehe zu **Settings** → **Microsoft Teams**
2. Folge den Anweisungen zur Installation
3. Wähle den Channel für Benachrichtigungen

#### Discord Webhook (Optional)
1. Gehe zu Discord → Server Settings → Integrations
2. Erstelle einen neuen Webhook
3. Kopiere die Webhook URL

### 2. Goose Desktop Companion konfigurieren

Bearbeite die `config.ini`:

```ini
# Incident Management aktivieren
IncidentEnabled=True

# API Key aus Schritt 1
IncidentApiKey=inck_live_xxxxxxxxxxxxx

# Team ID (aus incident.io URL: app.incident.io/team/TENER_ID)
IncidentTeamId=

# Automatisch Incidents erstellen
IncidentAutoCreate=True

# Mindest-Schweregrad für Auto-Create
IncidentSeverityThreshold=warning

# Benachrichtigungs-Kanäle (teams,discord)
IncidentNotifyChannels=teams,discord

# Discord Webhook URL (optional)
IncidentDiscordWebhook=https://discord.com/api/webhooks/xxxxx

# MS Teams Webhook (optional, falls nicht über incident.io)
IncidentTeamsWebhook=

# Prüf-Intervall in Sekunden
IncidentMonitorIntervalSeconds=60

# DB-Fehler überwachen
IncidentDBCheckEnabled=True
```

### 3. Verwendung

```powershell
# Importieren des Moduls
. ./Core/GooseIncident.ps1

# Incident manuell erstellen
New-GooseIncident -Title "Database Error" -Description "Supabase timeout" -Severity "high"

# Incidents abrufen
Get-GooseIncidents

# Monitoring starten (prüft Logs automatisch)
Start-IncidentMonitor

# Monitoring stoppen
Stop-IncidentMonitor

# Verbindung testen
Test-GooseIncident
```

### 4. Automatische Incident-Erkennung

Das Modul überwacht automatisch die Log-Datei (`logs/goose.log`) und erstellt Incidents bei:

| Fehlertyp | Severity |
|-----------|----------|
| 404, Not Found | Warning |
| 500, Exception, Crash | Critical |
| 403, Forbidden | Medium |
| Timeout, Connection Refused | High |

### 5. Severity-Mapping

Der Schwellwert in `config.ini` bestimmt, ab welchem Level ein Incident erstellt wird:

```ini
IncidentSeverityThreshold=warning  # Alle Fehler
IncidentSeverityThreshold=high     # Ab High
IncidentSeverityThreshold=critical # Nur Critical
```

---

## Supabase Auth Setup

### 1. Auth aktivieren

Die Supabase Auth ist bereits in der Backend-Installation enthalten. Konfiguriere die Anwendung:

```ini
# Session-Speicherung aktivieren
SessionSaveEnabled=True

# Session-Datei (verschlüsselt mit DPAPI)
SessionFilePath=data/session.enc

# Automatisches Token-Refresh
AutoRefreshSession=True
```

### 2. Supabase Keys

Stelle sicher, dass diese Werte in `config.ini` gesetzt sind:

```ini
SupabaseUrl=http://localhost:8000
SupabaseAnonKey=your-anon-key
```

### 3. Verwendung

```powershell
# Importieren des Moduls
. ./Core/GooseAuth.ps1

# Benutzer registrieren
Register-GooseUser -Email "user@team.com" -Password "password"

# Benutzer anmelden
Connect-GooseUser -Email "user@team.com" -Password "password"

# Session prüfen (wird beim Start automatisch geladen)
Test-GooseSession

# Aktuellen Benutzer abrufen
Get-GooseUser

# Abmelden
Disconnect-GooseUser
```

### 4. Session-Management

- Sessions werden verschlüsselt mit Windows DPAPI gespeichert
- Token werden automatisch vor Ablauf erneuert
- Bei Ablauf wird der Benutzer zur erneuten Anmeldung aufgefordert

---

## Vollständige config.ini Beispiel

```ini
# ============================================
# SUPABASE BACKEND
# ============================================
CloudSyncEnabled=True
SupabaseUrl=http://localhost:8000
SupabaseAnonKey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SupabaseServiceKey=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
DeviceName=Desktop-Goose

# ============================================
# AUTHENTICATION
# ============================================
SessionSaveEnabled=True
SessionFilePath=data/session.enc
AutoRefreshSession=True

# ============================================
# INCIDENT MANAGEMENT
# ============================================
IncidentEnabled=True
IncidentApiKey=inck_live_xxxxxxxxxxxxx
IncidentTeamId=
IncidentAutoCreate=True
IncidentSeverityThreshold=warning
IncidentNotifyChannels=teams,discord
IncidentDiscordWebhook=https://discord.com/api/webhooks/xxxxx
IncidentTeamsWebhook=
IncidentMonitorIntervalSeconds=60
IncidentDBCheckEnabled=True
```

<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
