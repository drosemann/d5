// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/CriticalCheck.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/CriticalCheck.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/combat/CriticalCheck.java), unveraendert, als Inline-Doku ----
// package me.jinky.checks.combat;
//
// import me.jinky.BAC;
// import me.jinky.Settings;
// import me.jinky.checks.Check;
// import me.jinky.checks.CheckResult;
// import me.jinky.logger.User;
// import me.jinky.util.UtilBlock;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Event;
// import org.bukkit.event.entity.EntityDamageByEntityEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
// import org.bukkit.potion.PotionEffectType;
//
// public class CriticalCheck extends Check {
//    public String getName() {
//       return "CriticalCheck";
//    }
//
//    public String getEventCall() {
//       return "EntityDamageByEntityEvent";
//    }
//
//    public CheckResult performCheck(User u, Event ev) {
//       EntityDamageByEntityEvent e = (EntityDamageByEntityEvent)ev;
//       if (e.getCause() != DamageCause.ENTITY_ATTACK) {
//          return new CheckResult("Criticals", true, "not from combat");
//       } else {
//          Player p = (Player)e.getDamager();
//          if (isCritical(p) && (p.getLocation().getY() % 1.0D == 0.0D || p.getLocation().getY() % 0.5D == 0.0D) && p.getLocation().clone().subtract(0.0D, 1.0D, 0.0D).getBlock().getType().isSolid()) {
//             e.setCancelled(Settings.CANCEL_ON_OFFENSE);
//             BAC.getBAC().EXEMPTHANDLER.addExemptionBlock(u.getPlayer(), 250);
//             return new CheckResult("Criticals", false, "player isn't actually falling.");
//          } else {
//             return new CheckResult("Criticals", true, "pass");
//          }
//       }
//    }
//
//    private static boolean isCritical(Player player) {
//       return player.getFallDistance() > 0.0F && !player.isOnGround() && !player.isInsideVehicle() && !player.hasPotionEffect(PotionEffectType.BLINDNESS) && !UtilBlock.isHoveringOverWater(player.getLocation(), 25) && player.getEyeLocation().getBlock().getType() != Material.LADDER && player.getEyeLocation().getBlock().getType() != Material.VINE;
//    }
// }
//
