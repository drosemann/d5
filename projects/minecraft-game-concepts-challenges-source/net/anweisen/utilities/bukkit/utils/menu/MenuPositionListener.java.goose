// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/menu/MenuPositionListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/menu/MenuPositionListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/menu/MenuPositionListener.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.menu;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.misc.CompatibilityUtils;
// import org.bukkit.entity.HumanEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.inventory.InventoryClickEvent;
// import org.bukkit.inventory.Inventory;
//
// public final class MenuPositionListener implements Listener {
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onClick(@Nonnull InventoryClickEvent event) {
//       HumanEntity human = event.getWhoClicked();
//       if (human instanceof Player) {
//          Player player = (Player)human;
//          Inventory inventory = event.getClickedInventory();
//          if (inventory != null) {
//             if (inventory == CompatibilityUtils.getTopInventory(event)) {
//                if (inventory.getHolder() != MenuPosition.HOLDER) {
//                   return;
//                }
//
//                MenuPosition position = MenuPosition.get(player);
//                if (position == null) {
//                   return;
//                }
//
//                event.setCancelled(true);
//                position.handleClick(new MenuClickInfo(player, inventory, event.isShiftClick(), event.isRightClick(), event.getSlot()));
//             } else if (event.isShiftClick()) {
//                Inventory topInventory = event.getInventory();
//                if (topInventory.getHolder() != MenuPosition.HOLDER) {
//                   return;
//                }
//
//                event.setCancelled(true);
//             }
//
//          }
//       }
//    }
// }
//
