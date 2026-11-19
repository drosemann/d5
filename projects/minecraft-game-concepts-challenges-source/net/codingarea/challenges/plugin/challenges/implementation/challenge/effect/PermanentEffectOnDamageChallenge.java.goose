// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/PermanentEffectOnDamageChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/PermanentEffectOnDamageChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/PermanentEffectOnDamageChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.effect;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Random;
// import java.util.UUID;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.collection.pair.Tuple;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
// import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import net.codingarea.challenges.plugin.utils.misc.TriConsumer;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
// import org.bukkit.event.entity.EntityDamageEvent.DamageModifier;
// import org.bukkit.event.player.PlayerGameModeChangeEvent;
// import org.bukkit.event.player.PlayerItemConsumeEvent;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// @Since("2.0")
// public class PermanentEffectOnDamageChallenge extends SettingModifier {
//    private static final int GLOBAL_EFFECT = 1;
//    private final Random random = new Random();
//
//    public PermanentEffectOnDamageChallenge() {
//       super(MenuType.CHALLENGES, 1, 2);
//       this.setCategory(SettingCategory.EFFECT);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.MAGMA_CREAM, Message.forName("item-permanent-effect-on-damage-challenge"));
//    }
//
//    protected void onEnable() {
//       if (!this.shouldExecuteEffect()) {
//          this.clearEffects();
//       } else {
//          this.updateEffects();
//       }
//    }
//
//    protected void onDisable() {
//       this.clearEffects();
//    }
//
//    @TimerTask(
//       status = {TimerStatus.RUNNING},
//       async = false
//    )
//    public void onTimerStart() {
//       if (this.isEnabled()) {
//          this.updateEffects();
//       }
//    }
//
//    @TimerTask(
//       status = {TimerStatus.PAUSED},
//       async = false
//    )
//    public void onTimerPause() {
//       if (this.isEnabled()) {
//          this.clearEffects();
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onConsume(@Nonnull PlayerItemConsumeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getItem().getType() == Material.MILK_BUCKET) {
//                Bukkit.getScheduler().runTask(plugin, this::updateEffects);
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onPlayerJoin(@Nonnull PlayerJoinEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.updateEffects();
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onPlayerItemConsume(@Nonnull PlayerItemConsumeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.updateEffects();
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerGameModeChange(@Nonnull PlayerGameModeChangeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          Bukkit.getScheduler().runTask(plugin, () -> {
//             this.clearEffects();
//             this.updateEffects();
//          });
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerDamage(@Nonnull EntityDamageEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!(event.getFinalDamage() <= 0.0D) || !(event.getDamage(DamageModifier.ABSORPTION) >= 0.0D)) {
//             if (event.getEntity() instanceof Player) {
//                Player player = (Player)event.getEntity();
//                if (!ignorePlayer(player)) {
//                   DamageCause cause = event.getCause();
//                   if (cause != DamageCause.POISON && cause != DamageCause.WITHER) {
//                      this.addRandomEffect(player);
//                      this.updateEffects();
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    public void addRandomEffect(@Nonnull Player eventPlayer) {
//       PotionEffectType randomEffect = this.getNewRandomEffect();
//       if (randomEffect != null) {
//          this.applyNewEffect(eventPlayer, randomEffect);
//       }
//    }
//
//    private void applyNewEffect(@Nonnull Player player, @Nonnull PotionEffectType potionEffectType) {
//       String path = player.getUniqueId().toString();
//       Document effects = this.getGameStateData().getDocument(path);
//       int amplifier = 1;
//       if (!effects.contains(potionEffectType.getName())) {
//          effects.set(potionEffectType.getName(), 1);
//       } else {
//          amplifier = effects.getInt(potionEffectType.getName()) + 1;
//          effects.set(potionEffectType.getName(), amplifier);
//       }
//
//       if (this.effectsToEveryone()) {
//          Message.forName("new-effect").broadcast(Prefix.CHALLENGES, potionEffectType, amplifier);
//       } else {
//          Message.forName("new-effect").send(player, Prefix.CHALLENGES, potionEffectType, amplifier);
//       }
//
//       this.getGameStateData().set(path, effects);
//    }
//
//    @Nullable
//    private PotionEffectType getNewRandomEffect() {
//       ArrayList possibleEffects = new ArrayList(Arrays.asList(PotionEffectType.values()));
//       possibleEffects.remove(MinecraftNameWrapper.INSTANT_HEALTH);
//       possibleEffects.remove(MinecraftNameWrapper.INSTANT_DAMAGE);
//       return (PotionEffectType)possibleEffects.get(this.random.nextInt(possibleEffects.size()));
//    }
//
//    public void updateEffects() {
//       this.forEachEffect((player, effectType, amplifier) -> {
//          if (this.effectsToEveryone()) {
//             broadcastFiltered((currentPlayer) -> {
//                this.addEffect(currentPlayer, effectType, amplifier);
//             });
//          } else if (!ignorePlayer(player)) {
//             this.addEffect(player, effectType, amplifier);
//          }
//
//       });
//    }
//
//    private void addEffect(@Nonnull Player player, @Nonnull PotionEffectType effectType, int amplifier) {
//       if (player.hasPotionEffect(effectType)) {
//          PotionEffect effect = player.getPotionEffect(effectType);
//          if (effect != null && effect.getAmplifier() == amplifier - 1) {
//             return;
//          }
//       }
//
//       player.removePotionEffect(effectType);
//       player.addPotionEffect(new PotionEffect(effectType, Integer.MAX_VALUE, amplifier - 1));
//    }
//
//    private void clearEffects() {
//       this.forEachEffect((player, potionEffectType, amplifier) -> {
//          broadcast((currentPlayer) -> {
//             currentPlayer.removePotionEffect(potionEffectType);
//          });
//       });
//    }
//
//    private void forEachEffect(@Nonnull TriConsumer action) {
//       List effects = new ArrayList();
//       Iterator var3 = this.getGameStateData().keys().iterator();
//
//       while(var3.hasNext()) {
//          String uuid = (String)var3.next();
//          Document effectsDocument = this.getGameStateData().getDocument(uuid);
//          Iterator var6 = effectsDocument.keys().iterator();
//
//          while(var6.hasNext()) {
//             String effectName = (String)var6.next();
//             PotionEffectType effectType = PotionEffectType.getByName(effectName);
//             int amplifier = effectsDocument.getInt(effectName);
//             if (effectType != null) {
//                if (this.effectsToEveryone()) {
//                   this.addEffectToList(effects, effectType, amplifier);
//                } else {
//                   try {
//                      Player player = Bukkit.getPlayer(UUID.fromString(uuid));
//                      action.accept(player, effectType, amplifier);
//                   } catch (Exception var11) {
//                      Logger.debug("UUID formation for uuid '" + uuid + "' failed in permanent effect challenge!");
//                   }
//                }
//             }
//          }
//       }
//
//       effects.forEach((tuple) -> {
//          broadcastFiltered((player) -> {
//             action.accept(player, (PotionEffectType)tuple.getFirst(), (Integer)tuple.getSecond());
//          });
//       });
//    }
//
//    private void addEffectToList(@Nonnull List effectsList, @Nonnull PotionEffectType effectType, int amplifier) {
//       Tuple effectTuple = (Tuple)effectsList.stream().filter((tuple) -> {
//          return tuple.getFirst() == effectType;
//       }).findFirst().orElse(new Tuple(effectType, 0));
//       effectTuple.setSecond((Integer)effectTuple.getSecond() + amplifier);
//       if (!effectsList.contains(effectTuple)) {
//          effectsList.add(effectTuple);
//       }
//
//    }
//
//    private boolean effectsToEveryone() {
//       return 1 == this.getValue();
//    }
//
//    protected void onValueChange() {
//       if (this.shouldExecuteEffect()) {
//          this.clearEffects();
//          this.updateEffects();
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       if (!this.isEnabled()) {
//          return DefaultItem.disabled();
//       } else {
//          return this.getValue() == 1 ? DefaultItem.create(Material.ENDER_CHEST, Message.forName("everyone").asString()).appendLore("", Message.forName("item-permanent-effect-target-everyone-description").asString()) : DefaultItem.create(Material.CHEST, Message.forName("player").asString()).appendLore("", Message.forName("item-permanent-effect-target-player-description").asString());
//       }
//    }
//
//    public void playValueChangeTitle() {
//       if (1 == this.getValue()) {
//          ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("everyone").asString());
//       } else {
//          ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("player").asString());
//       }
//
//    }
//
//    public void loadGameState(@Nonnull Document document) {
//       super.loadGameState(document);
//       broadcast((player) -> {
//          Iterator var1 = player.getActivePotionEffects().iterator();
//
//          while(var1.hasNext()) {
//             PotionEffect potionEffect = (PotionEffect)var1.next();
//             player.removePotionEffect(potionEffect.getType());
//          }
//
//       });
//       if (this.shouldExecuteEffect()) {
//          this.updateEffects();
//       }
//
//    }
// }
//
