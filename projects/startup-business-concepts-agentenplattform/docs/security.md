# Sicherheit & Konfiguration
- Keine Default-Passwörter; `.env` nie committen (nur `.env.example`).
- Secrets als Dateimounts/Docker-Secrets; Anzeige nur „gesetzt/nicht gesetzt".
- Rate-Limit am Login, JWT-Sessions, CSRF bei Cookies, Audit-Log für `task.created`, Logins, Freigaben.
- SSRF-Schutz im Browser-Tool; Upload-Limits (15 MB, Allowlist); Mail-Absender strikt geprüft.
- Sicherer Standardmodus: externe/kritische Aktionen brauchen Freigabe; Mail- und SOS-Versand standardmäßig aus (Testmodus).

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
