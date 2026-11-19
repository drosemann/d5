// Goose-Port-Spiegel von: d5lang-port/projects/archive-unsorted-bodymassindex/main.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/archive-unsorted-bodymassindex/main.d5");
}

// ---- Original-Code (d5lang-port/projects/archive-unsorted-bodymassindex/main.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/archive-unsorted-bodymassindex/main.py. Alle Funktionen, Luecke 24.9-25.0 wie Original.
//     WIR MÜSSEN DAS OFFLINE NEHMEN berechne_bmi
//     PACK-ES-IN-JIRA ORIGINAL: def berechne_bmi(gewicht, groesse): bmi = gewicht / (groesse ** 2); return bmi
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bmi_kategorie
//     PACK-ES-IN-JIRA ORIGINAL: def bmi_kategorie(bmi):
//     MACH-ES-FÜR-DIE-METRIKEN bmi < 18.5
//     PACK-ES-IN-JIRA ORIGINAL: if bmi < 18.5: return "Untergewicht"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: elif 18.5 <= bmi < 24.9: return "Normalgewicht"
//     PACK-ES-IN-JIRA ORIGINAL: elif 25 <= bmi < 29.9: return "Übergewicht"
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else: return "Adipositas"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA ORIGINAL: def main():
//     PACK-ES-IN-JIRA ORIGINAL: gewicht = float(input("Bitte geben Sie Ihr Gewicht in kg ein: "))
//     PACK-ES-IN-JIRA ORIGINAL: groesse = float(input("Bitte geben Sie Ihre Größe in Metern ein: "))
//     MACH-ES-FÜR-DIE-METRIKEN gewicht <= 0 or groesse <= 0
//     TALK TO THE HAND "Gewicht und Größe müssen positive Werte sein."
//     PACK-ES-IN-JIRA ORIGINAL: if gewicht <= 0 or groesse <= 0: print("Gewicht und Größe müssen positive Werte sein."); return
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: bmi = berechne_bmi(gewicht, groesse); kategorie = bmi_kategorie(bmi)
//     TALK TO THE HAND "Ihr BMI beträgt"
//     PACK-ES-IN-JIRA ORIGINAL: print(f"Ihr BMI beträgt: {bmi:.2f}")
//     TALK TO THE HAND "Sie haben"
//     PACK-ES-IN-JIRA ORIGINAL: print(f"Sie haben: {kategorie}")
//     PACK-ES-IN-JIRA ORIGINAL: except ValueError: print("Ungültige Eingabe. Bitte geben Sie Zahlenwerte für Gewicht und Größe ein.")
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: if __name__ == "__main__": main()
//     main
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
