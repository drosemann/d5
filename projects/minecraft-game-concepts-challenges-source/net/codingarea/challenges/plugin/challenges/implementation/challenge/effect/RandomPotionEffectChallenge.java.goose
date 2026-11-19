// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/RandomPotionEffectChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/RandomPotionEffectChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/RandomPotionEffectChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.effect;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.List;
// import java.util.Random;
// import java.util.stream.Collectors;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.collection.IRandom;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// @Since("2.0")
// public class RandomPotionEffectChallenge extends MenuSetting {
//    private final Random random = new Random();
//    int currentTime = 0;
//
//    public RandomPotionEffectChallenge() {
//       super(MenuType.CHALLENGES, Message.forName("menu-random-effect-challenge-settings"));
//       this.setCategory(SettingCategory.EFFECT);
//       this.registerSetting("time", new MenuSetting.NumberSubSetting(() -> {
//          return new ItemBuilder(Material.CLOCK, Message.forName("item-random-effect-time-challenge"));
//       }, (value) -> {
//          return null;
//       }, (value) -> {
//          return "§e" + value + " §7" + Message.forName(value == 1 ? "second" : "seconds").asString();
//       }, 1, 60, 30));
//       this.registerSetting("length", new MenuSetting.NumberSubSetting(() -> {
//          return new ItemBuilder(Material.ARROW, Message.forName("item-random-effect-length-challenge"));
//       }, (value) -> {
//          return null;
//       }, (value) -> {
//          return "§e" + value + " §7" + Message.forName(value == 1 ? "second" : "seconds").asString();
//       }, 1, 20, 10));
//       this.registerSetting("amplifier", new MenuSetting.NumberSubSetting(() -> {
//          return new ItemBuilder(Material.STONE_SWORD, Message.forName("item-random-effect-amplifier-challenge"));
//       }, (value) -> {
//          return null;
//       }, (value) -> {
//          return "§7" + Message.forName("amplifier") + " §e" + value;
//       }, 1, 8, 3));
//    }
//
//    @Nullable
//    public static PotionEffectType getNewRandomEffect(@Nonnull LivingEntity entity) {
//       List activeEffects = (List)entity.getActivePotionEffects().stream().map(PotionEffect::getType).collect(Collectors.toList());
//       ArrayList possibleEffects = new ArrayList(Arrays.asList(PotionEffectType.values()));
//       possibleEffects.removeAll(activeEffects);
//       possibleEffects.remove(MinecraftNameWrapper.INSTANT_HEALTH);
//       possibleEffects.remove(MinecraftNameWrapper.INSTANT_DAMAGE);
//       return (PotionEffectType)possibleEffects.get(IRandom.threadLocal().nextInt(possibleEffects.size()));
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BREWING_STAND, Message.forName("item-random-effect-challenge"));
//    }
//
//    @ScheduledTask(
//       ticks = 20,
//       async = false
//    )
//    public void onSecond() {
//       ++this.currentTime;
//       if (this.currentTime > this.getSetting("time").getAsInt()) {
//          this.currentTime = 0;
//          this.applyRandomEffect();
//       }
//
//    }
//
//    private void applyRandomEffect() {
//       Bukkit.getOnlinePlayers().forEach(this::applyRandomEffect);
//    }
//
//    private void applyRandomEffect(@Nonnull Player entity) {
//       PotionEffectType effect = getNewRandomEffect(entity);
//       if (effect != null) {
//          this.applyEffect(entity, effect);
//       }
//    }
//
//    private void applyEffect(@Nonnull Player player, @Nonnull PotionEffectType effectType) {
//       PotionEffect potionEffect = new PotionEffect(effectType, (this.getSetting("length").getAsInt() + 1) * 20, this.getSetting("amplifier").getAsInt() - 1);
//       player.addPotionEffect(potionEffect);
//    }
// }
//
