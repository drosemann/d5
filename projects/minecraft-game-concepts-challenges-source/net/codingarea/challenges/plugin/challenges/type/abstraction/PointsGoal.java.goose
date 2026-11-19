// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/PointsGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/PointsGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/PointsGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.UUID;
// import java.util.concurrent.atomic.AtomicInteger;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
// import org.bukkit.entity.Player;
//
// public abstract class PointsGoal extends SettingGoal {
//    private final Map points = new HashMap();
//
//    public PointsGoal() {
//    }
//
//    public PointsGoal(boolean enabledByDefault) {
//       super(enabledByDefault);
//    }
//
//    protected void onEnable() {
//       super.onEnable();
//       this.scoreboard.setContent(GoalHelper.createScoreboard(() -> {
//          return this.getPoints(new AtomicInteger(), true);
//       }));
//       this.scoreboard.show();
//    }
//
//    protected void onDisable() {
//       super.onDisable();
//       this.scoreboard.hide();
//    }
//
//    public void loadGameState(@Nonnull Document document) {
//       super.loadGameState(document);
//       Document scores = document.getDocument("scores");
//       Iterator var3 = scores.keys().iterator();
//
//       while(var3.hasNext()) {
//          String key = (String)var3.next();
//
//          try {
//             UUID uuid = UUID.fromString(key);
//             int value = scores.getInt(key);
//             this.points.put(uuid, value);
//          } catch (Exception var7) {
//             Logger.error("Could not load scores for {}", key);
//          }
//       }
//
//    }
//
//    public void writeGameState(@Nonnull Document document) {
//       super.writeGameState(document);
//       Document scores = document.getDocument("scores");
//       this.points.forEach((uuid, points) -> {
//          scores.set(uuid.toString(), points);
//       });
//    }
//
//    public void getWinnersOnEnd(@Nonnull List winners) {
//       GoalHelper.getWinnersOnEnd(winners, this.getPoints(new AtomicInteger(), false));
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    protected Map getPoints(@Nonnull AtomicInteger mostPoints, boolean zeros) {
//       return GoalHelper.createPointsFromValues(mostPoints, this.points, (uuid, integer) -> {
//          return integer;
//       }, zeros);
//    }
//
//    protected void collect(@Nonnull Player player) {
//       this.collect(player, 1);
//    }
//
//    protected void collect(@Nonnull Player player, int amount) {
//       this.points.compute(player.getUniqueId(), (uuid, points) -> {
//          return points == null ? amount : points + amount;
//       });
//       this.scoreboard.update();
//    }
//
//    protected void setPoints(@Nonnull UUID uuid, int amount) {
//       this.points.put(uuid, amount);
//       this.scoreboard.update();
//    }
//
//    protected void addPoints(@Nonnull UUID uuid, int amount) {
//       this.points.put(uuid, this.getPoints(uuid) + amount);
//       this.scoreboard.update();
//    }
//
//    protected void removePoints(@Nonnull UUID uuid, int amount) {
//       this.points.put(uuid, this.getPoints(uuid) - amount);
//       this.scoreboard.update();
//    }
//
//    @CheckReturnValue
//    protected int getPoints(@Nonnull UUID uuid) {
//       Integer points = (Integer)this.points.get(uuid);
//       return points == null ? 0 : points;
//    }
// }
//
