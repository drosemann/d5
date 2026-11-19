package me.jinky.handlers;

import java.util.Iterator;
import me.jinky.BAC;
import me.jinky.Settings;
import me.jinky.checks.Check;
import me.jinky.checks.CheckResult;
import me.jinky.util.MiniPlugin;
import org.bukkit.GameMode;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerMoveEvent;

public class MovementHandler extends MiniPlugin {
   public MovementHandler(BAC plugin) {
      super("Movement Handler", plugin);
   }

   @EventHandler(
      ignoreCancelled = true
   )
   public void onMove(PlayerMoveEvent event) {
      if (Settings.ENABLED && event.getPlayer().getGameMode() != GameMode.CREATIVE && event.getPlayer().getGameMode() != GameMode.SPECTATOR) {
         if (!this.getPlugin().EXEMPTHANDLER.isExempt(event.getPlayer())) {
            Iterator var3 = this.getPlugin().All_Checks.iterator();

            while(true) {
               Check c;
               do {
                  if (!var3.hasNext()) {
                     return;
                  }

                  c = (Check)var3.next();
               } while(!c.getEventCall().equals(event.getEventName()) && !c.getSecondaryEventCall().equals(event.getEventName()));

               CheckResult result = c.performCheck(this.getPlugin().getUser(event.getPlayer()), event);
               if (!result.passed()) {
                  this.getPlugin().addSuspicion(event.getPlayer(), result.getCheckName());
               }
            }
         }
      }
   }
}
