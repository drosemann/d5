// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillSnowGolemGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillSnowGolemGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillSnowGolemGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.KillEntityGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import org.bukkit.Material;
// import org.bukkit.Sound;
//
// @Since("2.0")
// public class KillSnowGolemGoal extends KillEntityGoal {
//    public KillSnowGolemGoal() {
//       super(MinecraftNameWrapper.SNOW_GOLEM);
//       this.setCategory(SettingCategory.KILL_ENTITY);
//       this.killerNeeded = true;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.SNOWBALL, Message.forName("item-snow-golem-goal"));
//    }
//
//    @Nonnull
//    public SoundSample getStartSound() {
//       return (new SoundSample()).addSound(Sound.ENTITY_SNOW_GOLEM_DEATH, 1.0F);
//    }
// }
//
