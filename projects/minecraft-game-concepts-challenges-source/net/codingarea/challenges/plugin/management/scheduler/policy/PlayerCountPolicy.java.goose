// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/PlayerCountPolicy.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/PlayerCountPolicy.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/scheduler/policy/PlayerCountPolicy.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.scheduler.policy;
//
// import java.util.function.BiPredicate;
// import javax.annotation.Nonnull;
// import org.bukkit.Bukkit;
//
// public enum PlayerCountPolicy implements IPolicy {
//    ALWAYS((online, max) -> {
//       return true;
//    }),
//    EMPTY((online, max) -> {
//       return online == 0;
//    }),
//    SOMEONE((online, max) -> {
//       return online > 0;
//    }),
//    FULL(Integer::equals);
//
//    private final BiPredicate check;
//
//    private PlayerCountPolicy(@Nonnull BiPredicate check) {
//       this.check = check;
//    }
//
//    public boolean check(@Nonnull Object holder) {
//       return this.check.test(Bukkit.getOnlinePlayers().size(), Bukkit.getMaxPlayers());
//    }
//
//    // $FF: synthetic method
//    private static PlayerCountPolicy[] $values() {
//       return new PlayerCountPolicy[]{ALWAYS, EMPTY, SOMEONE, FULL};
//    }
// }
//
