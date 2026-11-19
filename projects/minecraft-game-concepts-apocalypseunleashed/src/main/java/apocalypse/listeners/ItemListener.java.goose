// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/listeners/ItemListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/listeners/ItemListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/listeners/ItemListener.java), unveraendert, als Inline-Doku ----
// package apocalypse.listeners;
//
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.inventory.ItemStack;
// import apocalypse.ApocalypsePlugin;
// import apocalypse.items.CustomItem;
//
// public class ItemListener implements Listener {
//     private final ApocalypsePlugin plugin;
//
//     public ItemListener(ApocalypsePlugin plugin) {
//         this.plugin = plugin;
//     }
//     
//     @EventHandler
//     public void onPlayerInteract(PlayerInteractEvent event) {
//         ItemStack item = event.getItem();
//         if (item == null) return;
//
//         if (plugin.getItemManager().isCustomItem(item)) {
//             event.setCancelled(true);
//             CustomItem customItem = plugin.getItemManager().getItem(item.getItemMeta().getDisplayName());
//             if (customItem != null) {
//                 customItem.onUse(event.getPlayer());
//             }
//         }
//     }
// }
