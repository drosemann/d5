package com.hearthrift.rewards;

import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

public class PvPReward {
    
    public static void giveWinReward(Player player) {
        // Basis-Belohnung für einen PvP-Sieg
        ItemStack[] rewards = {
            new ItemStack(Material.GOLDEN_APPLE, 1),
            new ItemStack(Material.EXPERIENCE_BOTTLE, 2)
        };

        for (ItemStack reward : rewards) {
            if (player.getInventory().firstEmpty() != -1) {
                player.getInventory().addItem(reward);
            } else {
                player.getWorld().dropItemNaturally(player.getLocation(), reward);
            }
        }

        player.sendMessage("§a§lPvP-Sieg Belohnung erhalten!");
    }

    public static void giveStreakBonus(Player player, int streak) {
        // Bonus für Siegesserien
        int diamonds = Math.min(streak / 5, 5); // Max 5 Diamanten
        ItemStack[] rewards = {
            new ItemStack(Material.DIAMOND, diamonds),
            new ItemStack(Material.GOLDEN_APPLE, 2),
            new ItemStack(Material.EXPERIENCE_BOTTLE, streak)
        };

        for (ItemStack reward : rewards) {
            if (player.getInventory().firstEmpty() != -1) {
                player.getInventory().addItem(reward);
            } else {
                player.getWorld().dropItemNaturally(player.getLocation(), reward);
            }
        }

        player.sendMessage("§6§l" + streak + " Siege in Folge! Bonus erhalten!");
    }

    public static void giveRiftBonus(Player player) {
        // Spezielle Belohnung für Siege im RIFT
        ItemStack[] rewards = {
            new ItemStack(Material.NETHERITE_SCRAP, 1),
            new ItemStack(Material.ENCHANTED_GOLDEN_APPLE, 1)
        };

        for (ItemStack reward : rewards) {
            if (player.getInventory().firstEmpty() != -1) {
                player.getInventory().addItem(reward);
            } else {
                player.getWorld().dropItemNaturally(player.getLocation(), reward);
            }
        }

        player.sendMessage("§5§lRIFT-PvP Bonus erhalten!");
    }
}