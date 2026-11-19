// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/RuleContext.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/RuleContext.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/RuleContext.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules;
//
// import de.streuland.plot.Plot;
// import org.bukkit.Location;
// import org.bukkit.block.Biome;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Event;
//
// public class RuleContext {
//     private final RuleTrigger trigger;
//     private final Event event;
//     private final Player player;
//     private final Plot plot;
//     private final Location location;
//     private final int plotLevel;
//     private final Biome biome;
//     private final RuleEngine engine;
//
//     public RuleContext(RuleTrigger trigger, Event event, Player player, Plot plot, Location location,
//                        int plotLevel, Biome biome, RuleEngine engine) {
//         this.trigger = trigger;
//         this.event = event;
//         this.player = player;
//         this.plot = plot;
//         this.location = location;
//         this.plotLevel = plotLevel;
//         this.biome = biome;
//         this.engine = engine;
//     }
//
//     public RuleTrigger getTrigger() {
//         return trigger;
//     }
//
//     public Event getEvent() {
//         return event;
//     }
//
//     public Player getPlayer() {
//         return player;
//     }
//
//     public Plot getPlot() {
//         return plot;
//     }
//
//     public Location getLocation() {
//         return location;
//     }
//
//     public int getPlotLevel() {
//         return plotLevel;
//     }
//
//     public Biome getBiome() {
//         return biome;
//     }
//
//     public RuleEngine getEngine() {
//         return engine;
//     }
// }
//
