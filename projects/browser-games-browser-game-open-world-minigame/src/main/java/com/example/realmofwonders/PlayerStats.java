package com.example.realmofwonders;

import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Map;

public class PlayerStats {
    private static final Map<Player, Integer> kills = new HashMap<>();
    private static final Map<Player, Integer> deaths = new HashMap<>();

    public static void addKill(Player player) {
        kills.put(player, kills.getOrDefault(player, 0) + 1);
    }

    public static void addDeath(Player player) {
        deaths.put(player, deaths.getOrDefault(player, 0) + 1);
    }

    public static int getKills(Player player) {
        return kills.getOrDefault(player, 0);
    }

    public static int getDeaths(Player player) {
        return deaths.getOrDefault(player, 0);
    }
}
