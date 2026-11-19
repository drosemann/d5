package apocalypse.items;

import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.entity.Player;
import java.util.List;
import java.util.ArrayList;
import org.bukkit.ChatColor;

public abstract class CustomItem {
    protected final ItemStack item;
    protected final String name;
    protected final List<String> lore;

    public CustomItem(ItemStack item, String name, List<String> lore) {
        this.item = item;
        this.name = ChatColor.RESET + name;
        this.lore = new ArrayList<>();
        for (String line : lore) {
            this.lore.add(ChatColor.GRAY + line);
        }
        setupItem();
    }

    private void setupItem() {
        ItemMeta meta = item.getItemMeta();
        if (meta != null) {
            meta.setDisplayName(name);
            meta.setLore(lore);
            item.setItemMeta(meta);
        }
    }

    public ItemStack getItemStack() {
        return item.clone();
    }

    public String getName() {
        return name;
    }

    public boolean matches(ItemStack item) {
        if (item == null || !item.hasItemMeta()) return false;
        ItemMeta meta = item.getItemMeta();
        return meta != null && name.equals(meta.getDisplayName());
    }

    public abstract void onUse(Player player);
}