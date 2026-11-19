# SecureStream VPN Setup Guide

This guide provides instructions on setting up the SecureStream VPN server and client application on a Debian 12 system using a `screen` session. It also includes steps to generate the client application package.

## Prerequisites

- Debian 12 system
- Root or sudo access
- `screen` installed (install with `sudo apt-get install screen`)
- Node.js and npm installed (install with `sudo apt-get install nodejs npm`)

## Setting Up the VPN Server

1. **Start a Screen Session:**

screen -S vpn-setup


2. **Run the Server Setup Script:**

bash server-setup.sh

   This script will install OpenVPN, set up the Certificate Authority, and configure the VPN server.

3. **Detach from the Screen Session:**
   Press `Ctrl + A`, then `D` to detach from the screen session.

## Setting Up the Client Application

1. **Navigate to the Client Directory:**

cd client


2. **Install Dependencies:**

npm install


3. **Start the Electron Application:**

npm start

## Generating the Client Application Package

1. **Install Electron Packager:**

npm install electron-packager -g


2. **Package the Application:**

electron-packager . SecureStreamVPN --platform=linux --arch=x64 --out=dist/

   This command will generate the application package in the `dist/` directory.

## Reattaching to the Screen Session

- To reattach to the screen session, use:

screen -r vpn-setup


## Notes

- Ensure all commands are run with the necessary permissions.
- The client application uses Electron and requires a graphical environment to run.
- For further customization, modify the configuration files as needed.

For any issues or further assistance, please contact the support team.

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
