# SpeedSnap

SpeedSnap is a service that provides precise measurement of internet speed with a focus on user-friendliness and accuracy. Users can quickly and easily test their download, upload, and ping values. The service displays detailed results with comparison options to other users and ISPs.

## Features
- Test download, upload, and ping speeds
- User-friendly web interface
- Detailed results display

## Requirements
- Python 3.11 or later
- pip
- screen (for running the service in the background)

## Installation

1. **Clone the repository**:
 
git clone <repository-url>
cd SpeedSnap


2. **Install dependencies**:

pip install -r requirements.txt


## Running the Service

1. **Start a `screen` session**:

screen -S speedsnap


2. **Run the Flask application**:

python app.py


3. **Detach from the `screen` session**:
   Press `Ctrl + A`, then `D` to detach.

4. **Reattach to the `screen` session** (if needed):

screen -r speedsnap


## Accessing the Service

- Open a web browser and go to `http://<server-ip>:7000` to access the SpeedSnap interface.

## Additional Information

- To stop the service, reattach to the `screen` session and terminate the process with `Ctrl + C`.
- Ensure that your firewall allows traffic on port 7000 if accessing the service remotely.

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
