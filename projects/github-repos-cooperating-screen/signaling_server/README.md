# Cooperating Screen Signaling Server

Node.js WebSocket signaling server used by the Cooperating Screen clients.

## Features

- WebSocket signaling for device registration and pairing
- WebRTC SDP/ICE message relay
- Health and stats endpoints
- Basic in-memory request and message rate limiting

## Setup

```bash
cd signaling_server
npm install
cp .env.example .env
npm run dev
```

## Run

```bash
npm start
```

Default endpoint: `ws://localhost:3000`

## Docker

```bash
docker build -t cooperating-screen-signaling-server .
docker run -p 3000:3000 cooperating-screen-signaling-server
```

Or from repo root (backend + web UI):

```bash
docker-compose up --build
```

## Endpoints

- `GET /health`
- `GET /stats`

## Notes

For broader setup and repository policies, see [../README.md](../README.md).

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
