import random

def hangman():
    wörterliste = ["python", "programmieren", "computer", "spiel", "hallo"]
    wort = random.choice(wörterliste)
    geratene_buchstaben = []
    versuche = 7

    while True:
        ausgeblendete_buchstaben = ""
        for buchstabe in wort:
            if buchstabe in geratene_buchstaben:
                ausgeblendete_buchstaben += buchstabe
            else:
                ausgeblendete_buchstaben += "_"

        print(ausgeblendete_buchstaben)

        if ausgeblendete_buchstaben == wort:
            print("Gewonnen!")
            break

        if versuche == 0:
            print("Verloren!")
            break

        guess = input("Rate einen Buchstaben: ").lower()

        if guess in geratene_buchstaben:
            print("Du hast diesen Buchstaben bereits geraten.")
        elif guess in wort:
            geratene_buchstaben.append(guess)
            print("Richtig geraten!")
        else:
            versuche -= 1
            print("Falsch geraten!")
            print(f"Du hast noch {versuche} Versuche.")

    print(f"Das Wort war: {wort}")

    if versuche == 0:
        print("Verloren!")
    else:
        print("Gewonnen!")

    play_again = input("Möchtest du noch einmal spielen? (j/n): ").lower()

    if play_again == "j":
hangman()