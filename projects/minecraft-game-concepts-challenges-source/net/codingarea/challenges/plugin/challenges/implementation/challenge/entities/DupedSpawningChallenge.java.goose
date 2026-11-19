// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/DupedSpawningChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/DupedSpawningChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/DupedSpawningChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.EnderDragon;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.entity.Slime;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntitySpawnEvent;
//
// public class DupedSpawningChallenge extends Setting {
//    private boolean inCustomSpawn = false;
//
//    public DupedSpawningChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ELDER_GUARDIAN_SPAWN_EGG, Message.forName("item-duped-spawning-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onSpawn(@Nonnull EntitySpawnEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getEntity() instanceof LivingEntity && !(event.getEntity() instanceof Player) && !(event.getEntity() instanceof EnderDragon)) {
//             if (!this.inCustomSpawn) {
//                this.inCustomSpawn = true;
//                Entity entity = event.getEntity().getWorld().spawnEntity(event.getLocation(), event.getEntityType());
//                if (entity instanceof Slime && event.getEntity() instanceof Slime) {
//                   ((Slime)entity).setSize(((Slime)event.getEntity()).getSize());
//                }
//
//                this.inCustomSpawn = false;
//             }
//          }
//       }
//    }
// }
//
