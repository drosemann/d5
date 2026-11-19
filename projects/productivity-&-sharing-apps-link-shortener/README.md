# Shortify - URL Shortener

A simple and efficient URL shortener service built with PHP, MariaDB, and NGINX.

## Features

- Shorten long URLs to manageable links
- Track visit counts for each shortened URL
- Docker-based development environment
- NGINX for efficient request handling
- MariaDB for reliable data storage

## Requirements

- Docker
- Docker Compose
- Git

## Quick Start

1. Clone the repository:
```bash
git clone <your-repository-url>
cd shortify
```

2. Start the Docker containers:
```bash
docker-compose up -d
```

3. Access the application:
Open your browser and navigate to `http://localhost`

## Development Setup

The project uses Docker for development. The setup includes:
- PHP 8.1 with FPM
- MariaDB latest
- NGINX Alpine

### Database Structure

The database automatically initializes with the required table structure:
- `urls` table for storing original URLs and their shortened codes
- Visit tracking for each shortened URL

### Environment Variables

Database configuration can be customized through environment variables:
- `DB_HOST`: Database host (default: localhost)
- `DB_NAME`: Database name (default: shortify)
- `DB_USER`: Database user (default: root)
- `DB_PASS`: Database password
- `DB_PORT`: Database port (default: 3306)

## Production Deployment

For production deployment:

1. Update the NGINX configuration in `docker/nginx.conf` with your domain.
2. Set secure database credentials in docker-compose.yml
3. Enable HTTPS by adding SSL certificates to the NGINX configuration
4. Deploy using Docker Compose:
```bash
docker-compose -f docker-compose.yml up -d
```

## Security Considerations

- Always use HTTPS in production
- Set strong database passwords
- Regularly update dependencies
- Monitor server resources and logs

## License

MIT License
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
