package me.jinky.checks.world;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.logger.User;
import me.jinky.util.BlockHardness;
import me.jinky.util.VersionUtil;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.Event;
import org.bukkit.event.block.BlockBreakEvent;

public class BreakCheck extends Check {
   private static Map BreakCount = new HashMap();

   public String getName() {
      return "BreakCheck";
   }

   public String getEventCall() {
      return "BlockBreakEvent";
   }

   public CheckResult performCheck(User u, Event e) {
      BlockBreakEvent event = (BlockBreakEvent)e;
      Player p = u.getPlayer();
      Boolean instant = false;
      Material m = event.getBlock().getType();

      try {
         if (BlockHardness.getHardness(m).getHardness() <= 0.1D) {
            instant = true;
         }
      } catch (Exception var16) {
      }

      List l = new ArrayList();
      l.add(Material.LEAVES);
      l.add(Material.LEAVES_2);
      if (p.getInventory().getItemInHand() != null && p.getInventory().getItemInHand().getType() == Material.SHEARS && l.contains(event.getBlock().getType())) {
         instant = true;
      }

      if (p.getGameMode() == GameMode.CREATIVE) {
         instant = true;
      }

      if (!instant) {
         Integer Count = 1;
         if (BreakCount.containsKey(p)) {
            if ((Long)((Map)BreakCount.get(p)).keySet().iterator().next() > System.currentTimeMillis()) {
               Count = Count + (Integer)((Map)BreakCount.get(p)).values().iterator().next();
            } else {
               ((Map)BreakCount.get(p)).clear();
            }
         }

         if (!BreakCount.containsKey(p)) {
            BreakCount.put(p, new HashMap());
         }

         Map R = new HashMap();
         if (((Map)BreakCount.get(p)).size() == 0) {
            R.put(System.currentTimeMillis() + 1000L, Count);
         } else {
            R.put((Long)((Map)BreakCount.get(p)).keySet().iterator().next(), Count);
         }

         if (!BreakCount.containsKey(p)) {
            BreakCount.put(p, new HashMap());
         }

         BreakCount.put(p, R);
         if (!event.getBlock().getType().toString().contains("MUSHROOM") && !event.getBlock().getType().toString().contains("SNOW")) {
            if (Bukkit.getPluginManager().getPlugin("GraviTree") != null && event.getBlock().getType().toString().contains("LOG")) {
               return new CheckResult("Impossible Break", true, "Ignored blocks, GraviTree compatibility.");
            } else if (Count > 9 && !VersionUtil.hasEfficiency(p)) {
               event.setCancelled(true);
               return new CheckResult("Fast Break", false, "Broke too Fast");
            } else if (VersionUtil.hasEfficiency(p)) {
               return new CheckResult("Impossible Break", true, "Efficiency Effect");
            } else {
               Location placed = event.getBlock().getLocation();
               Set NullSet = null;
               Block target = p.getTargetBlock((Set)NullSet, 15);
               Boolean call = false;

               try {
                  if (placed.distance(target.getLocation()) > 4.7D) {
                     call = true;
                  }
               } catch (Exception var15) {
                  call = false;
               }

               if (event.getBlock().getType() == Material.NETHERRACK || event.getBlock().getType().toString().contains("BAMBOO")) {
                  call = false;
               }

               return call ? new CheckResult("Impossible Break", false, "Broke out of LoS") : new CheckResult("Impossible Break", true, "Pass");
            }
         } else {
            return new CheckResult("Impossible Break", true, "Ignored blocks, different breaking speeds.");
         }
      } else {
         return new CheckResult("Impossible Break", true, "Pass");
      }
   }
}
