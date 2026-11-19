import os
import csv
import re

# Manuell definierte URL-Mappings für spezielle Fälle
URL_MAPPINGS = {
    'Binance': 'https://www.binance.com',
    'Coinbase': 'https://www.coinbase.com',
    'Arc Browser': 'https://arc.net',
    'RiotGames': 'https://www.riotgames.com',
    'Ubisoft': 'https://www.ubisoft.com',
    'Unity': 'https://unity.com',
    'Rockstar': 'https://www.rockstargames.com',
    'Skillshare': 'https://www.skillshare.com',
    'VMWare': 'https://www.vmware.com',
    'Metamask': 'https://metamask.io',
    'ProtonVPN': 'https://protonvpn.com',
    'Minecraft Server Listen': 'https://minecraft.net',
    'Linktree': 'https://linktr.ee',
    'Yahoo': 'https://www.yahoo.com',
    'SHEIN': 'https://www.shein.com',
    'EA': 'https://www.ea.com',
    'SloydAI': 'https://www.sloyd.ai'
}

# Pfad zum Passwörter-Ordner
input_folder = r'C:\Users\danie\Desktop\Passwörter'

# Ausgabe-CSV-Datei
output_csv = r'C:\Users\danie\Desktop\google_passwords.csv'

# Funktion zur URL-Generierung
def generate_url(website_name):
    # Zuerst Mappings überprüfen
    if website_name in URL_MAPPINGS:
        return URL_MAPPINGS[website_name]
    
    # Standardmäßige URL-Generierung
    # Leerzeichen entfernen, Kleinbuchstaben
    clean_name = re.sub(r'[^a-zA-Z]', '', website_name).lower()
    
    return f'https://www.{clean_name}.com'

# CSV-Datei vorbereiten
with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
    csv_writer = csv.writer(csvfile)
    # Kopfzeile hinzufügen
    csv_writer.writerow(['website', 'username', 'password'])
    
    # Alle .txt-Dateien durchgehen
    for filename in os.listdir(input_folder):
        if filename.endswith('.txt'):
            # Websitename = Dateiname ohne .txt
            website = filename[:-4]
            
            # Passwort aus der Datei lesen
            with open(os.path.join(input_folder, filename), 'r', encoding='utf-8') as passfile:
                password = passfile.read().strip()
            
            # URL generieren
            url = generate_url(website)
            
            # In CSV schreiben
            csv_writer.writerow([url, 'default', password])

print(f"CSV-Datei {output_csv} wurde erstellt.")
print("Bitte überprüfen Sie die generierten URLs manuell auf Korrektheit.")
