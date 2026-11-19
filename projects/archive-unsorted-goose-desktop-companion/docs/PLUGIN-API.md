# Goose Plugin API Specification

> **Version:** 1.0
> **Status:** Draft

---

## Overview

The Goose Plugin API allows developers to extend Goose Desktop Companion functionality with custom plugins.

## Plugin Structure

```
plugins/
└── [plugin-name]/
    ├── manifest.json
    ├── main.ps1
    ├── config.ini (optional)
    └── assets/ (optional)
        └── sprites/
```

## manifest.json

```json
{
    "id": "com.author.plugin-name",
    "name": "Plugin Name",
    "version": "1.0.0",
    "author": "Author Name",
    "description": "What the plugin does",
    "minGooseVersion": "2.0.0",
    "hooks": ["onTick", "onAppChange"],
    "permissions": ["music", "system"]
}
```

## Available Hooks

| Hook | Parameters | Description |
|------|------------|-------------|
| `onStartup` | - | Called when goose starts |
| `onShutdown` | - | Called when goose closes |
| `onTick` | `$interval` | Called every minute |
| `onIdle` | `$idleMinutes` | Called when user becomes idle |
| `onActive` | - | Called when user returns |
| `onAppChange` | `$appName, $windowTitle` | Called when active app changes |
| `onInteract` | `$x, $y` | Called when user clicks goose |
| `onMoodChange` | `$oldMood, $newMood` | Called when mood changes |
| `onMusicPlay` | `$track, $artist` | Called when music starts |
| `onMusicPause` | - | Called when music pauses |
| `onNotification` | `$title, $text` | Called on system notification |

## Plugin API Functions

### Core Functions

```powershell
# Set goose mood
Set-GooseMood -Mood "happy"

# Show speech bubble
Show-SpeechBubble -Text "Hello!" -Duration 5

# Get current state
$app = Get-ActiveApp
$cpu = Get-SystemCPU
$memory = Get-SystemMemory
$idle = Get-IdleTime
```

### Gamification

```powershell
# Add XP to player
Add-XP -Amount 10

# Add achievement
Add-Achievement -Id "first-plugin"

# Get player stats
$stats = Get-PlayerStats
```

### UI

```powershell
# Create notification
New-GooseNotification -Title "Title" -Text "Text"

# Create widget
New-Widget -Type "text" -Content "Hello"
```

### Data

```powershell
# Save plugin data
Save-PluginData -Key "setting" -Value "value"

# Load plugin data
$data = Load-PluginData -Key "setting" -Default "default"
```

## Example Plugin: Spotify Goose

```powershell
# main.ps1

# Register hooks
Register-Hook -Hook "onMusicPlay" -Callback {
    param($trackName, $artist)
    
    Set-GooseMood -Mood "happy"
    Show-SpeechBubble -Text "Nice tune! 🎵 $trackName" -Duration 3
}

Register-Hook -Hook "onMusicPause" -Callback {
    Set-GooseMood -Mood "bored"
    Show-SpeechBubble -Text "Aw, I was dancing..." -Duration 2
}

# Initialize
Write-Host "Spotify Goose initialized!"
```

## Configuration

```ini
# config.ini
Enabled=True
Reactions=happy,sad
DanceOnBeat=True
```

## Permissions

| Permission | Description |
|------------|-------------|
| `music` | Access music state |
| `system` | Access system stats |
| `network` | Make network requests |
| `files` | Read/write files |
| `ui` | Create UI elements |

## Publishing

1. Create GitHub release with ZIP
2. Add to marketplace manifest
3. Submit for review

---

*This API is currently in development.*

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
