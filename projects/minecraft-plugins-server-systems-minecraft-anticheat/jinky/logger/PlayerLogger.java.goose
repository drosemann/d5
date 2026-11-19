// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/logger/PlayerLogger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/logger/PlayerLogger.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/logger/PlayerLogger.java), unveraendert, als Inline-Doku ----
// package me.jinky.logger;
//
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import me.jinky.BAC;
// import me.jinky.util.MiniPlugin;
// import me.jinky.util.UtilBlock;
// import me.jinky.util.VersionUtil;
// import org.bukkit.Bukkit;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.block.BlockFace;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.block.Action;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.player.PlayerAnimationEvent;
// import org.bukkit.event.player.PlayerGameModeChangeEvent;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.bukkit.event.player.PlayerTeleportEvent;
// import org.bukkit.event.player.PlayerToggleFlightEvent;
// import org.bukkit.event.player.PlayerVelocityEvent;
// import org.bukkit.event.vehicle.VehicleEnterEvent;
// import org.bukkit.util.Vector;
//
// public class PlayerLogger extends MiniPlugin {
//    private static Map LastElytraFly = new HashMap();
//    private static Map LastFly = new HashMap();
//    private static Map LastFall = new HashMap();
//    private static Map LastSlimeBounce = new HashMap();
//    private static Map LastTeleport = new HashMap();
//    private static Map LastGroundTime = new HashMap();
//    private static List Falling = new ArrayList();
//    private static List Bouncing = new ArrayList();
//    private static Map LastSprint = new HashMap();
//    private static Map LastRegularMove = new HashMap();
//    private static Map LastRegularBoatLocation = new HashMap();
//    private static Map LastOffense = new HashMap();
//    private static Map BCPS = new HashMap();
//    private static Map SWPS = new HashMap();
//    private static Map lastVelocity = new HashMap();
//    private static PlayerLogger instance = null;
//
//    public PlayerLogger(BAC plugin) {
//       super("Player Tracker", plugin);
//       instance = this;
//       Bukkit.getScheduler().scheduleSyncRepeatingTask(plugin, () -> {
//          BCPS.clear();
//          SWPS.clear();
//       }, 20L, 20L);
//    }
//
//    @EventHandler
//    public void onVelocity(PlayerVelocityEvent event) {
//       lastVelocity.put(event.getPlayer(), System.currentTimeMillis());
//    }
//
//    public long getLastVelocity(Player p) {
//       return lastVelocity.containsKey(p) ? (Long)lastVelocity.get(p) : 0L;
//    }
//
//    @EventHandler
//    public void onAnimationDebug(PlayerAnimationEvent event) {
//       this.addSwing(event.getPlayer());
//    }
//
//    public void addSwing(Player p) {
//       if (!SWPS.containsKey(p)) {
//          SWPS.put(p, 1);
//       } else {
//          SWPS.put(p, (Integer)SWPS.get(p) + 1);
//       }
//
//       if ((Integer)SWPS.get(p) > 200) {
//          this.getPlugin().addSuspicion(p, "MorePackets (Timer)");
//       }
//
//    }
//
//    public Integer getSWPS(Player p) {
//       return SWPS.containsKey(p) ? (Integer)SWPS.get(p) : 0;
//    }
//
//    public void addBClick(Player p) {
//       if (!BCPS.containsKey(p)) {
//          BCPS.put(p, 1);
//       } else {
//          BCPS.put(p, (Integer)BCPS.get(p) + 1);
//       }
//
//       if ((Integer)BCPS.get(p) > 400) {
//          this.getPlugin().addSuspicion(p, "MorePackets (Nuker)");
//       }
//
//    }
//
//    public Integer getBCPS(Player p) {
//       return BCPS.containsKey(p) ? (Integer)BCPS.get(p) : 0;
//    }
//
//    public static PlayerLogger getLogger() {
//       return instance;
//    }
//
//    public void updateLastRegularBoatLocation(Player p) {
//       LastRegularBoatLocation.put(p, p.getVehicle().getLocation());
//    }
//
//    public void updateLastOffense(Player p) {
//       LastOffense.put(p, System.currentTimeMillis());
//    }
//
//    public void updateLastRegularMove(Player p) {
//       if (LastOffense.containsKey(p)) {
//          Long math = System.currentTimeMillis() - (Long)LastOffense.get(p);
//          if (math > 1500L) {
//             LastRegularMove.put(p, p.getLocation());
//          }
//       } else {
//          LastRegularMove.put(p, p.getLocation());
//       }
//
//    }
//
//    public Location getLastRegularMove(Player p) {
//       return !LastRegularMove.containsKey(p) ? null : (Location)LastRegularMove.get(p);
//    }
//
//    @EventHandler(
//       ignoreCancelled = true
//    )
//    public void onInteract(PlayerInteractEvent event) {
//       if (event.getAction() == Action.LEFT_CLICK_BLOCK) {
//          this.addBClick(event.getPlayer());
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGHEST,
//       ignoreCancelled = true
//    )
//    public void onGamemode(PlayerGameModeChangeEvent event) {
//       if (event.getNewGameMode() != GameMode.CREATIVE && event.getNewGameMode() != GameMode.SPECTATOR) {
//          this.updateLastFly(event.getPlayer());
//          BAC.getBAC().EXEMPTHANDLER.addExemption(event.getPlayer(), 3000, "gamemode change");
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGHEST,
//       ignoreCancelled = true
//    )
//    public void onEnter(VehicleEnterEvent event) {
//       if (event.getEntered() instanceof Player && event.getVehicle().getType() == EntityType.BOAT) {
//          this.updateLastRegularBoatLocation((Player)event.getEntered());
//       }
//
//    }
//
//    public Location getLastRegularBoatLocation(Player p) {
//       return !LastRegularBoatLocation.containsKey(p) ? null : (Location)LastRegularBoatLocation.get(p);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onDamage(EntityDamageEvent event) {
//       if (event.getEntity() instanceof Player) {
//          Player p = (Player)event.getEntity();
//          if (event.getCause().toString().toUpperCase().contains("EXPLOSION")) {
//             BAC.getBAC().EXEMPTHANDLER.addExemption(p, 3000, "explosion");
//          }
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGHEST,
//       ignoreCancelled = true
//    )
//    public void onFly(PlayerToggleFlightEvent event) {
//       if (!event.isFlying()) {
//          this.updateLastFly(event.getPlayer());
//          BAC.getBAC().EXEMPTHANDLER.addExemption(event.getPlayer(), 3000, "toggle flight");
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGHEST,
//       ignoreCancelled = true
//    )
//    public void onTeleport(PlayerTeleportEvent event) {
//       this.updateLastTeleport(event.getPlayer());
//       BAC.getBAC().EXEMPTHANDLER.addExemption(event.getPlayer(), 5000, "teleportation");
//       Boolean water = false;
//       List b = UtilBlock.getSurrounding(event.getPlayer().getLocation().getBlock(), true);
//       Iterator var5 = b.iterator();
//
//       while(var5.hasNext()) {
//          Block a = (Block)var5.next();
//          if (a.isLiquid()) {
//             water = true;
//             break;
//          }
//       }
//
//       if (water) {
//          var5 = event.getPlayer().getNearbyEntities(0.75D, 1.0D, 0.75D).iterator();
//
//          while(var5.hasNext()) {
//             Entity e = (Entity)var5.next();
//             if (e.getLocation().getY() < event.getPlayer().getLocation().getY() && e.getType() == EntityType.BOAT && e.getPassenger() == null) {
//                e.setVelocity(new Vector(0, 0, 0));
//                event.setCancelled(true);
//                break;
//             }
//          }
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onMove(PlayerMoveEvent event) {
//       Player p = event.getPlayer();
//       Location f = event.getFrom();
//       Location t = event.getTo();
//       if (UtilBlock.onBlock(p)) {
//          this.updateLastGroundTime(p);
//          this.updateLastRegularMove(p);
//       }
//
//       if (p.isSprinting()) {
//          LastSprint.put(p, System.currentTimeMillis());
//       }
//
//       if (p.isInsideVehicle() && p.getVehicle().getLocation().getBlock().isLiquid()) {
//          this.updateLastRegularBoatLocation(p);
//       }
//
//       if (this.getLastElytraFly(p) < 150L && this.getLastElytraFly(p) != -1L) {
//          BAC.getBAC().EXEMPTHANDLER.addExemption(p, 500, "elytra fly");
//       }
//
//       if (t.getY() < f.getY() && !VersionUtil.isFlying(p)) {
//          this.updateFalling(p, true);
//          this.updateLastFall(p);
//          this.updateBouncing(p, false);
//          this.updateLastSlimeBounce(p);
//       } else {
//          this.updateFalling(p, false);
//          if (p.getLocation().getBlock().getRelative(BlockFace.DOWN).getType() == Material.SLIME_BLOCK) {
//             this.updateBouncing(p, true);
//             this.updateLastSlimeBounce(p);
//          } else if (this.isBouncing(p) && this.getDown(t) == Material.AIR) {
//             this.updateLastSlimeBounce(p);
//          } else {
//             this.updateBouncing(p, false);
//          }
//       }
//
//       if (t.getY() > f.getY()) {
//          this.updateFalling(p, false);
//       }
//
//    }
//
//    private Material getDown(Location p) {
//       return p.getBlock().getRelative(BlockFace.DOWN).getType();
//    }
//
//    public Long getLastElytraFly(Player p) {
//       return !LastElytraFly.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastElytraFly.get(p);
//    }
//
//    public Long getLastFly(Player p) {
//       return !LastFly.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastFly.get(p);
//    }
//
//    public Long getLastFall(Player p) {
//       return !LastFall.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastFall.get(p);
//    }
//
//    public Long getLastSlimeBounce(Player p) {
//       return !LastSlimeBounce.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastSlimeBounce.get(p);
//    }
//
//    public Long getLastSprint(Player p) {
//       return !LastSprint.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastSprint.get(p);
//    }
//
//    public Long getLastTeleport(Player p) {
//       return !LastTeleport.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastTeleport.get(p);
//    }
//
//    public Long getLastGroundTime(Player p) {
//       return !LastGroundTime.containsKey(p) ? -1L : System.currentTimeMillis() - (Long)LastGroundTime.get(p);
//    }
//
//    public Boolean isFalling(Player p) {
//       return Falling.contains(p);
//    }
//
//    public Boolean isElytra(Player p) {
//       return false;
//    }
//
//    public Boolean isBouncing(Player p) {
//       return Bouncing.contains(p);
//    }
//
//    private void updateLastFly(Player p) {
//       LastFly.put(p, System.currentTimeMillis());
//    }
//
//    private void updateLastFall(Player p) {
//       LastFall.put(p, System.currentTimeMillis());
//    }
//
//    private void updateLastSlimeBounce(Player p) {
//       LastSlimeBounce.put(p, System.currentTimeMillis());
//    }
//
//    private void updateLastTeleport(Player p) {
//       LastTeleport.put(p, System.currentTimeMillis());
//    }
//
//    private void updateLastGroundTime(Player p) {
//       LastGroundTime.put(p, System.currentTimeMillis());
//    }
//
//    private void updateFalling(Player p, Boolean f) {
//       if (f) {
//          if (!Falling.contains(p)) {
//             Falling.add(p);
//          }
//
//       } else {
//          if (Falling.contains(p)) {
//             Falling.remove(p);
//          }
//
//       }
//    }
//
//    private void updateBouncing(Player p, Boolean b) {
//       if (b) {
//          if (!Bouncing.contains(p)) {
//             Bouncing.add(p);
//          }
//
//       } else {
//          if (Bouncing.contains(p)) {
//             Bouncing.remove(p);
//          }
//
//       }
//    }
// }
//
