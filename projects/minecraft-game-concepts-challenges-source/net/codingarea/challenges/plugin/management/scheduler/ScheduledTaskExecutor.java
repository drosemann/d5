package net.codingarea.challenges.plugin.management.scheduler;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.Challenges;
import org.bukkit.Bukkit;
import org.bukkit.scheduler.BukkitScheduler;
import org.bukkit.scheduler.BukkitTask;

final class ScheduledTaskExecutor extends AbstractTaskExecutor {
   private final ScheduledTaskConfig config;
   private BukkitTask task;

   ScheduledTaskExecutor(@Nonnull ScheduledTaskConfig config) {
      this.config = config;
   }

   public void stop() {
      if (this.task != null && !this.task.isCancelled()) {
         this.task.cancel();
         this.task = null;
      }

   }

   public void start() {
      BukkitScheduler scheduler = Bukkit.getScheduler();
      Challenges plugin = Challenges.getInstance();
      this.task = this.config.isAsync() ? scheduler.runTaskTimerAsynchronously(plugin, this, 0L, (long)this.config.getRate()) : scheduler.runTaskTimer(plugin, this, 0L, (long)this.config.getRate());
   }

   @Nonnull
   public ScheduledTaskConfig getConfig() {
      return this.config;
   }
}
