package de.example.lobby.rewards;

import de.example.lobby.LobbyPlugin;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class DailyRewardsManager {
    private final LobbyPlugin plugin;
    private final Map<UUID, Long> lastRewardTimes = new HashMap<>();

    public DailyRewardsManager(LobbyPlugin plugin) {
        this.plugin = plugin;
    }

    public void claimDailyReward(Player player) {
        UUID playerId = player.getUniqueId();
        long currentTime = System.currentTimeMillis();
        long lastRewardTime = lastRewardTimes.getOrDefault(playerId, 0L);

        if (currentTime - lastRewardTime >= 24 * 60 * 60 * 1000) { // 24 hours
            // Give reward
            player.getInventory().addItem(new ItemStack(Material.DIAMOND, 1));
            player.sendMessage("You've claimed your daily reward!");
            lastRewardTimes.put(playerId, currentTime);
        } else {
            player.sendMessage("You've already claimed your daily reward. Come back tomorrow!");
        }
    }
} 