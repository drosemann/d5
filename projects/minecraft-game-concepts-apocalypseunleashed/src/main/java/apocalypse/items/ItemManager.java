package apocalypse.items;

import org.bukkit.inventory.ItemStack;
import java.util.HashMap;
import java.util.Map;
import apocalypse.ApocalypsePlugin;

public class ItemManager {
    private final ApocalypsePlugin plugin;
    private final Map<String, CustomItem> items = new HashMap<>();

    public ItemManager(ApocalypsePlugin plugin) {
        this.plugin = plugin;
    }

    public void registerItems() {
        // Items will be registered here
        plugin.getLogger().info("Registering custom items...");
    }

    private void registerItem(CustomItem item) {
        items.put(item.getName().toLowerCase(), item);
    }

    public CustomItem getItem(String name) {
        return items.get(name.toLowerCase());
    }

    public ItemStack createItem(String name) {
        CustomItem item = getItem(name);
        return item != null ? item.getItemStack() : null;
    }

    public boolean isCustomItem(ItemStack item) {
        return items.values().stream()
                .anyMatch(customItem -> customItem.matches(item));
    }
}