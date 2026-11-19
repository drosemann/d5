package me.jinky.checks.movement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import me.jinky.BAC;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.UtilBlock;
import org.bukkit.GameMode;
import org.bukkit.block.Block;
import org.bukkit.block.BlockFace;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
import org.bukkit.event.player.PlayerMoveEvent;

public class FloatCheck extends Check {
   private static Map calls = new HashMap();

   public String getName() {
      return "FloatFlyCheck";
   }

   public String getEventCall() {
      return "PlayerMoveEvent";
   }

   public CheckResult performCheck(User u, Event e) {
      PlayerMoveEvent event = (PlayerMoveEvent)e;
      if (!calls.containsKey(u.getPlayer())) {
         calls.put(u.getPlayer(), 0);
      }

      int cc = (Integer)calls.get(u.getPlayer());
      Player p = u.getPlayer();
      if (!p.isFlying() && p.getGameMode() != GameMode.CREATIVE && p.getGameMode() != GameMode.SPECTATOR && !p.isInsideVehicle() && !p.getLocation().getBlock().isLiquid() && !p.getLocation().getBlock().getType().toString().contains("SEAGRASS") && !p.getLocation().getBlock().getType().toString().contains("KELP")) {
         ArrayList around = UtilBlock.getSurroundingIgnoreAir(u.getBlock(), true);
         Boolean onlyliquid = true;
         Iterator var9 = around.iterator();

         while(var9.hasNext()) {
            Block b = (Block)var9.next();
            if (!b.isLiquid()) {
               onlyliquid = false;
            }
         }

         if (onlyliquid) {
            return new CheckResult("Flight", true, "pass");
         } else {
            Double mpx = event.getFrom().getY() - event.getTo().getY();
            if (event.getTo().getY() == event.getFrom().getY() && !u.getBlockBelow().isLiquid() && around.size() == 0) {
               ++cc;
            } else if (mpx <= 0.007D && !u.getBlockBelow().isLiquid() && !p.getLocation().getBlock().getRelative(BlockFace.DOWN).isLiquid() && around.size() == 0) {
               ++cc;
            } else if (BAC.getBAC().getUser(p).isFalling() && mpx <= 0.07D) {
               ++cc;
            } else if (cc > 0) {
               --cc;
            }

            if (cc > 7) {
               calls.put(u.getPlayer(), 2);
               return new CheckResult("Flight", false, "floating");
            } else {
               calls.put(u.getPlayer(), cc);
               return new CheckResult("Flight", true, "pass");
            }
         }
      } else {
         return new CheckResult("Flight", true, "pass");
      }
   }
}
