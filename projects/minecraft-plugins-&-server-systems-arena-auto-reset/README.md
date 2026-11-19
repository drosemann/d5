# Arena Reset Plugin for Minecraft

The **Arena Reset Plugin** is a powerful tool for Minecraft server administrators. It automatically resets a PvP arena at regular intervals, ensuring a fresh and fair battleground for players. This plugin is designed for Minecraft servers running version 1.21 or higher.

## Features
- Automatically resets a defined arena region.
- Configurable reset intervals (default: 10 minutes).
- Teleports players out of the arena before resetting.
- Supports custom arena sizes and locations.
- Easy-to-use commands for manual resets.

## Requirements
- Minecraft Server 1.21 or higher.
- Bukkit/Spigot/Paper API.
- Java 17 or higher.

## Installation
1. **Download the Plugin**  
   Download the latest version of the plugin `.jar` file from the [releases page](#).

2. **Place the Plugin**  
   Copy the `.jar` file into your server's `plugins` folder.

3. **Restart the Server**  
   Restart your Minecraft server to load the plugin.

4. **Configure the Plugin**  
   After the first run, a `config.yml` file will be generated in the `plugins/ArenaReset` folder. Edit this file to customize the arena settings.

## Configuration
The `config.yml` file allows you to define the arena's location, size, and reset interval. Below is an example configuration:

```yaml
arena:
  world: world
  center:
    x: 0
    y: 64
    z: 0
  size: 300
  reset-interval-minutes: 10
```

- **world**: The name of the world where the arena is located.
- **center**: The center coordinates of the arena.
- **size**: The size of the arena (e.g., 300x300).
- **reset-interval-minutes**: How often the arena resets (in minutes).

## Commands
The plugin provides the following commands:

- `/arenareset reset`  
  **Description**: Forces an immediate reset of the arena.  
  **Permission**: `arenareset.admin`

## Permissions
- `arenareset.admin`: Grants access to all Arena Reset commands. Default: `op`.

## Tutorial: Setting Up the Arena
1. **Define the Arena**  
   Open the `config.yml` file and set the `world`, `center`, and `size` values to match your arena's location.

2. **Create a Backup**  
   The plugin automatically creates a backup of the arena's region files upon startup.

3. **Test the Reset**  
   Use the `/arenareset reset` command to test the reset functionality.

4. **Monitor the Reset**  
   The plugin will automatically reset the arena at the configured interval. Players will be notified before the reset.

## Troubleshooting
- **Players are not teleported out of the arena**: Ensure the arena boundaries are correctly defined in the `config.yml`.
- **The arena is not resetting**: Check the server logs for errors and ensure the plugin is enabled.

## Contributing
Contributions are welcome! Feel free to submit a pull request or report issues on the [GitHub repository](#).

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

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
