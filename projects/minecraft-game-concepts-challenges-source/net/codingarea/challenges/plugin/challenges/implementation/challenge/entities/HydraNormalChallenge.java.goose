// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/HydraNormalChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/HydraNormalChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/HydraNormalChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.HydraChallenge;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.EntityType;
//
// public class HydraNormalChallenge extends HydraChallenge {
//    public HydraNormalChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.WITCH_SPAWN_EGG, Message.forName("item-hydra-challenge"));
//    }
//
//    public int getNewMobsCount(@Nonnull EntityType entityType) {
//       return 2;
//    }
// }
//
