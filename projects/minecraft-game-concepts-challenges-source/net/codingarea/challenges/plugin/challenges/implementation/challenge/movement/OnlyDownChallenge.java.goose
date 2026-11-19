// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/OnlyDownChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/OnlyDownChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/movement/OnlyDownChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// @Since("2.0")
// public class OnlyDownChallenge extends Setting {
//    public OnlyDownChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.MOVEMENT);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ACACIA_SLAB, Message.forName("item-only-down-challenge"));
//    }
//
//    @EventHandler
//    public void onPlayerMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getTo() != null) {
//                if (event.getTo().getBlockY() > event.getFrom().getBlockY()) {
//                   Message.forName("only-down-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()));
//                   ChallengeHelper.kill(event.getPlayer());
//                }
//             }
//          }
//       }
//    }
// }
//
