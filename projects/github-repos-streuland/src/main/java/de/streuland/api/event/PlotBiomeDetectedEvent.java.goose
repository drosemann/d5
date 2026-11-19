// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotBiomeDetectedEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotBiomeDetectedEvent.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotBiomeDetectedEvent.java), unveraendert, als Inline-Doku ----
// package de.streuland.api.event;
//
// import org.bukkit.event.Event;
// import org.bukkit.event.HandlerList;
//
// /**
//  * Fired when a plot biome is detected or refreshed.
//  */
// public class PlotBiomeDetectedEvent extends Event {
//     private static final HandlerList HANDLERS = new HandlerList();
//
//     private final String plotId;
//     private final String biomeKey;
//
//     public PlotBiomeDetectedEvent(String plotId, String biomeKey) {
//         this.plotId = plotId;
//         this.biomeKey = biomeKey;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public String getBiomeKey() {
//         return biomeKey;
//     }
//
//     @Override
//     public HandlerList getHandlers() {
//         return HANDLERS;
//     }
//
//     public static HandlerList getHandlerList() {
//         return HANDLERS;
//     }
// }
//
