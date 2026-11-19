package com.questsystem.plugin;

import org.bukkit.entity.Player;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class QuestManager {
    private final Map<UUID, List<ActiveQuest>> playerQuests = new HashMap<>();
    private final QuestConfig questConfig;

    public QuestManager(QuestConfig questConfig) {
        this.questConfig = questConfig;
    }

    public void startQuest(Player player, String questId) {
        Quest quest = questConfig.getQuests().get(questId);
        if (meetsRequirements(player, quest)) {
            ActiveQuest active = new ActiveQuest(quest);
            playerQuests.computeIfAbsent(player.getUniqueId(), k -> new ArrayList<>()).add(active);
            System.out.println("Quest added for player: " + player.getName());
        } else {
            System.out.println("Player does not meet requirements for quest: " + questId);
        }
    }

    private boolean meetsRequirements(Player player, Quest quest) {
        return player.getLevel() >= quest.getMinLevel();
    }

    public void checkProgress(Player player, Objective.ObjectiveType type, String target) {
        playerQuests.getOrDefault(player.getUniqueId(), Collections.emptyList())
            .forEach(quest -> quest.updateProgress(type, target));
    }

    public List<ActiveQuest> getActiveQuests(Player player) {
        return playerQuests.getOrDefault(player.getUniqueId(), Collections.emptyList());
    }
}