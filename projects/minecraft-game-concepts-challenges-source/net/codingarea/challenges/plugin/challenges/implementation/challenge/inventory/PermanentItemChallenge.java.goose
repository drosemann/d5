// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/PermanentItemChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/PermanentItemChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/PermanentItemChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.misc.CompatibilityUtils;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.inventory.InventoryType;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.inventory.Inventory;
//
// @Since("2.0")
// public class PermanentItemChallenge extends Setting {
//    public PermanentItemChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.INVENTORY);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.VINE, Message.forName("item-permanent-item-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
//       Player player = event.getPlayer();
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(player)) {
//             Inventory clickedInventory = event.getClickedInventory();
//             if (event.getCursor() != null) {
//                if (clickedInventory != null) {
//                   InventoryType type = CompatibilityUtils.getTopInventory(player).getType();
//                   if (type != InventoryType.WORKBENCH && type != InventoryType.CRAFTING) {
//                      if (clickedInventory.getType() != InventoryType.CRAFTING) {
//                         if (clickedInventory.getType() == InventoryType.PLAYER && event.getInventory().getType() != InventoryType.PLAYER) {
//                            event.setCancelled(true);
//                         }
//
//                      }
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler
//    public void onPlayerDropItem(@Nonnull PlayerDropItemEvent event) {
//       if (this.shouldExecuteEffect()) {
//          event.setCancelled(true);
//       }
//    }
// }
//
