package net.codingarea.challenges.plugin.management.scheduler;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.Challenges;
import org.bukkit.Bukkit;

final class TimerTaskExecutor extends AbstractTaskExecutor {
   private final TimerTaskConfig config;

   TimerTaskExecutor(@Nonnull TimerTaskConfig config) {
      this.config = config;
   }

   public void execute() {
      if (this.config.isAsync()) {
         Bukkit.getScheduler().runTaskAsynchronously(Challenges.getInstance(), this);
      } else if (!Bukkit.isPrimaryThread()) {
         Bukkit.getScheduler().runTask(Challenges.getInstance(), this);
      } else {
         this.run();
      }

   }

   @Nonnull
   public TimerTaskConfig getConfig() {
      return this.config;
   }
}
