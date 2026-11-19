// Goose-Port-Spiegel von: d5lang-port/projects/utilities-desktop-tools-sorting-script/sort.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/utilities-desktop-tools-sorting-script/sort.d5");
}

// ---- Original-Code (d5lang-port/projects/utilities-desktop-tools-sorting-script/sort.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/utilities-desktop-tools-sorting-script/sort.py. Extension-Map, Ordner/Dateien, _N-Kollisionen.
//     PACK-ES-IN-JIRA ORIGINAL: import os; import shutil; from colorama import init, Fore, Style
//     PACK-ES-IN-JIRA ORIGINAL: init(autoreset=True)
//     PACK-ES-IN-JIRA ORIGINAL: basis = r"E:\Sortiert"
//     PACK-ES-IN-JIRA Liste der bekannten Dateiendungen → {'.mp4': 'Videos', ...}
//     PACK-ES-IN-JIRA ORIGINAL: bekannte_endungen = {.jpg/.jpeg/.png/.gif/.webp: Bilder; .mp4/.mkv/.mov/.avi: Videos; .mp3/.wav/.flac: Musik; .zip/.rar/.7z: Archive; .pdf: PDFs; .docx/.xlsx/.pptx: Dokumente; .txt: Textdateien; .py/.js/.html/.css: Code; .exe/.msi: Programme}
//     PACK-ES-IN-JIRA ORIGINAL: unbekannt_ordner = basis/Unbekannt; ordner_ziel = basis/Ordner
//     PACK-ES-IN-JIRA Zielordner vorbereiten
//     PACK-ES-IN-JIRA ORIGINAL: os.makedirs(unbekannt_ordner, exist_ok=True); os.makedirs(ordner_ziel, exist_ok=True)
//     TALK TO THE HAND "Starte Sortierung"
//     PACK-ES-IN-JIRA ORIGINAL: print(Fore.CYAN + "\n🔍 Starte Sortierung in:", basis)
//     PACK-ES-IN-JIRA Alle Elemente im Basisordner durchgehen
//     BLEIB-BIS-ZUM-SPRINT-ENDE name in listdir(basis)
//     PACK-ES-IN-JIRA ORIGINAL: for name in os.listdir(basis): vollpfad = join(basis, name)
//     PACK-ES-IN-JIRA 1. Ordner behandeln (außer unseren Zielordnern)
//     MACH-ES-FÜR-DIE-METRIKEN isdir und nicht Zielordner
//     PACK-ES-IN-JIRA ORIGINAL: if os.path.isdir(vollpfad) and name not in ["Unbekannt", "Ordner"] and name not in set(bekannte_endungen.values()): print(YELLOW + "📁 Ordner gefunden..."); shutil.move(vollpfad, ordner_ziel/name); continue
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA 2. Dateien behandeln
//     MACH-ES-FÜR-DIE-METRIKEN isfile
//     PACK-ES-IN-JIRA ORIGINAL: if os.path.isfile(vollpfad): ext = splitext(name)[1].lower()
//     PACK-ES-IN-JIRA Zielordner ermitteln
//     MACH-ES-FÜR-DIE-METRIKEN ext in bekannte_endungen
//     PACK-ES-IN-JIRA ORIGINAL: if ext in bekannte_endungen: ziel_unterordner = bekannte_endungen[ext]
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else: ziel_unterordner = "Unbekannt"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: zielpfad = basis/ziel_unterordner; makedirs exist_ok; neues_ziel = zielpfad/name
//     PACK-ES-IN-JIRA Kollisionen vermeiden
//     PACK-ES-IN-JIRA ORIGINAL: counter = 1; base, extension = splitext(name)
//     BLEIB-BIS-ZUM-SPRINT-ENDE exists(neues_ziel)
//     PACK-ES-IN-JIRA ORIGINAL: while os.path.exists(neues_ziel): neues_ziel = zielpfad/{base}_{counter}{extension}; counter += 1
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: shutil.move(vollpfad, neues_ziel); print(GREEN + "✅ {name} → {ziel_unterordner}/")
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     TALK TO THE HAND "Sortierung abgeschlossen!"
//     PACK-ES-IN-JIRA ORIGINAL: print(BRIGHT + MAGENTA + "\n🎉 Sortierung abgeschlossen!")
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
