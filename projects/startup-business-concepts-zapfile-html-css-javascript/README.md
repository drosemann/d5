# ZapFile

A lightning-fast file sharing solution that allows users to quickly share files with automatic 30-day expiration.

## Features
- Quick file uploads up to 500MB per IP address
- Secure file sharing with unique URLs
- Automatic file deletion after 30 days
- IP-based upload tracking
- Simple and intuitive interface
- Automated security scanning system
  - Suspicious file extension detection
  - File size anomaly detection
  - Email notifications for suspicious uploads

## Setup
1. Configure your web server with PHP support
2. Create a MySQL database and import the schema
3. Update database credentials in `includes/config.php`
4. Configure admin email in `includes/security_scanner.php`
5. Ensure the `uploads` directory has write permissions
6. Configure PHP mail server settings
7. Ready to use!

## Requirements
- PHP 7.4+
- MySQL 5.7+
- Apache/Nginx web server
- Configured PHP mail server

## Security Features
The system automatically scans uploaded files and sends email notifications when:
- Potentially dangerous file extensions are detected
- Files exceed normal size thresholds
- Other suspicious patterns are identified

## Configuration
You can customize security settings in `includes/security_scanner.php`:
- Modify list of suspicious file extensions
- Adjust file size thresholds
- Update admin email address

## License
This project is licensed under the MIT License - see the LICENSE file for details.
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
