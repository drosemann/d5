package me.jinky.checks.combat;

import java.util.HashMap;
import java.util.Map;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import org.bukkit.Location;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
import org.bukkit.event.entity.EntityDamageByEntityEvent;

public class MultiAuraCheck extends Check {
   private static Map LastHit = new HashMap();

   public String getName() {
      return "MultiAuraCheck";
   }

   public String getEventCall() {
      return "EntityDamageByEntityEvent";
   }

   public CheckResult performCheck(User u, Event ex) {
      EntityDamageByEntityEvent event = (EntityDamageByEntityEvent)ex;
      Location hit = event.getEntity().getLocation();
      String ret = null;
      Player p = u.getPlayer();
      if (LastHit.containsKey(p)) {
         long time = System.currentTimeMillis() - (Long)((Map)LastHit.get(p)).keySet().iterator().next();
         Location last = (Location)((Map)LastHit.get(p)).values().iterator().next();
         if (last.getWorld() != hit.getWorld()) {
            return new CheckResult("MultiAura", true, "pass");
         }

         double distance = last.distance(hit);
         if (distance > 1.5D && time < 8L) {
            ret = "Multi Aura";
         }
      }

      Map R = new HashMap();
      R.put(System.currentTimeMillis(), hit);
      LastHit.put(p, R);
      return ret != null ? new CheckResult("Multi Aura", false, "hit multiple entities in less than 8ms") : new CheckResult("Multi Aura", true, "pass");
   }
}
