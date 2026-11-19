// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RespawnSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RespawnSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RespawnSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import java.util.Map;
// import java.util.concurrent.ConcurrentHashMap;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import net.codingarea.challenges.plugin.utils.misc.ParticleUtils;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.Particle;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.PlayerDeathEvent;
// import org.bukkit.event.player.PlayerRespawnEvent;
//
// public class RespawnSetting extends Setting {
//    private final Map locationsBeforeRespawn = new ConcurrentHashMap();
//
//    public RespawnSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.RED_BED, Message.forName("item-respawn-setting"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onPlayerDeath(@Nonnull PlayerDeathEvent event) {
//       Player player = event.getEntity();
//       if (this.isEnabled()) {
//          SoundSample.DEATH.play(player);
//       } else {
//          this.locationsBeforeRespawn.put(player, player.getLocation());
//          player.setGameMode(GameMode.SPECTATOR);
//          if (ChallengeAPI.isStarted()) {
//             this.checkAllPlayersDead();
//          }
//       }
//
//       ParticleUtils.spawnUpGoingParticleCircle(Challenges.getInstance(), player.getLocation(), (Particle)MinecraftNameWrapper.WITCH_EFFECT, 17, 1.0D, 2.0D);
//    }
//
//    public void checkAllPlayersDead() {
//       int playersAlive = ChallengeAPI.getIngamePlayers().size();
//       if (playersAlive == 0) {
//          ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_FAILED);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onRespawn(@Nonnull PlayerRespawnEvent event) {
//       if (!this.isEnabled()) {
//          Player player = event.getPlayer();
//          Location locationBeforeRespawn = (Location)this.locationsBeforeRespawn.remove(player);
//          if (locationBeforeRespawn != null) {
//             if (!(locationBeforeRespawn.getY() < 0.0D)) {
//                event.setRespawnLocation(locationBeforeRespawn);
//             }
//          }
//       }
//    }
// }
//
