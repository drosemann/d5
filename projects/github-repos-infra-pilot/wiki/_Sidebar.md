# Infra Pilot Wiki

- [Home](Home.md)
- [Installation](01-Installation.md)
- [First Deployment](02-First-Deployment.md)
- [Configuration](03-Configuration.md)
- [Usage Examples](04-Usage-Examples.md)
- [CLI Reference](05-CLI-Reference.md)
- [Architecture](06-Architecture.md)
- [Contributing](07-Contributing.md)
- [Security](08-Security.md)
- [FAQ](09-FAQ.md)
- [Troubleshooting](10-Troubleshooting.md)
- [Auth Matrix](11-Auth-Matrix.md)
- [Backup & Restore](12-Backup-Restore.md)
- [Update Flow](13-Update-Flow.md)
- [Two-Factor Auth](14-Two-Factor-Auth.md)

## Quick Links

| Feature | CLI Command |
| --------- | ------------- |
| GitOps | `ipilot gitops *` |
| SSH | `ipilot ssh *` |
| Inventory | `ipilot inventory *` |
| Secrets | `ipilot secrets *` |
| Templates | `ipilot templates *` |
| Plugins | `ipilot plugins *` |
| Webhooks | `ipilot webhooks *` |
| API Keys | `ipilot apikeys *` |
| Runbooks | `ipilot runbook *` |
| Doctor | `ipilot doctor` |
| TUI | `ipilot tui *` |
| Rollback | `ipilot rollback *` |

---

## Links

- [GitHub](https://github.com/drosemann/infra-pilot)
- [Issues](https://github.com/drosemann/infra-pilot/issues)
- [Discussions](https://github.com/drosemann/infra-pilot/discussions)
- [MIT License](https://github.com/drosemann/infra-pilot/blob/main/LICENSE)

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
