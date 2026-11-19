// Goose-Port-Spiegel von: d5lang-port/projects/archive-unsorted-tokyo-metro-pricing/calculator.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/archive-unsorted-tokyo-metro-pricing/calculator.d5");
}

// ---- Original-Code (d5lang-port/projects/archive-unsorted-tokyo-metro-pricing/calculator.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/archive-unsorted-tokyo-metro-pricing/calculator.py. Alle Preisstufen, Kinderpreis, main.
//     PACK-ES-IN-JIRA ORIGINAL: import math
//     WIR MÜSSEN DAS OFFLINE NEHMEN berechne_fahrpreis
//     PACK-ES-IN-JIRA ORIGINAL: def berechne_fahrpreis(strecke):
//     MACH-ES-FÜR-DIE-METRIKEN strecke <= 6
//     PACK-ES-IN-JIRA ORIGINAL: if strecke <= 6: return 170  # Bis 6 km
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: elif strecke <= 11: return 200  # 7-11 km
//     PACK-ES-IN-JIRA ORIGINAL: elif strecke <= 19: return 250  # 12-19 km
//     PACK-ES-IN-JIRA ORIGINAL: elif strecke <= 27: return 290  # 20-27 km
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else: return 320  # Über 27 km
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN berechne_kinderpreis
//     PACK-ES-IN-JIRA ORIGINAL: def berechne_kinderpreis(erwachsenenpreis):
//     PACK-ES-IN-JIRA ORIGINAL: kinderpreis = erwachsenenpreis / 2
//     PACK-ES-IN-JIRA ORIGINAL: return math.ceil(kinderpreis / 10) * 10
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA ORIGINAL: def main():
//     PACK-ES-IN-JIRA Benutzer zur Eingabe der Strecke (in Kilometern) auffordern
//     PACK-ES-IN-JIRA ORIGINAL: strecke = int(input("Bitte geben Sie die Strecke (in km) ein: "))
//     PACK-ES-IN-JIRA Fahrpreise berechnen
//     PACK-ES-IN-JIRA ORIGINAL: erwachsenenpreis = berechne_fahrpreis(strecke); kinderpreis = berechne_kinderpreis(erwachsenenpreis)
//     PACK-ES-IN-JIRA Ergebnisse ausgeben
//     TALK TO THE HAND "Der Fahrpreis"
//     PACK-ES-IN-JIRA ORIGINAL: print(f"Der Fahrpreis für {strecke} km beträgt:")
//     TALK TO THE HAND "Erwachsene"
//     PACK-ES-IN-JIRA ORIGINAL: print(f"Erwachsene: {erwachsenenpreis} Yen")
//     TALK TO THE HAND "Kinder"
//     PACK-ES-IN-JIRA ORIGINAL: print(f"Kinder: {kinderpreis} Yen")
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: if __name__ == '__main__': main()
//     main
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
