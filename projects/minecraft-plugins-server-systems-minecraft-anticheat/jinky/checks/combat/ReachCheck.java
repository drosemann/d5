package me.jinky.checks.combat;

import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.UtilMath;
import org.bukkit.event.Event;
import org.bukkit.event.entity.EntityDamageByEntityEvent;

public class ReachCheck extends Check {
   public String getName() {
      return "ReachCheck";
   }

   public String getEventCall() {
      return "EntityDamageByEntityEvent";
   }

   public CheckResult performCheck(User u, Event e) {
      EntityDamageByEntityEvent event = (EntityDamageByEntityEvent)e;
      Double range = event.getEntity().getLocation().distance(event.getDamager().getLocation());
      String rf = "" + range;

      try {
         range = Double.parseDouble(rf.substring(0, 4));
      } catch (Exception var7) {
      }

      return range > 5.98D ? new CheckResult("Combat Reach", false, "hit at a range of " + UtilMath.trim(2, range)) : new CheckResult("Combat Reach", true, "pass");
   }
}
