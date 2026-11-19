#!/bin/bash

# HordePlugin Build & Deploy Script
# Automatisches Bauen und Deployment auf Paper-Server

set -e

# Farben für Output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}HordePlugin Build & Deploy Script v1.0${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}\n"

# Konfiguration
PROJECT_NAME="HordePlugin"
VERSION="1.0.0"
TARGET_JAR="target/${PROJECT_NAME}-${VERSION}.jar"
PLUGINS_DIR="${SERVER_PLUGINS_DIR:-.}"

# ════════════════════════════════════════
# SCHRITT 1: Maven Clean & Build
# ════════════════════════════════════════

echo -e "${YELLOW}[1/4]${NC} Starte Maven Build..."

if ! command -v mvn &> /dev/null; then
    echo -e "${RED}❌ Maven nicht gefunden!${NC}"
    echo "Installiere Maven: https://maven.apache.org/install.html"
    exit 1
fi

mvn clean package -DskipTests -q

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Maven Build fehlgeschlagen!${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Maven Build erfolgreich${NC}\n"

# ════════════════════════════════════════
# SCHRITT 2: JAR-Validierung
# ════════════════════════════════════════

echo -e "${YELLOW}[2/4]${NC} Validiere JAR-Datei..."

if [ ! -f "$TARGET_JAR" ]; then
    echo -e "${RED}❌ JAR-Datei nicht gefunden: $TARGET_JAR${NC}"
    exit 1
fi

JAR_SIZE=$(du -h "$TARGET_JAR" | cut -f1)
echo -e "${GREEN}✓ JAR-Datei erstellt: ${JAR_SIZE}${NC}\n"

# ════════════════════════════════════════
# SCHRITT 3: Deploy auf Server (optional)
# ════════════════════════════════════════

echo -e "${YELLOW}[3/4]${NC} Deploy-Optionen:"
echo "  1) In lokale plugins/ kopieren (Standard)"
echo "  2) Zu Remote-Server deployen"
echo "  3) Überspringen"

read -p "Wähle Option (1-3): " deploy_option

case $deploy_option in
    1)
        if [ -d "plugins" ]; then
            cp "$TARGET_JAR" plugins/
            echo -e "${GREEN}✓ JAR kopiert nach plugins/${NC}\n"
        else
            echo -e "${YELLOW}ℹ plugins/ Verzeichnis nicht gefunden${NC}"
            echo "  Bitte manuell nach plugins/ kopieren:"
            echo "  cp $TARGET_JAR /pfad/zum/server/plugins/"
        fi
        ;;
    2)
        read -p "Server-Host (z.B. user@host:/path/to/plugins/): " remote_path
        scp "$TARGET_JAR" "$remote_path/" && \
            echo -e "${GREEN}✓ Auf Server deployt${NC}\n" || \
            echo -e "${RED}❌ Deploy fehlgeschlagen${NC}\n"
        ;;
    3)
        echo -e "${YELLOW}ℹ Deploy übersprungen${NC}\n"
        ;;
    *)
        echo -e "${RED}❌ Ungültige Option${NC}"
        exit 1
        ;;
esac

# ════════════════════════════════════════
# SCHRITT 4: Zusammenfassung
# ════════════════════════════════════════

echo -e "${YELLOW}[4/4]${NC} Build abgeschlossen!\n"

echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}✓ Build erfolgreich${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo "📦 Artifact:"
echo "   Datei: $TARGET_JAR"
echo "   Größe: $JAR_SIZE"
echo ""

echo "🚀 Nächste Schritte:"
echo "   1. JAR zu plugins/ kopieren:"
echo "      cp $TARGET_JAR /pfad/zum/server/plugins/"
echo ""
echo "   2. Server starten/neustarten:"
echo "      cd /pfad/zum/server && java -Xmx1G -Xms512M -jar paper-1.16.5.jar nogui"
echo ""
echo "   3. Plugin laden:"
echo "      /reload oder Server neustart"
echo ""
echo "   4. Horden testen:"
echo "      /horde list"
echo "      /horde start verfluchter-kreuzzug"
echo ""

# ════════════════════════════════════════
# Zusätzliche Optionen
# ════════════════════════════════════════

read -p "Möchtest du den JAR mit unzip inspizieren? (j/n): " inspect_jar

if [ "$inspect_jar" = "j" ] || [ "$inspect_jar" = "J" ]; then
    echo ""
    echo "Inhalt der JAR-Datei:"
    unzip -l "$TARGET_JAR" | head -20
    echo "... (weitere Dateien)"
fi

echo -e "\n${GREEN}Build-Prozess abgeschlossen!${NC}"
