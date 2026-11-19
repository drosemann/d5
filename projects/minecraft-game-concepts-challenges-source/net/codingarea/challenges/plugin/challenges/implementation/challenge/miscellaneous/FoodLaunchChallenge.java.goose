// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodLaunchChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodLaunchChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodLaunchChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.EntityUtils;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerItemConsumeEvent;
// import org.bukkit.util.Vector;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.0.2")
// public class FoodLaunchChallenge extends SettingModifier {
//    public FoodLaunchChallenge() {
//       super(MenuType.CHALLENGES, 1, 10, 2);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.CAKE, Message.forName("item-consume-launch-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-launcher-description").asArray(this.getValue());
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("subtitle-launcher-description").asString(this.getValue()));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerItemConsume(@Nonnull PlayerItemConsumeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             Vector velocityToAdd = new Vector(0, this.getValue() / 2, 0);
//             Vector newVelocity = EntityUtils.getSucceedingVelocity(event.getPlayer().getVelocity()).add(velocityToAdd);
//             event.getPlayer().setVelocity(newVelocity);
//          }
//       }
//    }
// }
//
