# JSON Data Schema Documentation

This document explains the optimized JSON structure used for edge datacenter communication with limited bandwidth (0.1 kbit/s).

## Field Mappings

```json
{
    "i": "string",    // Device ID/Serial Number (e.g., "1234ABCD01")
    "a": "string",    // Address/Location (e.g., "BAHNHOFSTRAßE ECKE HAUPTSTRAßE")
    "x": {            // Container Data
        "a": "number", // Color container count
        "b": "number", // Brown container count
        "c": "number"  // White container count
    },
    "d": "string",    // Date/Timestamp in format YYMMDDHHMMSS (e.g., "250829123752" = 2025-08-29 12:37:52)
    "p": "number",    // Battery percentage (0-100)
    "f": "array"      // Full status flags [color, brown, white] where 0=false, 1=true
}
```

## Example
```json
{"i":"1234ABCD01","a":"BAHNHOFSTRAßE ECKE HAUPTSTRAßE","x":{"a":443,"b":627,"c":2423},"d":"250829123752","p":56,"f":[0,0,1]}
```

In this example:
- Device ID: 1234ABCD01
- Location: BAHNHOFSTRAßE ECKE HAUPTSTRAßE
- Container counts:
  - Color: 443
  - Brown: 627
  - White: 2423
- Timestamp: August 29, 2025 12:37:52
- Battery: 56%
- Full status:
  - Color container: not full (0)
  - Brown container: not full (0)
  - White container: full (1)

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
