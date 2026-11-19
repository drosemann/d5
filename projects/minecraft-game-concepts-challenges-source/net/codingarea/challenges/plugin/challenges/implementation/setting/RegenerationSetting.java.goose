// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RegenerationSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RegenerationSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/RegenerationSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Modifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Color;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityRegainHealthEvent;
// import org.bukkit.event.entity.EntityRegainHealthEvent.RegainReason;
//
// public class RegenerationSetting extends Modifier {
//    public RegenerationSetting() {
//       super(MenuType.SETTINGS, 1, 3, 2);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return (new ItemBuilder.PotionBuilder(Material.POTION, Message.forName("item-regeneration-setting"))).color(Color.RED);
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       if (this.getValue() == 1) {
//          return DefaultItem.disabled();
//       } else {
//          return this.getValue() == 2 ? DefaultItem.enabled() : DefaultItem.create(Material.ORANGE_DYE, Message.forName("item-regeneration-setting-not_natural"));
//       }
//    }
//
//    public void playValueChangeTitle() {
//       if (this.getValue() == 1) {
//          ChallengeHelper.playToggleChallengeTitle(this, false);
//       } else {
//          ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() == 2 ? Message.forName("enabled") : Message.forName("item-regeneration-setting-not_natural")));
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onEntityRegainHealth(EntityRegainHealthEvent event) {
//       if (event.getEntity() instanceof Player) {
//          if (this.getValue() == 1) {
//             event.setAmount(0.0D);
//             event.setCancelled(true);
//          } else {
//             if (this.getValue() == 3 && (event.getRegainReason() == RegainReason.SATIATED || event.getRegainReason() == RegainReason.REGEN)) {
//                event.setAmount(0.0D);
//                event.setCancelled(true);
//             }
//
//          }
//       }
//    }
// }
//
