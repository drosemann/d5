// Goose-Port-Spiegel von: projects/browser-games-guess-the-number/main.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-guess-the-number/main.py");
}

// ---- Original-Code (projects/browser-games-guess-the-number/main.py), unveraendert, als Inline-Doku ----
// import random
//
// def zahlenraten():
//     zielzahl = random.randint(1, 100)
//     versuche = 0
//
//     while True:
//         guess = int(input("Rate eine Zahl zwischen 1 und 100: "))
//         versuche += 1
//
//         if guess < zielzahl:
//             print("Zu niedrig!")
//         elif guess > zielzahl:
//             print("Zu hoch!")
//         else:
//             print(f"Richtig geraten! Die Zahl war {zielzahl}")
//             print(f"Du hast {versuche} Versuche gebraucht.")
//             break
//
//         if versuche == 10:
//             print(f"Du hast keine Versuche mehr. Die Zahl war {zielzahl}.")
//             break
//
//     if versuche <= 5:
//         print("Sehr gut!")
//     elif versuche <= 10:
//         print("Gut!")
//     else:
//         print("Schlecht!")
//
// zahlenraten()
