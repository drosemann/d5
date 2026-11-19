// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/movement/BoatCheck.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/movement/BoatCheck.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/checks/movement/BoatCheck.java), unveraendert, als Inline-Doku ----
// package me.jinky.checks.movement;
//
// import me.jinky.BAC;
// import me.jinky.checks.Check;
// import me.jinky.checks.CheckResult;
// import me.jinky.logger.User;
// import me.jinky.util.UtilBlock;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.EntityType;
// import org.bukkit.event.Event;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class BoatCheck extends Check {
//    public String getName() {
//       return "BoatFlyCheck";
//    }
//
//    public String getEventCall() {
//       return "PlayerMoveEvent";
//    }
//
//    public CheckResult performCheck(User u, Event e) {
//       if (!u.getBlock().isLiquid() && !u.getBlock().getType().toString().toLowerCase().contains("carpet")) {
//          if (u.InVehicle() && u.getVehicle().getType() == EntityType.BOAT) {
//             PlayerMoveEvent ev = (PlayerMoveEvent)e;
//             if (u.getVehicleBlock().getType() == Material.AIR && !UtilBlock.onBlock(u.getVehicle().getLocation()) && UtilBlock.getSurroundingIgnoreAir(u.getVehicleBlock(), true).size() == 0) {
//                Location LastSafe = u.LastNormalBoatLoc();
//                if (ev.getTo().getY() < ev.getFrom().getY()) {
//                   return new CheckResult("Boat Fly", true, "pass");
//                }
//
//                if (LastSafe != null) {
//                   BAC.getBAC().EXEMPTHANDLER.addExemptionBlock(u.getPlayer(), 5);
//                   Entity v = u.getVehicle();
//                   v.teleport(LastSafe);
//                } else {
//                   u.eject();
//                }
//
//                return new CheckResult("Boat Fly", false, "player is around no blocks");
//             }
//          }
//
//          return new CheckResult("Boat Fly", true, "pass");
//       } else {
//          return new CheckResult("Boat Fly", true, "pass");
//       }
//    }
// }
//
