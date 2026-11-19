// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillEnderDragonGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillEnderDragonGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillEnderDragonGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.KillEntityGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.World.Environment;
// import org.bukkit.entity.EntityType;
//
// public class KillEnderDragonGoal extends KillEntityGoal {
//    public KillEnderDragonGoal() {
//       super(EntityType.ENDER_DRAGON, Environment.THE_END, true);
//       this.setCategory(SettingCategory.KILL_ENTITY);
//       this.setOneWinner(false);
//    }
//
//    @Nullable
//    public SoundSample getWinSound() {
//       return null;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.DRAGON_EGG, Message.forName("item-dragon-goal"));
//    }
// }
//
