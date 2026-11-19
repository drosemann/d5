// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/world/AntiCactusBerryCheck.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/world/AntiCactusBerryCheck.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/world/AntiCactusBerryCheck.java), unveraendert, als Inline-Doku ----
// package me.jinky.checks.world;
//
// import me.jinky.BAC;
// import me.jinky.checks.Check;
// import me.jinky.checks.CheckResult;
// import me.jinky.logger.User;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.Event;
//
// public class AntiCactusBerryCheck extends Check {
//    public String getName() {
//       return "AntiDamage";
//    }
//
//    public String getEventCall() {
//       return "PlayerMoveEvent";
//    }
//
//    public CheckResult performCheck(User u, Event e) {
//       Player p = u.getPlayer();
//       String exemptreason = BAC.getBAC().EXEMPTHANDLER.getExemptReason(p);
//       if (!exemptreason.equals("damaged")) {
//          Boolean anticactus = false;
//          if (p.getLocation().add(0.0D, 0.0D, -0.31D).getBlock().getType() == Material.CACTUS) {
//             anticactus = true;
//          }
//
//          if (p.getLocation().add(0.0D, 0.0D, 0.31D).getBlock().getType() == Material.CACTUS) {
//             anticactus = true;
//          }
//
//          if (p.getLocation().add(0.31D, 0.0D, 0.0D).getBlock().getType() == Material.CACTUS) {
//             anticactus = true;
//          }
//
//          if (p.getLocation().add(-0.31D, 0.0D, 0.0D).getBlock().getType() == Material.CACTUS) {
//             anticactus = true;
//          }
//
//          if (anticactus) {
//             return new CheckResult("Anti-Cactus", false, "cactus didn't hurt");
//          }
//       }
//
//       return new CheckResult("AntiDamage", true, "pass");
//    }
// }
//
