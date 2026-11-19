// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/extraworld/JumpAndRunChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/extraworld/JumpAndRunChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/extraworld/JumpAndRunChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld;
//
// import java.util.ArrayList;
// import java.util.List;
// import java.util.Optional;
// import java.util.UUID;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.WorldDependentChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.policy.ExtraWorldPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.utils.bukkit.jumpgeneration.RandomJumpGenerator;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import net.codingarea.challenges.plugin.utils.misc.ParticleUtils;
// import org.bukkit.Bukkit;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.Particle;
// import org.bukkit.block.Block;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
//
// public class JumpAndRunChallenge extends WorldDependentChallenge {
//    private final List lastPlayers = new ArrayList();
//    private int jumps = 4;
//    private int currentJump;
//    private int jumpsDone;
//    private Block targetBlock;
//    private Block lastBlock;
//    private UUID currentPlayer;
//
//    public JumpAndRunChallenge() {
//       super(MenuType.CHALLENGES, 1, 10, 5, false);
//       this.setCategory(SettingCategory.EXTRA_WORLD);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ACACIA_STAIRS, Message.forName("item-jump-and-run-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-time-seconds-range-description").asArray(this.getValue() * 60 - 30, this.getValue() * 60 + 30);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 30, this.getValue() * 60 + 30);
//    }
//
//    public void onDisable() {
//       if (this.isInExtraWorld()) {
//          this.exitJumpAndRun();
//       }
//
//    }
//
//    protected void handleCountdown() {
//       switch(this.getSecondsLeftUntilNextActivation()) {
//       case 1:
//          Message.forName("jnr-countdown-one").broadcast(Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.broadcast();
//          break;
//       case 2:
//       case 3:
//       case 5:
//          Message.forName("jnr-countdown").broadcast(Prefix.CHALLENGES, this.getSecondsLeftUntilNextActivation());
//          SoundSample.BASS_OFF.broadcast();
//       case 4:
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onQuit(@Nonnull PlayerQuitEvent event) {
//       if (this.currentPlayer != null) {
//          if (this.currentPlayer.equals(event.getPlayer().getUniqueId())) {
//             this.exitJumpAndRun();
//          }
//       }
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60, 30);
//    }
//
//    public void startWorldChallenge() {
//       this.startJumpAndRun();
//    }
//
//    protected void startJumpAndRun() {
//       this.currentJump = 0;
//       this.currentPlayer = this.getNextPlayer().getUniqueId();
//       this.lastPlayers.add(this.currentPlayer);
//       this.buildNextJump();
//       this.teleportToWorld(true, (player, index) -> {
//          player.setGameMode(player.getUniqueId().equals(this.currentPlayer) ? GameMode.SURVIVAL : GameMode.SPECTATOR);
//          player.teleport(new Location(this.getExtraWorld(), 0.5D, 101.0D, 0.5D));
//       });
//    }
//
//    protected void buildNextJump() {
//       if (this.lastBlock != null) {
//          this.lastBlock.setType(Material.AIR);
//       }
//
//       this.lastBlock = this.targetBlock != null ? this.targetBlock : this.getExtraWorld().getBlockAt(0, 100, 0);
//       this.lastBlock.setType(Material.GOLD_BLOCK);
//       Material type = this.getRandomBlockType();
//       this.targetBlock = (new RandomJumpGenerator()).next(globalRandom, this.lastBlock, type == Material.CYAN_TERRACOTTA || type == Material.EMERALD_BLOCK, type != Material.COBBLESTONE_WALL && type != Material.SPRUCE_FENCE);
//       this.targetBlock.setType(type);
//    }
//
//    @Nonnull
//    protected Material getRandomBlockType() {
//       if (this.currentJump == this.jumps - 1) {
//          return Material.EMERALD_BLOCK;
//       } else {
//          Material[] materials = new Material[]{Material.CYAN_TERRACOTTA, Material.CYAN_TERRACOTTA, Material.CYAN_TERRACOTTA, Material.CYAN_TERRACOTTA, Material.END_ROD, Material.COBBLESTONE_WALL, Material.SPRUCE_FENCE};
//          return (Material)globalRandom.choose((Object[])materials);
//       }
//    }
//
//    @Nonnull
//    protected Player getNextPlayer() {
//       List players = new ArrayList(Bukkit.getOnlinePlayers());
//       players.removeIf(AbstractChallenge::ignorePlayer);
//       players.removeIf((player) -> {
//          return this.lastPlayers.contains(player.getUniqueId());
//       });
//       if (players.isEmpty()) {
//          players = new ArrayList(Bukkit.getOnlinePlayers());
//          this.lastPlayers.clear();
//       }
//
//       return (Player)globalRandom.choose((List)players);
//    }
//
//    protected void finishJumpAndRun() {
//       ++this.jumps;
//       ++this.jumpsDone;
//       Message.forName("jnr-finished").broadcast(Prefix.CHALLENGES, Optional.ofNullable(this.currentPlayer).map(Bukkit::getPlayer).map(NameHelper::getName).orElse("?"));
//       this.exitJumpAndRun();
//       SoundSample.KLING.broadcast();
//    }
//
//    protected void exitJumpAndRun() {
//       this.currentPlayer = null;
//       this.teleportBack();
//       this.breakJumpAndRun();
//       this.restartTimer();
//    }
//
//    protected void breakJumpAndRun() {
//       if (this.lastBlock != null) {
//          this.lastBlock.setType(Material.AIR);
//       }
//
//       if (this.targetBlock != null) {
//          this.targetBlock.setType(Material.AIR);
//       }
//
//       this.lastBlock = null;
//       this.targetBlock = null;
//    }
//
//    public void writeGameState(@Nonnull Document document) {
//       super.writeGameState(document);
//       document.set("jumps", this.jumps);
//       document.set("jumpsDone", this.jumpsDone);
//    }
//
//    public void loadGameState(@Nonnull Document document) {
//       super.loadGameState(document);
//       this.jumps = document.getInt("jumps", this.jumps);
//       this.jumpsDone = document.getInt("jumpsDone", this.jumpsDone);
//    }
//
//    @ScheduledTask(
//       ticks = 20,
//       timerPolicy = TimerPolicy.ALWAYS,
//       worldPolicy = ExtraWorldPolicy.USED
//    )
//    public void spawnParticles() {
//       if (this.targetBlock != null) {
//          ParticleUtils.spawnParticleCircle(this.targetBlock.getLocation().add(0.5D, 1.05D, 0.5D), (Particle)MinecraftNameWrapper.INSTANT_EFFECT, 13, 0.35D);
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onMove(@Nonnull PlayerMoveEvent event) {
//       if (event.getPlayer().getUniqueId().equals(this.currentPlayer)) {
//          if (this.isInExtraWorld()) {
//             if (this.targetBlock != null) {
//                if (event.getTo() != null) {
//                   if (BlockUtils.isSameBlockLocation(event.getTo(), this.targetBlock.getLocation().add(0.0D, 1.0D, 0.0D))) {
//                      if (++this.currentJump >= this.jumps) {
//                         this.finishJumpAndRun();
//                      } else {
//                         SoundSample.PLOP.broadcast();
//                         this.buildNextJump();
//                      }
//                   } else if (event.getTo().getBlockY() < this.targetBlock.getY() - 2) {
//                      this.exitJumpAndRun();
//                      ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_FAILED);
//                   }
//
//                }
//             }
//          }
//       }
//    }
// }
//
