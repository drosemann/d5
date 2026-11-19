package me.jinky.checks.movement;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import me.jinky.BAC;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.UtilBlock;
import me.jinky.util.VersionUtil;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;

public class HoverCheck extends Check {
   private static Map HoverTicks = new HashMap();

   public String getName() {
      return "HoverFlyCheck";
   }

   public String getEventCall() {
      return "PlayerMoveEvent";
   }

   public CheckResult performCheck(User u, Event e) {
      Player p = u.getPlayer();
      int Count = 0;
      if (HoverTicks.containsKey(p)) {
         Count = (Integer)((Map)HoverTicks.get(p)).keySet().iterator().next();
         if (!UtilBlock.onBlock(p) && p.getLocation().getY() == (Double)((Map)HoverTicks.get(p)).values().iterator().next()) {
            ++Count;
            Iterator var6 = UtilBlock.getSurrounding(p.getLocation().getBlock(), true).iterator();

            while(var6.hasNext()) {
               Block b = (Block)var6.next();
               if (b.getType() != Material.AIR && p.getLocation().distance(b.getLocation()) < 1.25D) {
                  Count = 0;
               }
            }
         }
      }

      HashMap R;
      if (Count > 2 && !p.isInsideVehicle() && !VersionUtil.isFlying(p)) {
         R = new HashMap();
         R.put(0, p.getLocation().getY());
         HoverTicks.put(p, R);
         BAC.getBAC().EXEMPTHANDLER.addExemptionBlock(p, 20);
         return new CheckResult("Flight", false, "hover");
      } else {
         R = new HashMap();
         if (Count == 2) {
            Count = 1;
         }

         R.put(Count, p.getLocation().getY());
         HoverTicks.put(p, R);
         return new CheckResult("Flight", true, "pass");
      }
   }
}
