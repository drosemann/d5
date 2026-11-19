// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/SplitStrategy.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/SplitStrategy.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/SplitStrategy.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot;
//
// public class SplitStrategy {
//     public enum Type {
//         GRID,
//         RADIAL
//     }
//
//     private final Type type;
//     private final int rows;
//     private final int cols;
//
//     private SplitStrategy(Type type, int rows, int cols) {
//         this.type = type;
//         this.rows = rows;
//         this.cols = cols;
//     }
//
//     public static SplitStrategy grid(int rows, int cols) {
//         return new SplitStrategy(Type.GRID, rows, cols);
//     }
//
//     public static SplitStrategy radial() {
//         return new SplitStrategy(Type.RADIAL, 0, 0);
//     }
//
//     public Type getType() {
//         return type;
//     }
//
//     public int getRows() {
//         return rows;
//     }
//
//     public int getCols() {
//         return cols;
//     }
// }
//
