// Goose-Port-Spiegel von: projects/archive-unsorted-bodymassindex/main.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-bodymassindex/main.py");
}

// ---- Original-Code (projects/archive-unsorted-bodymassindex/main.py), unveraendert, als Inline-Doku ----
// def berechne_bmi(gewicht, groesse):
//     bmi = gewicht / (groesse ** 2)
//     return bmi
// def bmi_kategorie(bmi):
//     if bmi < 18.5:
//         return "Untergewicht"
//     elif 18.5 <= bmi < 24.9:
//         return "Normalgewicht"
//     elif 25 <= bmi < 29.9:
//         return "Übergewicht"
//     else:
//         return "Adipositas"
// def main():
//     try:
//         gewicht = float(input("Bitte geben Sie Ihr Gewicht in kg ein: "))
//         groesse = float(input("Bitte geben Sie Ihre Größe in Metern ein: "))
//         
//         if gewicht <= 0 or groesse <= 0:
//             print("Gewicht und Größe müssen positive Werte sein.")
//             return
//         
//         bmi = berechne_bmi(gewicht, groesse)
//         kategorie = bmi_kategorie(bmi)
//         
//         print(f"Ihr BMI beträgt: {bmi:.2f}")
//         print(f"Sie haben: {kategorie}")
//     except ValueError:
//         print("Ungültige Eingabe. Bitte geben Sie Zahlenwerte für Gewicht und Größe ein.")
// if __name__ == "__main__":
//     main()
