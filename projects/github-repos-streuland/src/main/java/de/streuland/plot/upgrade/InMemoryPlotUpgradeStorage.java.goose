// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/InMemoryPlotUpgradeStorage.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/InMemoryPlotUpgradeStorage.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/InMemoryPlotUpgradeStorage.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.Optional;
//
// public class InMemoryPlotUpgradeStorage implements PlotUpgradeStorage {
//     private final Map<String, PlotProgressionState> states = new HashMap<>();
//     public Optional<PlotProgressionState> load(String plotId) { return Optional.ofNullable(states.get(plotId)); }
//     public void save(String plotId, PlotProgressionState state) { states.put(plotId, state); }
// }
//
