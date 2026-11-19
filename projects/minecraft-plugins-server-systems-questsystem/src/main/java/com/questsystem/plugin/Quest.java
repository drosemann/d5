package com.questsystem.plugin;

import java.util.List;

public class Quest {
    private final String id;
    private final String name;
    private final String description;
    private final QuestType type;
    private final List<Objective> objectives;
    private final Reward reward;
    private final int minLevel;

    public enum QuestType {
        TUTORIAL,
        COMBAT,
        EXPLORATION,
        CRAFTING,
        FARMING,
        MINING
    }

    public Quest(String id, String name, String description, QuestType type, List<Objective> objectives, Reward reward, int minLevel) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.type = type;
        this.objectives = objectives;
        this.reward = reward;
        this.minLevel = minLevel;
    }

    public int getMinLevel() {
        return minLevel;
    }

    public List<Objective> getObjectives() {
        return objectives;
    }

    public QuestType getType() {
        return type;
    }

    public String getName() { // Add this method
        return name;
    }
}