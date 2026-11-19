// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotLevelReward.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotLevelReward.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotLevelReward.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// import java.util.Collections;
// import java.util.LinkedHashMap;
// import java.util.LinkedHashSet;
// import java.util.Map;
// import java.util.Set;
//
// /** Rewards automatically granted when a plot reaches a specific progression level. */
// public class PlotLevelReward {
//     private final int level;
//     private final int storageSlots;
//     private final Set<String> unlockedAbilities;
//     private final Set<String> cosmetics;
//     private final Map<String, Double> statBonuses;
//
//     public PlotLevelReward(int level,
//                            int storageSlots,
//                            Set<String> unlockedAbilities,
//                            Set<String> cosmetics,
//                            Map<String, Double> statBonuses) {
//         this.level = Math.max(1, level);
//         this.storageSlots = Math.max(0, storageSlots);
//         this.unlockedAbilities = unlockedAbilities == null ? new LinkedHashSet<>() : new LinkedHashSet<>(unlockedAbilities);
//         this.cosmetics = cosmetics == null ? new LinkedHashSet<>() : new LinkedHashSet<>(cosmetics);
//         this.statBonuses = statBonuses == null ? new LinkedHashMap<>() : new LinkedHashMap<>(statBonuses);
//     }
//
//     public int getLevel() {
//         return level;
//     }
//
//     public int getStorageSlots() {
//         return storageSlots;
//     }
//
//     public Set<String> getUnlockedAbilities() {
//         return Collections.unmodifiableSet(unlockedAbilities);
//     }
//
//     public Set<String> getCosmetics() {
//         return Collections.unmodifiableSet(cosmetics);
//     }
//
//     public Map<String, Double> getStatBonuses() {
//         return Collections.unmodifiableMap(statBonuses);
//     }
// }
//
