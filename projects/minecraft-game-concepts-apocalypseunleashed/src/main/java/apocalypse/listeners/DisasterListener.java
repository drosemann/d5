package apocalypse.listeners;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageEvent;
import apocalypse.ApocalypsePlugin;

public class DisasterListener implements Listener {
    private final ApocalypsePlugin plugin;

    public DisasterListener(ApocalypsePlugin plugin) {
        this.plugin = plugin;
    }

    @EventHandler
    public void onEntityDamage(EntityDamageEvent event) {
        // Handle disaster-related damage here
        plugin.getLogger().info("Entity damaged: " + event.getEntity().getType() + " for " + event.getDamage() + " damage.");
        // Additional logic can be added to modify damage based on active disasters
        if (plugin.getDisasterManager().hasActiveDisasters()) {
            // Example: Increase damage during disasters
            double modifiedDamage = event.getDamage() * 1.5;
            event.setDamage(modifiedDamage);
            plugin.getLogger().info("Damage increased to: " + modifiedDamage + " due to active disasters.");
        }
    }
}