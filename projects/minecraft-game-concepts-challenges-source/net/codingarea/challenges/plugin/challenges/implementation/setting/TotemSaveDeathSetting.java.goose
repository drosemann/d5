// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TotemSaveDeathSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TotemSaveDeathSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TotemSaveDeathSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityResurrectEvent;
//
// @Since("2.0")
// public class TotemSaveDeathSetting extends Setting {
//    public TotemSaveDeathSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.TOTEM_OF_UNDYING, Message.forName("item-totem-save-setting"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onEntityResurrect(@Nonnull EntityResurrectEvent event) {
//       if (ChallengeHelper.isInInstantKill() && !this.isEnabled()) {
//          event.setCancelled(true);
//       }
//
//    }
// }
//
