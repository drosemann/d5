// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/AdvancementDamageChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/AdvancementDamageChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/AdvancementDamageChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerAdvancementDoneEvent;
//
// public class AdvancementDamageChallenge extends SettingModifier {
//    public AdvancementDamageChallenge() {
//       super(MenuType.CHALLENGES, 1, 40);
//       this.setCategory(SettingCategory.DAMAGE);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BOOK, Message.forName("item-advancement-damage-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerAdvancementDone(@Nonnull PlayerAdvancementDoneEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (!event.getAdvancement().getKey().toString().contains(":recipes/")) {
//                event.getPlayer().setNoDamageTicks(0);
//                event.getPlayer().damage((double)this.getValue());
//             }
//          }
//       }
//    }
// }
//
