// Goose-Port-Spiegel von: projects/archive-unsorted-die_klasse_bruch/main.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-die_klasse_bruch/main.py");
}

// ---- Original-Code (projects/archive-unsorted-die_klasse_bruch/main.py), unveraendert, als Inline-Doku ----
// class Bruch:
//     def __init__(self):
//         self.z = 0
//         self.n = 1
//
//     def setZaehler(self, zähler):
//         self.z = zähler
//
//     def getZaehler(self):
//         return self.z
//
//     def setNenner(self, n):
//         if n == 0:
//             print("Nenner 0->1")
//             self.n = 1
//         else:
//             self.n = n
//
//     def getNenner(self):
//         return self.n
//
//     def setBruch(self, zähler, nenner):
//         self.setZaehler(zähler)
//         self.setNenner(nenner)
//
//     def getBruch(self):
//         return str(self.z) + "/" + str(self.n)
//
//     def printBruch(self):
//         print(self.z, "/", self.n)
//
//     def erweitern(self, f):
//         self.z *= f
//         self.n *= f
//
//     def kuerzen(self):
//         i = 2
//         while i <= self.z and i <= self.n:
//             if self.z % i == 0 and self.n % i == 0:
//                 self.z //= i
//                 self.n //= i
//             else:
//                 i += 1
//
//
// b1 = Bruch()
// b2 = Bruch()
// b1.setBruch(2, 4)
// b2.setBruch(3, 5)
//
// print("B1:")
// b1.printBruch()
// print("B2:")
// b2.printBruch()
//
// a = -1
// while a != 0:
//     print("\n1 Bruch eingeben\n2 Kürzen\n3 Erweitern\n0 Ende")
//     a = int(input("Auswahl: "))
//     
//     if a == 1:
//         z = int(input("Zähler: "))
//         n = int(input("Nenner: "))
//         b1.setBruch(z, n)
//         b1.printBruch()
//     elif a == 2:
//         b1.kuerzen()
//         b1.printBruch()
//     elif a == 3:
//         f = int(input("Faktor: "))
//         b1.erweitern(f)
//         b1.printBruch()
//
// print("Ende")
