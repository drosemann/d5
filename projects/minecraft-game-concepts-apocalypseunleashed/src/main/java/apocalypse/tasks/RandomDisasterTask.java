package apocalypse.tasks;

import org.bukkit.scheduler.BukkitRunnable;
import apocalypse.ApocalypsePlugin;
import apocalypse.disasters.DisasterManager;

public class RandomDisasterTask extends BukkitRunnable {
    private final ApocalypsePlugin plugin;
    private final DisasterManager disasterManager;

    public RandomDisasterTask(ApocalypsePlugin plugin) {
        this.plugin = plugin;
        this.disasterManager = plugin.getDisasterManager();
    }

    @Override
    public void run() {
        // Get a random disaster type and start it
        String[] disasterTypes = {"meteor", "sinkhole", "tornado", "earthquake", "tsunami"};
        String randomDisaster = disasterTypes[(int) (Math.random() * disasterTypes.length)];
        
        // Check if a disaster is already running
        if (!disasterManager.hasActiveDisasters()) {
            disasterManager.startDisaster(randomDisaster);
            plugin.getLogger().info("Starting random disaster: " + randomDisaster);
        }
    }
}