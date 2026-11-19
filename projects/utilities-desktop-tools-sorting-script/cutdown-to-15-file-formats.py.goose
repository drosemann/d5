// Goose-Port-Spiegel von: projects/utilities-desktop-tools-sorting-script/cutdown-to-15-file-formats.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-sorting-script/cutdown-to-15-file-formats.py");
}

// ---- Original-Code (projects/utilities-desktop-tools-sorting-script/cutdown-to-15-file-formats.py), unveraendert, als Inline-Doku ----
// import os
// import shutil
//
// # Ordnerpfad zu deiner Ablage
// root_path = r"E:\!Ablage"
//
// # Liste der Ordnernamen, die behalten werden sollen
// allowed_folders = [
//     "exe", "jar", "msi",       # Anwendungen
//     "zip", "rar",              # Archive
//     "docx", "xlsx", "pdf",     # Office
//     "mp4", "mkv",              # Video
//     "mp3", "wav",              # Audio
//     "jpg", "png"               # Bilder
// ]
//
// # Alle Einträge im Ordner auflisten
// for folder_name in os.listdir(root_path):
//     full_path = os.path.join(root_path, folder_name)
//
//     # Prüfen, ob es sich um einen Ordner handelt
//     if os.path.isdir(full_path):
//         folder_name_lower = folder_name.lower()
//         
//         if folder_name_lower in allowed_folders:
//             print(f"[BEHALTEN] {folder_name}")
//         else:
//             try:
//                 print(f"[LÖSCHE  ] {folder_name} ...", end="")
//                 shutil.rmtree(full_path)
//                 print(" ✔️")
//             except Exception as e:
//                 print(f"\n[FEHLER  ] {folder_name}: {e}")
//
