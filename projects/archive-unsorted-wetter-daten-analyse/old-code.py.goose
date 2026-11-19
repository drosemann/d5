// Goose-Port-Spiegel von: projects/archive-unsorted-wetter-daten-analyse/old-code.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-wetter-daten-analyse/old-code.py");
}

// ---- Original-Code (projects/archive-unsorted-wetter-daten-analyse/old-code.py), unveraendert, als Inline-Doku ----
// except FileNotFoundError:
//     print("💀💀💀 Datei 'Hanau.txt' wurde nicht gefunden! Was hast du dir dabei gedacht?! 💀💀💀")
//
// except Exception as e:
//     print(f"⚡⚡⚡ Ein Fehler ist aufgetreten: {e} ⚡⚡⚡\nVielleicht solltest du mal deinen Code checken, Gen(i)us! 🙄")
// try:
//     with open("Hanau.txt", "r", encoding="utf-8") as file:
//         text = file.readlines()
//
//     sorted_data = sorted(line.strip() for line in text if line.strip())
//
//     print("🎉 Sortierte Daten:")
//     for line in sorted_data:
//         print(line)
//
// except FileNotFoundError:
//     print("❌ Datei 'Hanau.txt' wurde nicht gefunden. Bitte überprüfe den Dateinamen! 🧐")
//
// except Exception as e:
//     print(f"⚠️ Ein Fehler ist aufgetreten: {e} 😱")
// handle = open("Hanau.txt","rb")
// import sys
//
// try: 
//
//     handle = open("Hanau.txt", "rb")
//     file = open("Hanau.txt", "r")
//     text = file.read()
//
//     handle = open("Hanau.txt", "rb")
//     content = handle.read()
//     handle.close()
//
//
//
//     sorted_results = sorted(content)
//     print(sorted_results)
//
//
//     print(text)
//     file.close()
//
//
// except IOError:
//     print("Probier nochmal du kek")
//
// except:
//     
//     print("Hier etwas um deinen Tag zu ruinieren:", sys.exc_info()[0])# 
//
//
//
//     import re
// from datetime import datetime
// from difflib import SequenceMatcher
//
// lines = [
//     "42 | Müller | 2025-11-01 | 123.45",
//     "7  | Schmidt| 2024-06-20 |  98.00",
//     "42 | Mueller| 2025-11-02 | 123.50",
// ]
//
//
//
//
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
// ###############################################################################
//
//
//
// # Parser
// pat = re.compile(r"\s*(\d+)\s*\|\s*([^|]+)\s*\|\s*([\d-]+)\s*\|\s*([\d.]+)")
// def parse(line):
//     m = pat.match(line)
//     if not m:
//         raise ValueError(f"Ungültiges Format: {line!r}")
//     id_, name, date_s, value_s = m.groups()
//     return {
//         "id": int(id_),
//         "name": name.strip(),
//         "date": datetime.fromisoformat(date_s),
//         "value": float(value_s),
//         "raw": line,
//     }
//
// records = [parse(l) for l in lines]
//
// # Unterschiede zwischen zwei Zeilen (textuell)
// def text_diff(a, b):
//     sm = SequenceMatcher(None, a, b)
//     return [(tag, a[i1:i2], b[j1:j2]) for tag, i1, i2, j1, j2 in sm.get_opcodes()]
//
// print(text_diff(records[0]["raw"], records[2]["raw"]))
//
// # Sortieren: z.B. nach id, dann date absteigend, dann name
// records_sorted = sorted(records, key=lambda r: (r["id"], -r["date"].timestamp(), r["name"]))
// for r in records_sorted:
//     print(r["raw"])
