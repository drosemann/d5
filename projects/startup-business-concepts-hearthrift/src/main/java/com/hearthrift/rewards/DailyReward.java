package com.hearthrift.rewards;

import com.hearthrift.Hearthrift;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import java.util.Random;

public class DailyReward {
    private final Hearthrift plugin;
    private final Random random;

    public DailyReward(Hearthrift plugin) {
        this.plugin = plugin;
        this.random = new Random();
    }

    public void giveReward(Player player) {
        // Basis tägliche Belohnung
        ItemStack[] rewards = {
            new ItemStack(Material.IRON_INGOT, 5),
            new ItemStack(Material.COOKED_BEEF, 16),
            new ItemStack(Material.EXPERIENCE_BOTTLE, 3)
        };

        for (ItemStack reward : rewards) {
            if (player.getInventory().firstEmpty() != -1) {
                player.getInventory().addItem(reward);
            } else {
                player.getWorld().dropItemNaturally(player.getLocation(), reward);
            }
        }

        player.sendMessage("§a§lTägliche Belohnung erhalten!");
    }

    public void giveWeeklyBonus(Player player) {
        // Bonus für 7-Tage-Streak
        ItemStack[] bonusRewards = {
            new ItemStack(Material.DIAMOND, 3),
            new ItemStack(Material.GOLDEN_APPLE, 2),
            new ItemStack(Material.EMERALD, 5)
        };

        for (ItemStack reward : bonusRewards) {
            if (player.getInventory().firstEmpty() != -1) {
                player.getInventory().addItem(reward);
            } else {
                player.getWorld().dropItemNaturally(player.getLocation(), reward);
            }
        }

        player.sendMessage("§6§l7-Tage-Bonus erhalten! Danke für deine Treue!");
    }
}