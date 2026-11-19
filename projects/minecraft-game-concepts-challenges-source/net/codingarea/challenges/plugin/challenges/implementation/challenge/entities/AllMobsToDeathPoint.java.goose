// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/AllMobsToDeathPoint.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/AllMobsToDeathPoint.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/AllMobsToDeathPoint.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import java.util.Collection;
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.spigot.events.EntityDeathByPlayerEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.entity.EnderDragon;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
//
// @Since("2.0")
// public class AllMobsToDeathPoint extends Setting {
//    public AllMobsToDeathPoint() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    @EventHandler
//    public void onEntityDeath(@Nonnull EntityDeathByPlayerEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!(event.getEntity() instanceof EnderDragon) && !(event.getEntity() instanceof Player)) {
//             if (event.getEntity() instanceof LivingEntity) {
//                if (!ignorePlayer(event.getKiller())) {
//                   this.teleportAllMobsOfType(event.getEntityType(), event.getEntity().getLocation());
//                }
//             }
//          }
//       }
//    }
//
//    private void teleportAllMobsOfType(@Nonnull EntityType entityType, @Nonnull Location location) {
//       if (location.getWorld() != null) {
//          Collection entities = location.getWorld().getEntitiesByClasses(new Class[]{entityType.getEntityClass()});
//          Iterator var4 = entities.iterator();
//
//          while(var4.hasNext()) {
//             Entity entity = (Entity)var4.next();
//             if (!(entity instanceof LivingEntity)) {
//                return;
//             }
//
//             ((LivingEntity)entity).setNoDamageTicks(20);
//             entity.teleport(location);
//          }
//
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.SPAWNER, Message.forName("item-all-mobs-to-death-position-challenge"));
//    }
// }
//
