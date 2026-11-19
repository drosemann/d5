// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/flags/Flag.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/flags/Flag.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/flags/Flag.java), unveraendert, als Inline-Doku ----
// package de.streuland.flags;
//
// import de.streuland.plot.AreaType;
//
// import java.util.EnumMap;
// import java.util.Map;
//
// public enum Flag {
//     PVP(defaults(false, true, false, false)),
//     MOB_SPAWN(defaults(false, true, false, true)),
//     EXPLOSIONS(defaults(false, true, false, true)),
//     FIRE_SPREAD(defaults(false, true, false, true)),
//     KEEP_INVENTORY_OVERWRITE(defaults(false, false, false, false)),
//     REDSTONE(defaults(false, true, false, true));
//
//     private final Map<AreaType, Boolean> defaults;
//
//     Flag(Map<AreaType, Boolean> defaults) {
//         this.defaults = defaults;
//     }
//
//     public boolean isEnabledByDefault(AreaType areaType) {
//         return defaults.getOrDefault(areaType, false);
//     }
//
//     private static Map<AreaType, Boolean> defaults(boolean path, boolean plotClaimed, boolean plotUnclaimed, boolean wilderness) {
//         Map<AreaType, Boolean> map = new EnumMap<>(AreaType.class);
//         map.put(AreaType.PATH, path);
//         map.put(AreaType.PLOT_CLAIMED, plotClaimed);
//         map.put(AreaType.PLOT_UNCLAIMED, plotUnclaimed);
//         map.put(AreaType.WILDERNESS, wilderness);
//         return map;
//     }
// }
//
