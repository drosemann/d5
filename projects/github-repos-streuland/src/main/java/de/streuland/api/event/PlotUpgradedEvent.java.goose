// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotUpgradedEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotUpgradedEvent.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/api/event/PlotUpgradedEvent.java), unveraendert, als Inline-Doku ----
// package de.streuland.api.event;
//
// import org.bukkit.event.Event;
// import org.bukkit.event.HandlerList;
//
// /**
//  * Fired when a plot upgrade is completed.
//  */
// public class PlotUpgradedEvent extends Event {
//     private static final HandlerList HANDLERS = new HandlerList();
//
//     private final String plotId;
//     private final int fromLevel;
//     private final int toLevel;
//
//     public PlotUpgradedEvent(String plotId, int fromLevel, int toLevel) {
//         this.plotId = plotId;
//         this.fromLevel = fromLevel;
//         this.toLevel = toLevel;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public int getFromLevel() {
//         return fromLevel;
//     }
//
//     public int getToLevel() {
//         return toLevel;
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
