# Agentenplattform – private KI-Plattform
Persönliche, modulare KI-Agentenplattform (Docker Compose, Linux).

**Start (Entwicklung/Test):** `docker compose up --build`
**Doku:** [docs/](docs/architecture.md) · **Status:** [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md)

- PWA-Dashboard (deutsch), FastAPI-Backend, PostgreSQL, Redis, Worker
- Zentrales Modell-Gateway (Ollama/OpenAI/kompatibel), kein Agent ruft Provider direkt
- Deterministische Sicherheit: Freigaben, Audit, Least Privilege, Demo-/Testmodus für Mail & SOS
- Kein Deploy in diesem Repo-Schritt; siehe [docs/deployment-linux.md](docs/deployment-linux.md)

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
