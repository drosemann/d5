// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RomanNumerals.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RomanNumerals.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RomanNumerals.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.util.TreeMap;
// import javax.annotation.Nonnull;
//
// public final class RomanNumerals {
//    private static final TreeMap values = new TreeMap();
//
//    private RomanNumerals() {
//    }
//
//    @Nonnull
//    public static String forNumber(int number) {
//       if (number >= 0 && number <= 3999) {
//          if (number == 0) {
//             return "";
//          } else {
//             int i = (Integer)values.floorKey(number);
//             return number == i ? (String)values.get(number) : (String)values.get(i) + forNumber(number - i);
//          }
//       } else {
//          throw new RomanNumerals.IllegalRomanNumeralException(number);
//       }
//    }
//
//    static {
//       values.put(1000, "M");
//       values.put(900, "CM");
//       values.put(500, "D");
//       values.put(400, "CD");
//       values.put(100, "C");
//       values.put(90, "XC");
//       values.put(50, "L");
//       values.put(40, "XL");
//       values.put(10, "X");
//       values.put(9, "IX");
//       values.put(5, "V");
//       values.put(4, "IV");
//       values.put(1, "I");
//    }
//
//    public static final class IllegalRomanNumeralException extends IllegalArgumentException {
//       private IllegalRomanNumeralException(int number) {
//          super("Number " + number + " out of bounds for 0 to 3999");
//       }
//
//       // $FF: synthetic method
//       IllegalRomanNumeralException(int x0, Object x1) {
//          this(x0);
//       }
//    }
// }
//
