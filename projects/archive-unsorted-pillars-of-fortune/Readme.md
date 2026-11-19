# Pillars of Fortune - Minecraft Plugin

A Spigot/Paper plugin that automatically gives players random items at configurable intervals, creating a "Pillars of Fortune" gameplay experience.

## Features

- **Automatic Item Distribution**: Players receive random items every few seconds
- **Fully Configurable**: Customize timing, item amounts, and which items to include/exclude
- **Player Control**: Players can toggle the feature on/off with `/fortune toggle`
- **Rich Feedback**: Configurable chat messages, titles, and sound effects
- **Safe by Default**: Excludes dangerous items like bedrock, barriers, and command blocks
- **Paper 1.21.5 Compatible**: Built specifically for the latest Minecraft version

## Installation

1. **Prerequisites**:
   - Java 21 or higher
   - Maven (for building)
   - Paper server 1.21.5

2. **Building the Plugin**:
   ```bash
   git clone <your-repo-url>
   cd pillars-of-fortune
   mvn clean package
   ```

3. **Installation**:
   - Copy the generated JAR file from `target/pillars-of-fortune-1.0.0.jar`
   - Place it in your server's `plugins/` folder
   - Restart your server

## Configuration

The plugin creates a `config.yml` file in the `plugins/PillarsOfFortune/` folder:

### Basic Settings
- `item-drop-interval`: Time in seconds between item drops (default: 5)
- `max-items-per-drop`: Maximum items given at once (1-64, default: 1)
- `min-items-per-drop`: Minimum items given at once (1-64, default: 1)

### Feedback Settings
- `send-title-message`: Show title when receiving items (default: true)
- `send-chat-message`: Show chat message when receiving items (default: true)
- `play-sound`: Play sound effect when receiving items (default: true)
- `sound-effect`: Sound to play (default: "ENTITY_EXPERIENCE_ORB_PICKUP")

### Item Control
- `exclude-dangerous-items`: Exclude admin/dangerous items (default: true)
- `excluded-items`: List of specific items to exclude
- `included-items`: If specified, ONLY these items will be used

### Message Customization
All messages support color codes using `&` (e.g., `&a` for green, `&c` for red):
- `item-received`: Message when receiving items
- `fortune-enabled`: Message when enabling fortune
- `fortune-disabled`: Message when disabling fortune
- `title-received`: Title text
- `subtitle-received`: Subtitle text

## Commands

- `/fortune toggle` - Toggle Pillars of Fortune on/off for yourself
- `/fortune` - Same as toggle
- `/pof` - Alias for fortune command

## Permissions

- `pillarsoffortune.toggle`: Allow toggling fortune (default: true)
- `pillarsoffortune.admin`: Admin permissions (default: op)

## How It Works

1. **Automatic Activation**: The plugin starts automatically when loaded
2. **Player Opt-in**: Players must use `/fortune toggle` to enable it for themselves
3. **Random Items**: Every configured interval, enabled players receive random items
4. **Inventory Management**: Items go to inventory first, then drop on ground if full
5. **Feedback**: Players receive visual and audio feedback when getting items

## Default Excluded Items

The plugin excludes these potentially problematic items by default:
- Bedrock, Barriers, Command Blocks
- Structure blocks, Debug sticks
- Spawners, Knowledge books
- Other admin/creative-only items

## Customization Examples

### Include Only Basic Items
```yaml
included-items:
  - APPLE
  - BREAD
  - COOKED_BEEF
  - DIAMOND
  - GOLD_INGOT
  - IRON_INGOT
```

### Faster Drop Rate
```yaml
item-drop-interval: 2
max-items-per-drop: 3
min-items-per-drop: 1
```

### Quiet Mode
```yaml
send-title-message: false
send-chat-message: true
play-sound: false
```

## Development

### Project Structure
```
src/main/
├── java/com/yourname/pillarsoffortune/
│   └── PillarsOfFortune.java
└── resources/
    ├── plugin.yml
    └── config.yml
```

### Building
```bash
mvn clean package
```

### API Version
This plugin uses Paper API 1.21.5-R0.1-SNAPSHOT and requires Java 21.

## Support

If you encounter issues:
1. Check the server console for error messages
2. Verify your configuration file syntax
3. Ensure you're using Paper 1.21.5
4. Check that players have the required permissions

## License

This project is open source. Feel free to modify and redistribute according to your needs.
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
