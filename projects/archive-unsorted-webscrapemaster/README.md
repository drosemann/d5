# WebScrapeMaster

WebScrapeMaster is a flexible web scraping tool with a user-friendly web interface. It allows users to input a URL, automatically discovers linked URLs, and processes them to store results in a `.txt` file.

## Features
- URL input interface
- Automatic URL discovery and collection
- Data processing and storage
- User access control
- Data export options (CSV, Excel, JSON, XML)
- Scheduled scraping tasks
- Basic data visualization
- Enhanced error handling and logging
- Proxy support for scraping
- Data cleaning and transformation
- Dashboard for monitoring tasks
- API integration for task management
- Notification system for task alerts

## Installation and Setup on Debian 12 Server

### Prerequisites
- Python 3.x
- pip
- screen
- matplotlib

### Steps
1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd WebScrapeMaster
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the application in a screen session:**
   ```bash
   screen -S webscrapemaster
   python app.py
   ```
   - To detach from the screen session, press `Ctrl + A` followed by `D`.
   - To reattach to the screen session, use:
     ```bash
     screen -r webscrapemaster
     ```

4. **Access the application:**
   Open a web browser and navigate to `http://<server-ip>:5000`.

## Additional Setup Instructions

### Scheduled Scraping
- Ensure the `scheduler.py` module is configured with the desired intervals for scraping tasks.

### Proxy Support
- Configure the `proxy_support.py` module with a list of proxies to use for scraping.

### Data Visualization
- Ensure `matplotlib` is installed for data visualization features.

### Authentication
- Set up user credentials in `authentication.py` for access control.

### API Integration
- Configure API endpoints in `api_integration.py` for external access.

### Notification System
- Set up notification preferences in `notification_system.py` for alerts.

## Usage
- Enter a URL in the input field and submit.
- The application will process the URL and display a confirmation message.

## Contributing
Feel free to fork this project and submit pull requests.

## License
This project is licensed under the MIT License.

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
