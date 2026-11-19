// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ExtraWorldRestrictionListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ExtraWorldRestrictionListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ExtraWorldRestrictionListener.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.listener;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.block.BlockBreakEvent;
// import org.bukkit.event.block.BlockPlaceEvent;
// import org.bukkit.event.player.PlayerDropItemEvent;
//
// public class ExtraWorldRestrictionListener implements Listener {
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onBlockPlace(@Nonnull BlockPlaceEvent event) {
//       if (this.isInExtraWorld(event.getBlock().getLocation())) {
//          if (!Challenges.getInstance().getWorldManager().getSettings().isPlaceBlocks()) {
//             event.setBuild(false);
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onBlockBreak(@Nonnull BlockBreakEvent event) {
//       if (this.isInExtraWorld(event.getBlock().getLocation())) {
//          if (!Challenges.getInstance().getWorldManager().getSettings().isDestroyBlocks()) {
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onDrop(@Nonnull PlayerDropItemEvent event) {
//       if (this.isInExtraWorld(event.getPlayer().getWorld())) {
//          if (!Challenges.getInstance().getWorldManager().getSettings().isDropItems()) {
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onPickUp(@Nonnull PlayerPickupItemEvent event) {
//       if (this.isInExtraWorld(event.getPlayer().getWorld())) {
//          if (!Challenges.getInstance().getWorldManager().getSettings().isPickupItems()) {
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    private boolean isInExtraWorld(@Nonnull Location location) {
//       return location.getWorld() == null ? false : this.isInExtraWorld(location.getWorld());
//    }
//
//    private boolean isInExtraWorld(@Nonnull World world) {
//       return Challenges.getInstance().getWorldManager().getExtraWorld().equals(world);
//    }
// }
//
