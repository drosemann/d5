// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/stats/LeaderboardInfo.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/stats/LeaderboardInfo.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/stats/LeaderboardInfo.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.stats;
//
// import java.util.EnumMap;
// import java.util.Map;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
//
// public final class LeaderboardInfo {
//    private final Map values = new EnumMap(Statistic.class);
//
//    public void setPlace(@Nonnull Statistic statistic, @Nonnegative int place) {
//       this.values.put(statistic, place);
//    }
//
//    public int getPlace(@Nonnull Statistic statistic) {
//       return (Integer)this.values.getOrDefault(statistic, 1);
//    }
// }
//
