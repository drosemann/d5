import random

def zahlenraten():
    zielzahl = random.randint(1, 100)
    versuche = 0

    while True:
        guess = int(input("Rate eine Zahl zwischen 1 und 100: "))
        versuche += 1

        if guess < zielzahl:
            print("Zu niedrig!")
        elif guess > zielzahl:
            print("Zu hoch!")
        else:
            print(f"Richtig geraten! Die Zahl war {zielzahl}")
            print(f"Du hast {versuche} Versuche gebraucht.")
            break

        if versuche == 10:
            print(f"Du hast keine Versuche mehr. Die Zahl war {zielzahl}.")
            break

    if versuche <= 5:
        print("Sehr gut!")
    elif versuche <= 10:
        print("Gut!")
    else:
        print("Schlecht!")

zahlenraten()