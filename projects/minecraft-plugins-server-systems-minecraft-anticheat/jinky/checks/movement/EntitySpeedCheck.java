package me.jinky.checks.movement;

import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.JVelocity;
import me.jinky.util.UtilMath;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
import org.bukkit.event.player.PlayerMoveEvent;

public class EntitySpeedCheck extends Check {
   public String getName() {
      return "EntitySpeedCheck";
   }

   public String getEventCall() {
      return "PlayerMoveEvent";
   }

   public CheckResult performCheck(User u, Event e) {
      PlayerMoveEvent event = (PlayerMoveEvent)e;
      Player p = u.getPlayer();
      if (!p.isInsideVehicle()) {
         return new CheckResult("EntitySpeedCheck", true, "pass");
      } else {
         Entity v = p.getVehicle();
         if (v.getType() == EntityType.MINECART) {
            return new CheckResult("EntitySpeedCheck", true, "pass");
         } else {
            JVelocity jv = new JVelocity(event.getFrom(), event.getTo());
            double limit = 5.75D;
            return jv.offset() > limit ? new CheckResult("Entity Speed", false, "vehicle moved at " + UtilMath.trim(2, jv.offset()) + " speed, max possible is " + limit) : new CheckResult("EntitySpeedCheck", true, "pass");
         }
      }
   }
}
