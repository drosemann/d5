// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotExperienceRuleSet.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotExperienceRuleSet.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotExperienceRuleSet.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// import java.util.Collections;
// import java.util.LinkedHashMap;
// import java.util.Map;
//
// /**
//  * Defines how much XP is granted for each progression source and optional throttling.
//  */
// public class PlotExperienceRuleSet {
//     private final int defaultXp;
//     private final long cooldownMillis;
//     private final Map<String, Integer> sourceXp;
//
//     public PlotExperienceRuleSet(int defaultXp, long cooldownMillis, Map<String, Integer> sourceXp) {
//         this.defaultXp = Math.max(0, defaultXp);
//         this.cooldownMillis = Math.max(0L, cooldownMillis);
//         this.sourceXp = sourceXp == null ? new LinkedHashMap<>() : new LinkedHashMap<>(sourceXp);
//     }
//
//     public static PlotExperienceRuleSet defaults() {
//         Map<String, Integer> defaults = new LinkedHashMap<>();
//         defaults.put("block_place", 1);
//         defaults.put("block_break", 1);
//         defaults.put("block_burn", 1);
//         return new PlotExperienceRuleSet(1, 1500L, defaults);
//     }
//
//     public int resolveXp(String source, int fallbackAmount) {
//         if (source == null || source.isBlank()) {
//             return Math.max(0, fallbackAmount);
//         }
//         Integer configured = sourceXp.get(source.toLowerCase());
//         if (configured != null) {
//             return Math.max(0, configured);
//         }
//         if (fallbackAmount > 0) {
//             return fallbackAmount;
//         }
//         return defaultXp;
//     }
//
//     public long getCooldownMillis() {
//         return cooldownMillis;
//     }
//
//     public Map<String, Integer> getSourceXp() {
//         return Collections.unmodifiableMap(sourceXp);
//     }
// }
//
