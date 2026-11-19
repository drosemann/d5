// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/EntityRandomEffectChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/EntityRandomEffectChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/effect/EntityRandomEffectChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.effect;
//
// import java.util.Iterator;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntitySpawnEvent;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.2")
// public class EntityRandomEffectChallenge extends Setting {
//    public EntityRandomEffectChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.EFFECT);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.PHANTOM_MEMBRANE, Message.forName("item-entity-effect-challenge"));
//    }
//
//    protected void onEnable() {
//       Iterator var1 = ChallengeAPI.getGameWorlds().iterator();
//
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          Iterator var3 = world.getLivingEntities().iterator();
//
//          while(var3.hasNext()) {
//             LivingEntity entity = (LivingEntity)var3.next();
//             this.addRandomEffect(entity);
//          }
//       }
//
//    }
//
//    protected void onDisable() {
//       Iterator var1 = ChallengeAPI.getGameWorlds().iterator();
//
//       label32:
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          Iterator var3 = world.getLivingEntities().iterator();
//
//          while(true) {
//             LivingEntity entity;
//             do {
//                if (!var3.hasNext()) {
//                   continue label32;
//                }
//
//                entity = (LivingEntity)var3.next();
//             } while(entity.getType() == EntityType.PLAYER);
//
//             Iterator var5 = entity.getActivePotionEffects().iterator();
//
//             while(var5.hasNext()) {
//                PotionEffect effect = (PotionEffect)var5.next();
//                entity.removePotionEffect(effect.getType());
//             }
//          }
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onSpawn(EntitySpawnEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getEntity() instanceof LivingEntity) {
//             this.addRandomEffect((LivingEntity)event.getEntity());
//          }
//       }
//    }
//
//    public void addRandomEffect(LivingEntity entity) {
//       if (entity.getType() != EntityType.PLAYER) {
//          PotionEffectType[] types = PotionEffectType.values();
//          PotionEffectType type = (PotionEffectType)globalRandom.choose((Object[])types);
//          entity.addPotionEffect(type.createEffect(Integer.MAX_VALUE, 255));
//       }
//    }
// }
//
