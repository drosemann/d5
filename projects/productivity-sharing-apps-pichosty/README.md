# PicHosty - Image Hosting Platform

## Overview
PicHosty is a user-friendly image hosting platform that allows users to upload, manage, and share images with ease.

## Features
- Image Upload
- Image Galleries
- Direct Linking
- Private Access Control
- API for Third-Party Integration

## Planned Future Features
- Image Compression
- Automatic Tagging
- Advanced Analytics Tools

## Setup Instructions
1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Set up environment variables
4. Run the application: `python app.py`

## Running PicHosty on Debian 12 with Screen

To run PicHosty on a Debian 12 server using `screen`, follow these steps:

1. **Install Dependencies**
   
   Make sure you have Python and pip installed on your server. You can install them using:
   ```bash
   sudo apt update
   sudo apt install python3 python3-pip python3-venv
   ```

2. **Move the Project to `/var/www/html/picHosty`**
   
   Ensure you have the necessary permissions and move your project files:
   ```bash
   sudo mv /path/to/your/local/picHosty /var/www/html/picHosty
   cd /var/www/html/picHosty
   ```

3. **Set Up Virtual Environment**
   
   Create and activate a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

4. **Install Required Packages**
   
   Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

5. **Configure Environment Variables**
   
   Copy the `.env` file and set your environment variables as needed.

6. **Start a Screen Session**
   
   Start a new screen session:
   ```bash
   screen -S picHosty
   ```

7. **Run the Application**
   
   Inside the screen session, run the Flask application:
   ```bash
   flask run --host=0.0.0.0 --port=5000
   ```
   This will start the application, accessible on your server's IP address at port 5000.

8. **Detach from Screen**
   
   To detach from the screen session and leave the application running in the background, press `Ctrl + A`, then `D`.

9. **Reattach to Screen**
   
   To reattach to your screen session later, use:
   ```bash
   screen -r picHosty
   ```

10. **Stop the Application**
    
    To stop the application, reattach to the screen session and press `Ctrl + C`.

This setup allows you to run PicHosty on a Debian 12 server, ensuring it continues running even if you disconnect from the server.

## API Documentation
Detailed API documentation coming soon.

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
