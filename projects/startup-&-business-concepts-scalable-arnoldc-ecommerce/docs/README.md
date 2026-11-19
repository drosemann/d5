# Project Documentation

Welcome to the documentation for the Arnold Commerce platform. This documentation is designed to help you understand, develop, and maintain the e-commerce solution.

## Documentation Structure

### Architecture
- [System Architecture](./architecture/system-architecture.md)
- [Database Schema](./architecture/database-schema.md)
- [API Design](./architecture/api-design.md)

### API Reference
- [Authentication API](./api/authentication.md)
- [Products API](./api/products.md)
- [Cart API](./api/cart.md)
- [Orders API](./api/orders.md)
- [Users API](./api/users.md)

### Guides
- [Getting Started](./guides/getting-started.md)
- [Authentication Flow](./guides/authentication-flow.md)
- [Deployment Guide](./guides/deployment.md)

### Examples
- [API Examples](./examples/api-examples.md)
- [Frontend Integration](./examples/frontend-integration.md)

## Contributing

Please read our [contribution guidelines](./CONTRIBUTING.md) before submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE) file for details.

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
