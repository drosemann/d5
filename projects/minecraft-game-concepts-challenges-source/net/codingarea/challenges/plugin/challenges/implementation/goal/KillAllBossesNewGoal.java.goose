// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillAllBossesNewGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillAllBossesNewGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/KillAllBossesNewGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import java.util.Arrays;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.KillMobsGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.challenges.annotations.RequireVersion;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.EntityType;
//
// @Since("2.2.0")
// @RequireVersion(MinecraftVersion.V1_19)
// public class KillAllBossesNewGoal extends KillMobsGoal {
//    public KillAllBossesNewGoal() {
//       super(Arrays.asList(EntityType.ENDER_DRAGON, EntityType.WITHER, EntityType.ELDER_GUARDIAN, EntityType.WARDEN));
//       this.setCategory(SettingCategory.KILL_ENTITY);
//    }
//
//    public Message getBossbarMessage() {
//       return Message.forName("bossbar-kill-all-bosses");
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.NETHERITE_SWORD, Message.forName("item-all-bosses-new-goal"));
//    }
// }
//
