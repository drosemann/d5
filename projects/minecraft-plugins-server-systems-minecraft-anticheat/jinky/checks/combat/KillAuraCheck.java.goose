// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/KillAuraCheck.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/KillAuraCheck.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/KillAuraCheck.java), unveraendert, als Inline-Doku ----
// package me.jinky.checks.combat;
//
// import java.util.HashMap;
// import java.util.Map;
// import me.jinky.checks.Check;
// import me.jinky.checks.CheckResult;
// import me.jinky.logger.User;
// import me.jinky.util.UtilMath;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Event;
// import org.bukkit.event.entity.EntityDamageByEntityEvent;
// import org.bukkit.util.Vector;
//
// public class KillAuraCheck extends Check {
//    private static Map lastloc = new HashMap();
//
//    public String getName() {
//       return "AuraCheck";
//    }
//
//    public String getEventCall() {
//       return "EntityDamageByEntityEvent";
//    }
//
//    public String getSecondaryEventCall() {
//       return "PlayerMoveEvent";
//    }
//
//    public CheckResult performCheck(User u, Event ex) {
//       Player p = u.getPlayer();
//       if (ex.getEventName().equalsIgnoreCase("PlayerMoveEvent")) {
//          lastloc.put(p, p.getLocation());
//          return new CheckResult("Kill Aura", true, "playermovelog");
//       } else if (p.isBlocking()) {
//          return new CheckResult("Impossible Fight", false, "player is blocking + attacking");
//       } else if (p.isSleeping()) {
//          return new CheckResult("Impossible Fight", false, "player is sleeping");
//       } else if (p.isDead()) {
//          return new CheckResult("Impossible Fight", false, "player is dead");
//       } else {
//          if (ex.getEventName().equalsIgnoreCase("EntityDamageByEntityEvent")) {
//             EntityDamageByEntityEvent event = (EntityDamageByEntityEvent)ex;
//             if (!(event.getDamager() instanceof Player)) {
//                return new CheckResult("Kill Aura", true, "not a player attacking");
//             }
//
//             Player entity1 = (Player)event.getDamager();
//             Entity entity2 = event.getEntity();
//             if (!(entity2 instanceof LivingEntity)) {
//                return new CheckResult("Kill Aura", true, "target is not a living entity");
//             }
//
//             boolean lineOfSight = false;
//             Vector line = entity1.getLocation().toVector().clone().subtract(entity2.getLocation().toVector()).normalize();
//             Vector dirFacing = ((LivingEntity)entity2).getEyeLocation().getDirection().clone().normalize();
//             double angle = Math.acos(line.dot(dirFacing));
//             if (angle > 0.785398163D) {
//                lineOfSight = false;
//             }
//
//             if (!lastloc.containsKey(p) || p.getGameMode() == GameMode.CREATIVE || p.getGameMode() == GameMode.SPECTATOR) {
//                return new CheckResult("Kill Aura", true, "move event didnt update, probably in creative mode.");
//             }
//
//             double oy = (double)Math.abs(((Location)lastloc.get(p)).getYaw());
//             double op = (double)Math.abs(((Location)lastloc.get(p)).getPitch());
//             double cy = (double)Math.abs(p.getLocation().getYaw());
//             double cp = (double)Math.abs(p.getLocation().getPitch());
//             boolean f_yaw = Math.abs(UtilMath.trim(1, cy - oy)) > 45.0D;
//             boolean f_pitch = Math.abs(UtilMath.trim(1, cp - op)) > 45.0D;
//             if (f_yaw || f_pitch) {
//                return new CheckResult("Kill Aura", false, "irregular head snapping");
//             }
//
//             if (lineOfSight) {
//                return new CheckResult("Kill Aura", false, "hit target not in sight");
//             }
//          }
//
//          return new CheckResult("Kill Aura", true, "pass");
//       }
//    }
// }
//
