// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/RestrictionListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/RestrictionListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/RestrictionListener.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.listener;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.utils.misc.ParticleUtils;
// import org.bukkit.GameMode;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.block.BlockBreakEvent;
// import org.bukkit.event.block.BlockPlaceEvent;
// import org.bukkit.event.block.BlockSpreadEvent;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.EntityDeathEvent;
// import org.bukkit.event.entity.EntityPickupItemEvent;
// import org.bukkit.event.entity.EntityRegainHealthEvent;
// import org.bukkit.event.entity.EntityTargetEvent;
// import org.bukkit.event.entity.FoodLevelChangeEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
// import org.bukkit.event.inventory.InventoryClickEvent;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.event.player.PlayerInteractAtEntityEvent;
// import org.bukkit.event.player.PlayerInteractEntityEvent;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.event.player.PlayerSwapHandItemsEvent;
// import org.bukkit.event.vehicle.VehicleDamageEvent;
// import org.bukkit.event.vehicle.VehicleDestroyEvent;
// import org.bukkit.event.weather.ThunderChangeEvent;
// import org.bukkit.event.weather.WeatherChangeEvent;
//
// public class RestrictionListener implements Listener {
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onEntityDamage(@Nonnull EntityDamageEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          Entity entity = event.getEntity();
//          if (!(entity instanceof Player) || ((Player)entity).getGameMode() != GameMode.CREATIVE) {
//             if (event.getCause() != DamageCause.VOID && (entity instanceof Player || event.getCause() == DamageCause.ENTITY_ATTACK || event.getCause() == DamageCause.PROJECTILE)) {
//                entity.setFireTicks(entity instanceof Player ? 0 : entity.getFireTicks());
//                event.setCancelled(true);
//                ParticleUtils.spawnParticleCircleAroundEntity(Challenges.getInstance(), entity);
//             }
//
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onEntityDeath(@Nonnull EntityDeathEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          if (event.getEntity() instanceof Player) {
//             event.getDrops().clear();
//             event.setDroppedExp(0);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onBlockBreak(@Nonnull BlockBreakEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onBlockPlace(@Nonnull BlockPlaceEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onFoodLevelChange(@Nonnull FoodLevelChangeEvent event) {
//       if (ChallengeAPI.isPaused()) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onEntityRegainHealth(@Nonnull EntityRegainHealthEvent event) {
//       if (ChallengeAPI.isPaused()) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onItemPickup(@Nonnull EntityPickupItemEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          if (event.getEntity() instanceof Player) {
//             Player player = (Player)event.getEntity();
//             if (player.getGameMode() != GameMode.CREATIVE) {
//                event.setCancelled(true);
//             }
//
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onDrop(@Nonnull PlayerDropItemEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          if (event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//             event.setCancelled(true);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onInteract(@Nonnull PlayerInteractEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onInteract(@Nonnull PlayerInteractAtEntityEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onInteract(@Nonnull PlayerInteractEntityEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onOffHandItemSwitch(@Nonnull PlayerSwapHandItemsEvent event) {
//       if (ChallengeAPI.isPaused() && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onDamage(@Nonnull VehicleDamageEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          Entity entity = event.getVehicle();
//          event.setCancelled(true);
//          if (event.getAttacker() instanceof Player) {
//             if (((Player)event.getAttacker()).getGameMode() == GameMode.CREATIVE) {
//                event.setCancelled(false);
//             }
//
//             ParticleUtils.spawnParticleCircleAroundEntity(Challenges.getInstance(), entity);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onDamage(@Nonnull VehicleDestroyEvent event) {
//       if (ChallengeAPI.isPaused() && (!(event.getAttacker() instanceof Player) || ((Player)event.getAttacker()).getGameMode() != GameMode.CREATIVE)) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onWeatherChange(@Nonnull WeatherChangeEvent event) {
//       if (ChallengeAPI.isPaused() && event.toWeatherState()) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onThunderChange(@Nonnull ThunderChangeEvent event) {
//       if (ChallengeAPI.isPaused() && event.toThunderState()) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onTarget(@Nonnull EntityTargetEvent event) {
//       if (ChallengeAPI.isPaused() && event.getTarget() != null) {
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onClick(@Nonnull InventoryClickEvent event) {
//       if (event.getWhoClicked() instanceof Player) {
//          Player player = (Player)event.getWhoClicked();
//          if (ChallengeAPI.isPaused() && player.getGameMode() != GameMode.CREATIVE) {
//             event.setCancelled(true);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onBlockSpread(@Nonnull BlockSpreadEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          event.setCancelled(true);
//       }
//    }
// }
//
