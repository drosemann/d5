// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskConfig.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskConfig.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/TimerTaskConfig.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler;
//
// import java.util.Arrays;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
// import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
//
// public final class TimerTaskConfig extends AbstractTaskConfig {
//    private final TimerStatus[] status;
//
//    TimerTaskConfig(@Nonnull TimerTask annotation) {
//       this(annotation.status(), annotation.async());
//    }
//
//    TimerTaskConfig(@Nonnull TimerStatus[] status, boolean async) {
//       super(async);
//       this.status = status;
//    }
//
//    @Nonnull
//    public TimerStatus[] getStatus() {
//       return this.status;
//    }
//
//    public boolean acceptsStatus(@Nonnull TimerStatus status) {
//       return Arrays.asList(this.status).contains(status);
//    }
// }
//
