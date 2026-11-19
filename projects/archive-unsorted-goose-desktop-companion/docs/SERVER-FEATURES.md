# Server-seitige Features Übersicht

Dieses Dokument beschreibt die erweiterten server-seitigen Features für Goose Desktop Companion, die auf dem Supabase Self-Hosted Backend aufbauen.

## Architektur

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         Goose Desktop Companion Client                                  │
│  ┌──────────┐  ┌──────────────┐  ┌─────────┐  ┌──────────┐  ┌───────────┐  │
│  │Analytics │  │Notifications │  │ Security│  │  Sync    │  │  Plugin   │  │
│  │          │  │              │  │         │  │          │  │  Manager   │  │
│  └────┬─────┘  └──────┬───────┘  └────┬────┘  └────┬─────┘  └─────┬─────┘  │
└───────┼───────────────┼───────────────┼────────────┼──────────────┼────────┘
        │               │               │            │              │
        ▼               ▼               ▼            ▼              ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                         Supabase Backend                                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐  ┌────────────────┐ │
│  │   REST API  │  │  PostgreSQL │  │     Realtime    │  │Edge Functions │ │
│  │  (PostgREST)│  │  Database   │  │   Channels     │  │  (Server)     │ │
│  └─────────────┘  └─────────────┘  └─────────────────┘  └────────────────┘ │
│                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Phase 4: Plugin & Marketplace                      │   │
│  │   • Plugin Registry   • Marketplace API   • User Content            │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                    Phase 5: Multiplayer & Streamer                    │   │
│  │   • Multiplayer Hub   • Stream Events   • Leaderboards              │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Features Übersicht

### Authentication & Security
| Feature | Beschreibung | Dokumentation |
|---------|--------------|---------------|
| Supabase Auth | User-Authentifizierung | [backend-setup.md](./backend-setup.md) |
| Session Management | Verschlüsselte Token-Speicherung | [backend-setup.md](./backend-setup.md) |
| Auto-Refresh | Automatisches Token-Refresh | [backend-setup.md](./backend-setup.md) |

### Incident Management
| Feature | Beschreibung | Dokumentation |
|---------|--------------|---------------|
| incident.io Integration | Automatisches Incident-Tracking | [backend-setup.md](./backend-setup.md) |
| Team Notifications | MS Teams & Discord Webhooks | [backend-setup.md](./backend-setup.md) |
| DB Error Monitoring | Auto-Detect von Crashes/Fehlern | [backend-setup.md](./backend-setup.md) |
| Severity Levels | Critical/High/Medium/Low/Warning | [backend-setup.md](./backend-setup.md) |

### Phase 4: Plugin & Marketplace
| Feature | Beschreibung | Dokumentation |
|---------|--------------|---------------|
| Plugin Registry | Plugin-Verwaltung | [SERVER-PLUGIN-API.md](./SERVER-PLUGIN-API.md) |
| Marketplace | Skins, Plugins, Themes | [SERVER-MARKETPLACE.md](./SERVER-MARKETPLACE.md) |
| Plugin Upload | Einreichen eigener Plugins | [SERVER-PLUGIN-API.md](./SERVER-PLUGIN-API.md) |
| Plugin Ratings | Bewertungssystem | [SERVER-MARKETPLACE.md](./SERVER-MARKETPLACE.md) |

### Phase 5: Multiplayer & Streamer
| Feature | Beschreibung | Dokumentation |
|---------|--------------|---------------|
| Multiplayer | Freunde, Nachrichten, Besuche | [SERVER-MULTIPLAYER.md](./SERVER-MULTIPLAYER.md) |
| Realtime | Echtzeit-Kommunikation | [SERVER-MULTIPLAYER.md](./SERVER-MULTIPLAYER.md) |
| Streamer Mode | Twitch/YouTube Integration | [SERVER-STREAMER.md](./SERVER-STREAMER.md) |
| Webhooks | Event-Verarbeitung | [SERVER-STREAMER.md](./SERVER-STREAMER.md) |
| Chaos Events | Streamer-Chaos | [SERVER-STREAMER.md](./SERVER-STREAMER.md) |

### Core Features
| Feature | Beschreibung |
|---------|--------------|
| Supabase Auth | User-Authentifizierung mit Email/Password |
| Session Management | DPAPI-verschlüsselte Token-Speicherung |
| Cloud Sync | Datensynchronisation |
| Analytics | Metriken, Goals, Achievements |
| Notifications | Push, Webhooks, Scheduled Tasks |
| Security | OAuth, API Keys, Audit Logs |

