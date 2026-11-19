<!-- Use this file to provide workspace-specific custom instructions to Copilot -->

# Shortify Project Instructions

This is a PHP-based URL shortener project using MariaDB and NGINX. When working with this codebase:

1. Follow PSR-4 autoloading standards for PHP classes
2. Use prepared statements for all database queries to prevent SQL injection
3. Implement proper input validation for URLs
4. Maintain URL visit tracking functionality
5. Keep the Docker configuration synchronized across Dockerfile, docker-compose.yml, and nginx.conf
6. Follow RESTful principles for API endpoints
7. Maintain responsive design in the frontend HTML/CSS
8. Ensure proper error handling and logging
9. Keep security best practices in mind, especially for URL validation and database access

Key components:
- URLShortener class handles the core URL shortening logic
- Database schema includes urls table with visit tracking
- Frontend uses vanilla JavaScript for API interactions
- Docker setup includes PHP-FPM, NGINX, and MariaDB containers
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
