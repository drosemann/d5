// Goose-Port-Spiegel von: projects/utilities-desktop-tools-sorting-script/sort.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-sorting-script/sort.py");
}

// ---- Original-Code (projects/utilities-desktop-tools-sorting-script/sort.py), unveraendert, als Inline-Doku ----
// import os
// import shutil
// from colorama import init, Fore, Style
//
// init(autoreset=True)
//
// basis = r"E:\Sortiert"
//
// # Liste der bekannten Dateiendungen → {'.mp4': 'Videos', ...}
// bekannte_endungen = {
//     ".jpg": "Bilder", ".jpeg": "Bilder", ".png": "Bilder", ".gif": "Bilder", ".webp": "Bilder",
//     ".mp4": "Videos", ".mkv": "Videos", ".mov": "Videos", ".avi": "Videos",
//     ".mp3": "Musik", ".wav": "Musik", ".flac": "Musik",
//     ".zip": "Archive", ".rar": "Archive", ".7z": "Archive",
//     ".pdf": "PDFs", ".docx": "Dokumente", ".xlsx": "Dokumente", ".pptx": "Dokumente", ".txt": "Textdateien",
//     ".py": "Code", ".js": "Code", ".html": "Code", ".css": "Code",
//     ".exe": "Programme", ".msi": "Programme"
// }
// unbekannt_ordner = os.path.join(basis, "Unbekannt")
// ordner_ziel = os.path.join(basis, "Ordner")
//
// # Zielordner vorbereiten
// os.makedirs(unbekannt_ordner, exist_ok=True)
// os.makedirs(ordner_ziel, exist_ok=True)
//
// print(Fore.CYAN + "\n🔍 Starte Sortierung in:", basis)
//
// # Alle Elemente im Basisordner durchgehen
// for name in os.listdir(basis):
//     vollpfad = os.path.join(basis, name)
//
//     # 1. Ordner behandeln (außer unseren Zielordnern)
//     if os.path.isdir(vollpfad) and name not in ["Unbekannt", "Ordner"] and name not in set(bekannte_endungen.values()):
//         print(Fore.YELLOW + f"📁 Ordner gefunden: {name} → wird verschoben in 'Ordner/'")
//         shutil.move(vollpfad, os.path.join(ordner_ziel, name))
//         continue
//
//     # 2. Dateien behandeln
//     if os.path.isfile(vollpfad):
//         ext = os.path.splitext(name)[1].lower()
//
//         # Zielordner ermitteln
//         if ext in bekannte_endungen:
//             ziel_unterordner = bekannte_endungen[ext]
//         else:
//             ziel_unterordner = "Unbekannt"
//
//         zielpfad = os.path.join(basis, ziel_unterordner)
//         os.makedirs(zielpfad, exist_ok=True)
//
//         neues_ziel = os.path.join(zielpfad, name)
//
//         # Kollisionen vermeiden
//         counter = 1
//         base, extension = os.path.splitext(name)
//         while os.path.exists(neues_ziel):
//             neues_ziel = os.path.join(zielpfad, f"{base}_{counter}{extension}")
//             counter += 1
//
//         shutil.move(vollpfad, neues_ziel)
//         print(Fore.GREEN + f"✅ {name} → {ziel_unterordner}/")
//
// print(Style.BRIGHT + Fore.MAGENTA + "\n🎉 Sortierung abgeschlossen!")
//
