// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerInventoryClickEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerInventoryClickEvent.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerInventoryClickEvent.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.events;
//
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import org.bukkit.entity.Player;
// import org.bukkit.event.HandlerList;
// import org.bukkit.event.inventory.InventoryClickEvent;
//
// public class PlayerInventoryClickEvent extends InventoryClickEventWrapper {
//    private static final HandlerList handlers = new HandlerList();
//    private final Player player;
//
//    public PlayerInventoryClickEvent(@Nonnull InventoryClickEvent event) {
//       super(event);
//       this.player = (Player)event.getWhoClicked();
//    }
//
//    @Nonnull
//    public static HandlerList getHandlerList() {
//       return handlers;
//    }
//
//    @Nonnull
//    public HandlerList getHandlers() {
//       return getHandlerList();
//    }
//
//    @Generated
//    public Player getPlayer() {
//       return this.player;
//    }
// }
//
