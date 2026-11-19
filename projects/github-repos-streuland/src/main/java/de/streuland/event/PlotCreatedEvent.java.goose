// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/event/PlotCreatedEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/event/PlotCreatedEvent.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/event/PlotCreatedEvent.java), unveraendert, als Inline-Doku ----
// package de.streuland.event;
//
// import de.streuland.plot.Plot;
// import org.bukkit.event.Event;
// import org.bukkit.event.HandlerList;
//
// /**
//  * Fired after a plot has been created and stored.
//  */
// public class PlotCreatedEvent extends Event {
//     private static final HandlerList HANDLERS = new HandlerList();
//     private final Plot plot;
//
//     public PlotCreatedEvent(Plot plot) {
//         this.plot = plot;
//     }
//
//     public Plot getPlot() {
//         return plot;
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
