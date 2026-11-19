// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoItemDamageSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoItemDamageSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoItemDamageSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.player.PlayerItemDamageEvent;
//
// public class NoItemDamageSetting extends Setting {
//    public NoItemDamageSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @EventHandler
//    public void onItemDamage(PlayerItemDamageEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             event.setCancelled(true);
//             event.getPlayer().updateInventory();
//          }
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ANVIL, Message.forName("item-no-item-damage-setting"));
//    }
// }
//
