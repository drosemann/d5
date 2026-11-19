// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerPickupItemEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerPickupItemEvent.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/events/PlayerPickupItemEvent.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.events;
//
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import org.bukkit.entity.Item;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Cancellable;
// import org.bukkit.event.HandlerList;
// import org.bukkit.event.player.PlayerEvent;
//
// public class PlayerPickupItemEvent extends PlayerEvent implements Cancellable {
//    private static final HandlerList handlers = new HandlerList();
//    private final Item item;
//    private final int remaining;
//    private boolean cancel = false;
//
//    public PlayerPickupItemEvent(@Nonnull Player player, @Nonnull Item item, int remaining) {
//       super(player);
//       this.item = item;
//       this.remaining = remaining;
//    }
//
//    @Nonnull
//    public static HandlerList getHandlerList() {
//       return handlers;
//    }
//
//    public boolean isCancelled() {
//       return this.cancel;
//    }
//
//    public void setCancelled(boolean cancel) {
//       this.cancel = cancel;
//    }
//
//    @Nonnull
//    public HandlerList getHandlers() {
//       return handlers;
//    }
//
//    @Generated
//    public Item getItem() {
//       return this.item;
//    }
//
//    @Generated
//    public int getRemaining() {
//       return this.remaining;
//    }
//
//    @Generated
//    public boolean isCancel() {
//       return this.cancel;
//    }
// }
//
