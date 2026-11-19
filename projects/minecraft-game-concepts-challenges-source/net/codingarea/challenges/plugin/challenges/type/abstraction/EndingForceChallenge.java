package net.codingarea.challenges.plugin.challenges.type.abstraction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

public abstract class EndingForceChallenge extends AbstractForceChallenge {
   public EndingForceChallenge(@Nonnull MenuType menu) {
      super(menu);
   }

   public EndingForceChallenge(@Nonnull MenuType menu, int max) {
      super(menu, max);
   }

   public EndingForceChallenge(@Nonnull MenuType menu, int min, int max) {
      super(menu, min, max);
   }

   public EndingForceChallenge(@Nonnull MenuType menu, int min, int max, int defaultValue) {
      super(menu, min, max, defaultValue);
   }

   protected final void handleCountdownEnd() {
      this.checkAllPlayers();
   }

   private void checkAllPlayers() {
      List failed = new ArrayList();
      Iterator var2 = Bukkit.getOnlinePlayers().iterator();

      while(var2.hasNext()) {
         Player player = (Player)var2.next();
         if (!ignorePlayer(player) && this.isFailing(player)) {
            this.broadcastFailedMessage(player);
            failed.add(player);
         }
      }

      if (!failed.isEmpty()) {
         this.killFailedPlayers(failed);
      } else {
         this.broadcastSuccessMessage();
         SoundSample.LEVEL_UP.broadcast();
      }
   }

   private void killFailedPlayers(@Nonnull Iterable failed) {
      if (ChallengeAPI.isStarted()) {
         failed.forEach(ChallengeHelper::kill);
      }
   }

   protected void handleCountdown() {
      this.bossbar.update();
   }

   protected abstract boolean isFailing(@Nonnull Player var1);

   protected abstract void broadcastFailedMessage(@Nonnull Player var1);

   protected abstract void broadcastSuccessMessage();
}
