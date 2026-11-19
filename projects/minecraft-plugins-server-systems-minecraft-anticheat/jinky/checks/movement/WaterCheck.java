package me.jinky.checks.movement;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.UtilBlock;
import me.jinky.util.VersionUtil;
import org.bukkit.Material;
import org.bukkit.block.BlockFace;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;

public class WaterCheck extends Check {
   private static Map lastcheck = new HashMap();
   private static Map count = new HashMap();

   public String getName() {
      return "JesusCheck";
   }

   public String getEventCall() {
      return "PlayerMoveEvent";
   }

   public CheckResult performCheck(User u, Event ev) {
      Player p = u.getPlayer();
      if (!p.isFlying() && !p.isInsideVehicle()) {
         if (!lastcheck.containsKey(p)) {
            lastcheck.put(p, 0L);
            count.put(p, 0);
         }

         Long math = System.currentTimeMillis() - (Long)lastcheck.get(p);
         if (math > 450L) {
            int oc = (Integer)count.get(p);
            Boolean waterwalk = true;
            if (p.getLocation().getBlock().getRelative(BlockFace.DOWN).getType() != Material.WATER) {
               return new CheckResult("WaterWalk", true, "player isn't above water");
            }

            if (p.getLocation().getBlock().isLiquid() || VersionUtil.isSwimming(p)) {
               waterwalk = false;
               count.put(p, 0);
               return new CheckResult("WaterWalk", true, "player is swimming");
            }

            Iterator var8 = UtilBlock.getSurroundingMat(p.getLocation().getBlock(), true).iterator();

            while(var8.hasNext()) {
               Material m = (Material)var8.next();
               if (m != Material.WATER && m != Material.AIR) {
                  waterwalk = false;
               }
            }

            if (waterwalk) {
               ++oc;
               count.put(p, oc);
            } else {
               count.put(p, 0);
            }

            lastcheck.put(p, System.currentTimeMillis());
            if (oc > 12) {
               return new CheckResult("WaterWalk", false, "floating above, not swimming");
            }
         }

         return new CheckResult("WaterWalk", true, "pass");
      } else {
         return new CheckResult("WaterWalk", true, "flying above water");
      }
   }
}
