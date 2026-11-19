# Vercel Clone

YouTube Video Link: https://youtu.be/0A_JpLYG7hM

Whiteboard Diagram: https://app.eraser.io/workspace/0f8XnDF61iGcatypPqIR?origin=share

### Prerequisite

- Node.JS: [Master NodeJS Playlist](https://youtube.com/playlist?list=PLinedj3B30sDby4Al-i13hQJGQoRQDfPo&si=5gaDmQ_mzuBHvAsg)
- Redis: [Redis Crash Course](https://youtu.be/Vx2zPMPvmug?si=Z_XT6BMNgkgwnX49)
- Learn Docker:
  - Part 1: [Docker in One Shot - Part 1](https://youtu.be/31k6AtW-b3Y?si=FIPffAKieiBGgo5c)
  - Part 2: [Docker in One Shot - Part 2](https://youtu.be/xPT8mXa-sJg?si=-6z_HkJZXsvrvSpO)
- Docker with AWS ECS and ECR: [Real World Docker Deployments with AWS](https://youtu.be/AiiFbsAlLaI?si=dKrFZFr7fLBXKSab)

### Setup Guide

This Project contains following services and folders:

- `api-server`: HTTP API Server for REST API's
- `build-server`: Docker Image code which clones, builds and pushes the build to S3
- `s3-reverse-proxy`: Reverse Proxy the subdomains and domains to s3 bucket static assets

### Local Setup

1. Run `npm install` in all the 3 services i.e. `api-server`, `build-server` and `s3-reverse-proxy`
2. Docker build the `build-server` and push the image to AWS ECR.
3. Setup the `api-server` by providing all the required config such as TASK ARN and CLUSTER arn.
4. Run `node index.js` in `api-server` and `s3-reverse-proxy`

At this point following services would be up and running:

| S.No | Service            | PORT    |
| ---- | ------------------ | ------- |
| 1    | `api-server`       | `:9000` |
| 2    | `socket.io-server` | `:9002` |
| 3    | `s3-reverse-proxy` | `:8000` |

### Demo

[Watch The Demo Video](https://imgur.com/I6KgmNR)

### Architecture

![Vercel Clone Architecture](https://i.imgur.com/r7QUXqZ.png)

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
