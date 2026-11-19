package com.questsystem.plugin;

import org.bukkit.inventory.ItemStack;

import java.util.List;

public class Reward {
    private final int xp;
    private final List<ItemStack> items;

    public Reward(int xp, List<ItemStack> items) {
        this.xp = xp;
        this.items = items;
    }

    public int getXp() {
        return xp;
    }

    public List<ItemStack> getItems() {
        return items;
    }
}