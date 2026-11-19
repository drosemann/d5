package com.example.minigame;

import org.bukkit.entity.Player;

import java.util.HashMap;
import java.util.Map;

public class PlayerScore {
    private final Map<Player, Integer> scores = new HashMap<>();

    public void addScore(Player player, int points) {
        scores.put(player, scores.getOrDefault(player, 0) + points);
    }

    public int getScore(Player player) {
        return scores.getOrDefault(player, 0);
    }

    public void resetScores() {
        scores.clear();
    }
} 