# FAQ

**What is Infra Pilot?**
A tool that runs your apps and servers. You use it from the command line, a web page, or Discord.

**Why not just Terraform or Pulumi?**
Infra Pilot works on top of them. It adds AI features, Discord control, energy tracking, and a web interface.

**I get "Connection failed" on `ipilot doctor doctor`?**
Check `docker compose ps`. Set the correct URL: `export IPILOT_API_URL=http://localhost:3001`.

**Can I run just some services?**
Yes. `docker compose up -d postgres redis`.

**How do I change the output format?**
`export IPILOT_OUTPUT=json` (or `ipilot --output json <command>`).

**Many commands — how do I remember them?**
Use `ipilot --help` for the main list. Use `ipilot <command> --help` for details.

**Can I work offline?**
Yes. Use a local AI (Ollama, LM Studio). Set `AI_API_ENDPOINT` in `.env`.

---

*[Issues](https://github.com/drosemann/infra-pilot/issues) · [Discussions](https://github.com/drosemann/infra-pilot/discussions)*

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
