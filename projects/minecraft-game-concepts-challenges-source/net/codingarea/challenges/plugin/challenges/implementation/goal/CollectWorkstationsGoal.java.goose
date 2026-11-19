// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/CollectWorkstationsGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/CollectWorkstationsGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/CollectWorkstationsGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.ItemCollectionGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.challenges.annotations.RequireVersion;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.2")
// @RequireVersion(MinecraftVersion.V1_14)
// public class CollectWorkstationsGoal extends ItemCollectionGoal {
//    public CollectWorkstationsGoal() {
//       super(Material.LECTERN, Material.COMPOSTER, Material.GRINDSTONE, Material.BLAST_FURNACE, Material.SMOKER, Material.FLETCHING_TABLE, Material.CARTOGRAPHY_TABLE, Material.BREWING_STAND, Material.SMITHING_TABLE, Material.CAULDRON, Material.LOOM, Material.STONECUTTER, Material.BARREL);
//       this.setCategory(SettingCategory.FASTEST_TIME);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.FLETCHING_TABLE, Message.forName("item-collect-workstations-item"));
//    }
// }
//
