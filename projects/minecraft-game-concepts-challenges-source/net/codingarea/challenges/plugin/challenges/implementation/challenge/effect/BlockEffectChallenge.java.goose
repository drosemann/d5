// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/BlockEffectChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/BlockEffectChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/BlockEffectChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.effect;
//
// import java.util.HashMap;
// import java.util.Map;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.collection.IRandom;
// import net.anweisen.utilities.common.collection.SeededRandomWrapper;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
// import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
// import net.codingarea.challenges.plugin.spigot.events.PlayerIgnoreStatusChangeEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World.Environment;
// import org.bukkit.block.Block;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
// import org.bukkit.event.player.PlayerTeleportEvent;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.2")
// public class BlockEffectChallenge extends Setting {
//    private Map currentPotionEffects = new HashMap();
//
//    public BlockEffectChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.EFFECT);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.CARVED_PUMPKIN, Message.forName("item-block-effect-challenge"));
//    }
//
//    protected void onEnable() {
//       this.currentPotionEffects = new HashMap();
//       if (this.shouldExecuteEffect()) {
//          broadcastFiltered((player) -> {
//             this.addEffect(player, player.getLocation(), (Block)null);
//          });
//       }
//    }
//
//    @TimerTask(
//       status = {TimerStatus.RUNNING}
//    )
//    public void onStart() {
//       broadcastFiltered((player) -> {
//          this.addEffect(player, player.getLocation(), (Block)null);
//       });
//    }
//
//    protected void onDisable() {
//       broadcastFiltered((player) -> {
//          this.removeEffect(player, player.getLocation(), (Block)null);
//       });
//       this.currentPotionEffects = null;
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onLeave(PlayerQuitEvent event) {
//       if (this.shouldExecuteEffect()) {
//          this.currentPotionEffects.remove(event.getPlayer().getUniqueId());
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onGameModeChange(PlayerIgnoreStatusChangeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.isIgnored()) {
//             this.removeEffect(event.getPlayer(), event.getPlayer().getLocation(), (Block)null);
//          } else {
//             this.addEffect(event.getPlayer(), event.getPlayer().getLocation(), (Block)null);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onMove(PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getTo() != null) {
//                Block fromBlock = BlockUtils.getBlockBelow(event.getFrom());
//                Block toBlock = BlockUtils.getBlockBelow(event.getTo());
//                if (toBlock == null || fromBlock == null || toBlock.getType() != fromBlock.getType()) {
//                   this.removeEffect(event.getPlayer(), event.getFrom(), fromBlock);
//                   this.addEffect(event.getPlayer(), event.getTo(), toBlock);
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onTeleport(PlayerTeleportEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getTo() != null) {
//                Block fromBlock = BlockUtils.getBlockBelow(event.getFrom());
//                Block toBlock = BlockUtils.getBlockBelow(event.getTo());
//                if (toBlock == null || fromBlock == null || toBlock.getType() != fromBlock.getType()) {
//                   this.removeEffect(event.getPlayer(), event.getFrom(), fromBlock);
//                   this.addEffect(event.getPlayer(), event.getTo(), toBlock);
//                }
//             }
//          }
//       }
//    }
//
//    @ScheduledTask(
//       ticks = 20,
//       async = false
//    )
//    public void onSecond() {
//       broadcastFiltered((player) -> {
//          this.addEffect(player, player.getLocation(), (Block)null);
//       });
//    }
//
//    public void removeEffect(Player player, Location location, Block blockBelow) {
//       if (blockBelow == null) {
//          blockBelow = BlockUtils.getBlockBelow(location, -1.0D);
//       }
//
//       if (blockBelow != null) {
//          PotionEffectType type = this.getEffect(blockBelow.getType()).getType();
//          player.removePotionEffect(type);
//          this.removeEffectInCache(player);
//       }
//    }
//
//    public void addEffect(Player player, Location location, Block blockBelow) {
//       if (blockBelow == null) {
//          blockBelow = BlockUtils.getBlockBelow(location, -1.0D);
//       }
//
//       if (blockBelow != null) {
//          PotionEffect effect = this.getEffect(blockBelow.getType());
//          PotionEffect currentEffect = (PotionEffect)this.currentPotionEffects.get(player.getUniqueId());
//          if (currentEffect != null && !currentEffect.equals(effect)) {
//             player.removePotionEffect(currentEffect.getType());
//          } else if (player.hasPotionEffect(effect.getType())) {
//             return;
//          }
//
//          player.addPotionEffect(effect);
//          this.currentPotionEffects.put(player.getUniqueId(), effect);
//       }
//    }
//
//    public void removeEffectInCache(Player player) {
//       PotionEffect currentEffect = (PotionEffect)this.currentPotionEffects.get(player.getUniqueId());
//       if (currentEffect != null) {
//          player.removePotionEffect(currentEffect.getType());
//       }
//
//    }
//
//    private PotionEffect getEffect(Material material) {
//       long seed = ChallengeAPI.getGameWorld(Environment.NORMAL).getSeed();
//       IRandom random = new SeededRandomWrapper(seed / (long)material.ordinal());
//       PotionEffectType[] types = PotionEffectType.values();
//       PotionEffectType type = types[random.nextInt(types.length)];
//       return type.createEffect(Integer.MAX_VALUE, random.nextInt(type.isInstant() ? 1 : 4));
//    }
// }
//
