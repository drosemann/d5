package com.questsystem.plugin;

import java.util.HashMap;
import java.util.Map;

public class ActiveQuest {
    private final Quest quest;
    private final Map<Objective, Integer> progress = new HashMap<>();

    public ActiveQuest(Quest quest) {
        this.quest = quest;
        quest.getObjectives().forEach(obj -> progress.put(obj, 0));
    }

    public Quest getQuest() {
        return quest;
    }

    public void updateProgress(Objective.ObjectiveType type, String target) {
        progress.keySet().stream()
            .filter(obj -> obj.getType() == type && obj.getTarget().equalsIgnoreCase(target))
            .forEach(obj -> progress.merge(obj, 1, Integer::sum));
    }

    public boolean isComplete() {
        return progress.entrySet().stream()
            .allMatch(entry -> entry.getValue() >= entry.getKey().getRequiredAmount());
    }
}