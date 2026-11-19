// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/KillEntityGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/KillEntityGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/KillEntityGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import java.util.List;
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import org.bukkit.World.Environment;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDeathEvent;
//
// public abstract class KillEntityGoal extends SettingGoal {
//    protected final EntityType entity;
//    protected final Environment environment;
//    protected boolean oneWinner;
//    protected boolean killerNeeded;
//    protected Player winner;
//
//    public KillEntityGoal(@Nonnull EntityType entity) {
//       this(entity, false);
//    }
//
//    public KillEntityGoal(@Nonnull EntityType entity, boolean enabledByDefault) {
//       this(entity, (Environment)null, enabledByDefault);
//    }
//
//    public KillEntityGoal(EntityType entity, Environment world) {
//       this(entity, world, false);
//    }
//
//    public KillEntityGoal(EntityType entity, Environment world, boolean enabledByDefault) {
//       super(enabledByDefault);
//       this.oneWinner = true;
//       this.killerNeeded = false;
//       this.entity = entity;
//       this.environment = world;
//    }
//
//    public void getWinnersOnEnd(@Nonnull List winners) {
//       if (this.oneWinner && this.winner != null) {
//          winners.add(this.winner);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onKill(@Nonnull EntityDeathEvent event) {
//       if (this.isEnabled() && ChallengeAPI.isStarted()) {
//          LivingEntity entity = event.getEntity();
//          if (entity.getType() == this.entity) {
//             if (this.environment == null || event.getEntity().getWorld().getEnvironment() == this.environment) {
//                if (this.oneWinner) {
//                   this.winner = event.getEntity().getKiller();
//                   if (this.killerNeeded && this.winner == null) {
//                      return;
//                   }
//                }
//
//                ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
//             }
//          }
//       }
//    }
//
//    @Generated
//    public void setOneWinner(boolean oneWinner) {
//       this.oneWinner = oneWinner;
//    }
// }
//
