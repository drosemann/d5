// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskConfig.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskConfig.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/ScheduledTaskConfig.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler;
//
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
//
// public final class ScheduledTaskConfig extends AbstractTaskConfig {
//    private final int rate;
//
//    ScheduledTaskConfig(@Nonnull ScheduledTask annotation) {
//       this(annotation.ticks(), annotation.async());
//    }
//
//    ScheduledTaskConfig(@Nonnegative int rate, boolean async) {
//       super(async);
//       this.rate = rate;
//    }
//
//    @Generated
//    public int getRate() {
//       return this.rate;
//    }
//
//    @Generated
//    public boolean equals(Object o) {
//       if (o == this) {
//          return true;
//       } else if (!(o instanceof ScheduledTaskConfig)) {
//          return false;
//       } else {
//          ScheduledTaskConfig other = (ScheduledTaskConfig)o;
//          if (!other.canEqual(this)) {
//             return false;
//          } else {
//             return this.getRate() == other.getRate();
//          }
//       }
//    }
//
//    @Generated
//    protected boolean canEqual(Object other) {
//       return other instanceof ScheduledTaskConfig;
//    }
//
//    @Generated
//    public int hashCode() {
//       int PRIME = true;
//       int result = 1;
//       int result = result * 59 + this.getRate();
//       return result;
//    }
// }
//
