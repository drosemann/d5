# Tamagotchi Game

A browser-based virtual pet adventure featuring backend storage and real-time status tracking.

## Setup Instructions

1. Update your system and install dependencies:
    ```bash
    sudo apt update
    sudo apt install -y nodejs npm mongodb
    ```

2. Clone the repository and install backend packages:
    ```bash
    git clone https://github.com/yourusername/tamagotchi-game.git
    cd tamagotchi-game/backend
    npm install
    ```

3. Configure your environment:
    ```bash
    cp ../.env.example .env
    nano .env  # Set your custom values
    ```

4. Start the MongoDB service:
    ```bash
    sudo systemctl start mongodb
    ```

5. Launch the server:
    ```bash
    npm start
    ```

## Custom Avatars

- Place images in the `frontend/public/images/avatars/` folder.
- Supported image formats: PNG, JPG, and SVG.
- Use CSS/HTML to integrate avatars:
    ```css
    background-image: url('/images/avatars/your-image.png');
    ```

## Features

- Integrated MongoDB database
- User authentication via JWT
- Dynamic virtual pet status decay
- RESTful API for game actions
- Responsive user interface
- Placeholder images and avatar support
- Environment-driven configuration
- Automated status updates

## Future Enhancements

- Implement age progression and evolution stages
- Add mini-games and an achievement system
- Introduce social interactions and mobile responsiveness
- Expand feature set with community-driven improvements
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
