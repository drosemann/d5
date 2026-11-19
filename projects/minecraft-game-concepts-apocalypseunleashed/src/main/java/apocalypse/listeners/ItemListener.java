package apocalypse.listeners;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.inventory.ItemStack;
import apocalypse.ApocalypsePlugin;
import apocalypse.items.CustomItem;

public class ItemListener implements Listener {
    private final ApocalypsePlugin plugin;

    public ItemListener(ApocalypsePlugin plugin) {
        this.plugin = plugin;
    }
    
    @EventHandler
    public void onPlayerInteract(PlayerInteractEvent event) {
        ItemStack item = event.getItem();
        if (item == null) return;

        if (plugin.getItemManager().isCustomItem(item)) {
            event.setCancelled(true);
            CustomItem customItem = plugin.getItemManager().getItem(item.getItemMeta().getDisplayName());
            if (customItem != null) {
                customItem.onUse(event.getPlayer());
            }
        }
    }
}