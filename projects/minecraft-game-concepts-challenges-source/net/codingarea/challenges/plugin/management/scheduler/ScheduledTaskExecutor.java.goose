// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskExecutor.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskExecutor.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskExecutor.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import org.bukkit.Bukkit;
// import org.bukkit.scheduler.BukkitScheduler;
// import org.bukkit.scheduler.BukkitTask;
//
// final class ScheduledTaskExecutor extends AbstractTaskExecutor {
//    private final ScheduledTaskConfig config;
//    private BukkitTask task;
//
//    ScheduledTaskExecutor(@Nonnull ScheduledTaskConfig config) {
//       this.config = config;
//    }
//
//    public void stop() {
//       if (this.task != null && !this.task.isCancelled()) {
//          this.task.cancel();
//          this.task = null;
//       }
//
//    }
//
//    public void start() {
//       BukkitScheduler scheduler = Bukkit.getScheduler();
//       Challenges plugin = Challenges.getInstance();
//       this.task = this.config.isAsync() ? scheduler.runTaskTimerAsynchronously(plugin, this, 0L, (long)this.config.getRate()) : scheduler.runTaskTimer(plugin, this, 0L, (long)this.config.getRate());
//    }
//
//    @Nonnull
//    public ScheduledTaskConfig getConfig() {
//       return this.config;
//    }
// }
//
