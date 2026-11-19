# CloudNest Setup Guide

This guide will help you set up the CloudNest platform on a Debian 12 server using a screen session. Follow the steps below to get started.

## Prerequisites

- A Debian 12 server
- Root or sudo access to the server
- `git`, `python3`, `pip`, and `screen` installed on the server

## Installation Steps

### 1. Update the System

First, ensure your system is up to date:

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Required Packages

Install the necessary packages:

```bash
sudo apt install -y git python3 python3-pip screen
```

### 3. Clone the Repository

Clone the CloudNest repository to your server:

```bash
git clone <repository-url> /opt/cloudnest
cd /opt/cloudnest
```

### 4. Set Up a Python Virtual Environment

Create and activate a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```

### 5. Install Python Dependencies

Install the required Python packages:

```bash
pip install -r requirements.txt
```

### 6. Start the Application in a Screen Session

Start a new screen session and run the application:

```bash
screen -S cloudnest
FLASK_APP=src/app.py flask run --host=0.0.0.0 --port=5000
```

To detach from the screen session, press `Ctrl + A` followed by `D`.

### 7. Access the Application

Open a web browser and navigate to `http://<your-server-ip>:5000` to access the CloudNest platform.

## Additional Notes

- To reattach to the screen session, use `screen -r cloudnest`.
- Ensure that any firewall rules allow traffic on port 5000.

For further assistance, please refer to the official documentation or contact support.

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
