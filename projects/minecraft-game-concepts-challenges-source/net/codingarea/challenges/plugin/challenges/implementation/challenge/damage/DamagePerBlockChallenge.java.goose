// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/DamagePerBlockChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/DamagePerBlockChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/damage/DamagePerBlockChallenge.java), unveraendert, als Inline-Doku ----
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
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import org.bukkit.Color;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class DamagePerBlockChallenge extends SettingModifier {
//    public DamagePerBlockChallenge() {
//       super(MenuType.CHALLENGES, 1, 40);
//       this.setCategory(SettingCategory.DAMAGE);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (!BlockUtils.isSameBlockLocationIgnoreHeight(event.getTo(), event.getFrom())) {
//                event.getPlayer().setNoDamageTicks(0);
//                event.getPlayer().damage((double)this.getValue());
//             }
//          }
//       }
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return (new ItemBuilder.LeatherArmorBuilder(Material.LEATHER_BOOTS, Message.forName("item-damage-block-challenge"))).setColor(Color.RED);
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
//    }
// }
//
