# Cooperating Screen Flutter App

Flutter mobile client for Cooperating Screen.

## Overview

This app provides device onboarding, pairing flows, and UI entry points for WebRTC-powered screen sharing sessions.

## Setup

```bash
cd cosc
flutter pub get
flutter run
```

## Development

- Update Supabase values in `lib/main.dart` for local testing.
- Use `flutter analyze` and `flutter test` before opening pull requests.

## Build

```bash
flutter build apk
flutter build ios
```

## Troubleshooting

- If dependencies fail to resolve: run `flutter clean && flutter pub get`.
- If platform builds fail: verify Android Studio/Xcode setup and SDK paths.

## Related docs

See [../README.md](../README.md) for top-level project and deployment guidance.

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