---

## Datenbank Schema (Phase 4 & 5)

### Plugin & Marketplace

```sql
-- Plugin Registry
CREATE TABLE plugin_registry (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plugin_id VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    author VARCHAR(255),
    version VARCHAR(50),
    category VARCHAR(50),
    download_url TEXT,
    downloads INTEGER DEFAULT 0,
    rating DECIMAL(3,2) DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Marketplace Ratings
CREATE TABLE marketplace_ratings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plugin_id VARCHAR(100),
    user_id UUID,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    UNIQUE(plugin_id, user_id)
);
```

### Multiplayer

```sql
-- Multiplayer Friends
CREATE TABLE multiplayer_friends (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id),
    friend_code VARCHAR(6) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending'
);

-- Messages
CREATE TABLE multiplayer_messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    from_user_id UUID,
    to_user_id UUID,
    message_type VARCHAR(50),
    content TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Active Sessions
CREATE TABLE active_sessions (
    user_id UUID PRIMARY KEY,
    connection_code VARCHAR(6),
    status VARCHAR(50) DEFAULT 'online',
    last_seen TIMESTAMPTZ DEFAULT NOW()
);
```

### Streamer

```sql
-- Streamer Config
CREATE TABLE streamer_config (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) UNIQUE,
    platform VARCHAR(50),
    channel_name VARCHAR(255),
    chaos_enabled BOOLEAN DEFAULT true,
    min_donation_for_chaos DECIMAL(10,2) DEFAULT 5
);

-- Stream Events
CREATE TABLE stream_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    platform VARCHAR(50),
    event_type VARCHAR(50),
    username VARCHAR(255),
    amount DECIMAL(10,2),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Custom Commands
CREATE TABLE streamer_commands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID,
    command VARCHAR(100),
    response TEXT,
    chaos_enabled BOOLEAN DEFAULT false
);
```

---

## Schnellstart

### 1. Datenbank aktualisieren

Führen Sie das aktualisierte SQL-Schema aus:

```bash
docker exec -i goose-supabase-db psql -U postgres < supabase-setup.sql
```

### 2. Konfiguration

Aktivieren Sie die Features in `config.ini`:

```ini
# Supabase Backend
CloudSyncEnabled=True
SupabaseUrl=http://localhost:8000
SupabaseAnonKey=your-anon-key
SupabaseServiceKey=your-service-key

# Authentication
SessionSaveEnabled=True
SessionFilePath=data/session.enc
AutoRefreshSession=True

# Incident Management
IncidentEnabled=True
IncidentApiKey=inck_live_xxxxxxxxxxxxx
IncidentAutoCreate=True
IncidentSeverityThreshold=warning
IncidentNotifyChannels=teams,discord
IncidentDiscordWebhook=
IncidentTeamsWebhook=
IncidentDBCheckEnabled=True

# Analytics & Reporting
AnalyticsEnabled=True
AnalyticsAutoReport=True
AnalyticsDays=7

# Notifications & Events  
NotificationsEnabled=True
WebPushEnabled=True

# Security & Storage
SecurityEnabled=True
ApiKeyRateLimit=100
```

### 3. Module laden

```powershell
# Authentication
. "$PSScriptRoot\Core\GooseAuth.ps1"

# Incident Management
. "$PSScriptRoot\Core\GooseIncident.ps1"

# Analytics
. "$PSScriptRoot\Analytics\goose-analytics.ps1"

# Notifications
. "$PSScriptRoot\Notifications\goose-notifications.ps1"

# Security
. "$PSScriptRoot\Security\goose-security.ps1"
```

---

## Feature-Details

| Feature | Beschreibung | Konfiguration |
|---------|--------------|---------------|
| Supabase Auth | User-Login, Registration | `SessionSaveEnabled` |
| Incident Management | incident.io Integration | `IncidentEnabled` |
| Analytics | Metriken, Goals, Achievements | `AnalyticsEnabled` |
| Notifications | Push, Webhooks, Scheduled Tasks | `NotificationsEnabled` |
| Security | OAuth, API Keys, Audit Logs | `SecurityEnabled` |

Weitere Details finden Sie in den einzelnen Dokumentationsdateien.

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
