// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/storage/PlotStorage.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/storage/PlotStorage.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/storage/PlotStorage.java), unveraendert, als Inline-Doku ----
// package de.streuland.storage;
//
// import de.streuland.plot.Plot;
//
// import java.util.Collection;
// import java.util.Optional;
//
// public interface PlotStorage {
//     void save(Plot plot);
//
//     void delete(String id);
//
//     Optional<Plot> findById(String id);
//
//     Optional<Plot> findNearest(String world, int x, int z, int radius);
//
//     Collection<Plot> listAll();
// }
//
