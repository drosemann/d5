// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerIgnoreStatusChangeEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerIgnoreStatusChangeEvent.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerIgnoreStatusChangeEvent.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.events;
//
// import org.bukkit.entity.Player;
// import org.bukkit.event.HandlerList;
// import org.bukkit.event.player.PlayerEvent;
// import org.jetbrains.annotations.NotNull;
//
// public class PlayerIgnoreStatusChangeEvent extends PlayerEvent {
//    private static final HandlerList handlers = new HandlerList();
//    private final boolean isIgnored;
//
//    public PlayerIgnoreStatusChangeEvent(@NotNull Player who, boolean isIgnored) {
//       super(who);
//       this.isIgnored = isIgnored;
//    }
//
//    @NotNull
//    public static HandlerList getHandlerList() {
//       return handlers;
//    }
//
//    public boolean isIgnored() {
//       return this.isIgnored;
//    }
//
//    public boolean isNotIgnored() {
//       return !this.isIgnored;
//    }
//
//    @NotNull
//    public HandlerList getHandlers() {
//       return handlers;
//    }
// }
//
