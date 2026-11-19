package net.codingarea.challenges.plugin.management.server;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.content.loader.LanguageLoader;
import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
import net.codingarea.challenges.plugin.management.server.scoreboard.ChallengeBossBar;
import net.codingarea.challenges.plugin.management.server.scoreboard.ChallengeScoreboard;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

public final class ScoreboardManager {
   private final List bossbars = new ArrayList();
   private ChallengeScoreboard currentScoreboard;

   public ScoreboardManager() {
      ChallengeAPI.subscribeLoader(LanguageLoader.class, this::updateAll);
      ChallengeAPI.registerScheduler(this);
   }

   public void handleQuit(@Nonnull Player player) {
      Iterator var2 = this.bossbars.iterator();

      while(var2.hasNext()) {
         ChallengeBossBar bossbar = (ChallengeBossBar)var2.next();
         bossbar.applyHide(player);
      }

      if (this.currentScoreboard != null) {
         this.currentScoreboard.applyHide(player);
         Bukkit.getScheduler().runTaskLaterAsynchronously(Challenges.getInstance(), () -> {
            this.currentScoreboard.update();
         }, 1L);
      }

   }

   public void handleJoin(@Nonnull Player player) {
      this.updateAll();
   }

   @TimerTask(
      status = {TimerStatus.RUNNING, TimerStatus.PAUSED}
   )
   public void updateAll() {
      Iterator var1 = this.bossbars.iterator();

      while(var1.hasNext()) {
         ChallengeBossBar bossbar = (ChallengeBossBar)var1.next();
         bossbar.update();
      }

      if (this.currentScoreboard != null) {
         this.currentScoreboard.update();
      }

   }

   public void showBossBar(@Nonnull ChallengeBossBar bossbar) {
      if (!this.bossbars.contains(bossbar)) {
         this.bossbars.add(bossbar);
         bossbar.update();
      }
   }

   public void hideBossBar(@Nonnull ChallengeBossBar bossbar) {
      if (this.bossbars.remove(bossbar)) {
         Collection var10000 = Bukkit.getOnlinePlayers();
         Objects.requireNonNull(bossbar);
         var10000.forEach(bossbar::applyHide);
      }
   }

   @Nullable
   public ChallengeScoreboard getCurrentScoreboard() {
      return this.currentScoreboard;
   }

   public void setCurrentScoreboard(@Nullable ChallengeScoreboard scoreboard) {
      if (this.currentScoreboard != scoreboard) {
         if (this.currentScoreboard != null) {
            Collection var10000 = Bukkit.getOnlinePlayers();
            ChallengeScoreboard var10001 = this.currentScoreboard;
            Objects.requireNonNull(var10001);
            var10000.forEach(var10001::applyHide);
         }

         this.currentScoreboard = scoreboard;
         if (scoreboard != null) {
            scoreboard.update();
         }
      }
   }

   public void disable() {
      ChallengeBossBar[] var1 = (ChallengeBossBar[])this.bossbars.toArray(new ChallengeBossBar[0]);
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         ChallengeBossBar bossbar = var1[var3];
         this.hideBossBar(bossbar);
      }

      this.setCurrentScoreboard((ChallengeScoreboard)null);
   }

   public boolean isShown(@Nonnull ChallengeBossBar bossbar) {
      return this.bossbars.contains(bossbar);
   }

   public boolean isShown(@Nonnull ChallengeScoreboard scoreboard) {
      return this.currentScoreboard == scoreboard;
   }
}
