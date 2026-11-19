// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskExecutor.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskExecutor.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskExecutor.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import org.bukkit.Bukkit;
//
// final class TimerTaskExecutor extends AbstractTaskExecutor {
//    private final TimerTaskConfig config;
//
//    TimerTaskExecutor(@Nonnull TimerTaskConfig config) {
//       this.config = config;
//    }
//
//    public void execute() {
//       if (this.config.isAsync()) {
//          Bukkit.getScheduler().runTaskAsynchronously(Challenges.getInstance(), this);
//       } else if (!Bukkit.isPrimaryThread()) {
//          Bukkit.getScheduler().runTask(Challenges.getInstance(), this);
//       } else {
//          this.run();
//       }
//
//    }
//
//    @Nonnull
//    public TimerTaskConfig getConfig() {
//       return this.config;
//    }
// }
//
