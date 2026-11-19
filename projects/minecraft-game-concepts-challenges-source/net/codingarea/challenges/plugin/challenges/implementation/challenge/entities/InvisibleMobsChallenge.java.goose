// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/InvisibleMobsChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/InvisibleMobsChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/InvisibleMobsChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
// import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Color;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntitySpawnEvent;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// @Since("2.0")
// public class InvisibleMobsChallenge extends Setting {
//    public InvisibleMobsChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    protected void onEnable() {
//       this.addEffectForEveryEntity();
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return (new ItemBuilder.PotionBuilder(Material.POTION, Message.forName("item-invisible-mobs-challenge"))).setColor(Color.WHITE);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onSpawn(@Nonnull EntitySpawnEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getEntity() instanceof LivingEntity) {
//             this.addEffect((LivingEntity)event.getEntity());
//          }
//       }
//    }
//
//    @ScheduledTask(
//       ticks = 20,
//       async = false,
//       timerPolicy = TimerPolicy.ALWAYS
//    )
//    public void playEffects() {
//       if (this.shouldExecuteEffect()) {
//          this.addEffectForEveryEntity();
//       }
//    }
//
//    private void addEffectForEveryEntity() {
//       Iterator var1 = ChallengeAPI.getGameWorlds().iterator();
//
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          Iterator var3 = world.getLivingEntities().iterator();
//
//          while(var3.hasNext()) {
//             LivingEntity entity = (LivingEntity)var3.next();
//             if (!(entity instanceof Player)) {
//                this.addEffect(entity);
//             }
//          }
//       }
//
//    }
//
//    private void addEffect(@Nonnull LivingEntity entity) {
//       entity.addPotionEffect(new PotionEffect(PotionEffectType.INVISIBILITY, 40, 1, true, false, false));
//    }
// }
//
