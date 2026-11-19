# Modern Guestbook

A modern, feature-rich guestbook application built with PHP, JavaScript, and MySQL.

## Features

- Clean, responsive design
- Real-time message updates
- Rich text formatting with BBCode support
- Emoji support
- File attachments
- Anti-spam protection
- Message scheduling
- Search functionality
- Visitor statistics

## Prerequisites

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx)
- Modern web browser

## Installation

1. Clone the repository: 

2. Create a MySQL database and import the schema:

3. Configure the database connection:
   - Copy `config.php.example` to `config.php`
   - Update the database credentials in `config.php`

4. Set up your web server:
   - Point your web server to the project's root directory
   - Ensure the `uploads` directory is writable by the web server

## Configuration

- Rate limiting: Adjust timing in `php/save_entry.php`
- Entries per page: Modify `$per_page` in `php/get_entries.php`
- Maximum upload size: Configure in your PHP settings
- WebSocket server: Update URL in `js/main.js`

## Usage

1. Access the guestbook through your web browser
2. Fill out the form with your name, email, and message
3. Use the formatting toolbar to style your message
4. Submit your entry

## Security Features

- XSS protection
- CSRF protection
- Rate limiting
- Input validation
- Prepared SQL statements

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Inter](https://rsms.me/inter/) font family
- [PHP PDO](https://www.php.net/manual/en/book.pdo.php) for database operations
- Modern browser APIs for real-time features

## Support

For support, please open an issue in the GitHub repository or contact [your@email.com]
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
