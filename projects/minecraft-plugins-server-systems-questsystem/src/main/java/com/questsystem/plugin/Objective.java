package com.questsystem.plugin;

public class Objective {
    private final ObjectiveType type;
    private final String target;
    private final int requiredAmount;

    public enum ObjectiveType { COLLECT, KILL, LOCATION }

    public Objective(ObjectiveType type, String target, int requiredAmount) {
        this.type = type;
        this.target = target;
        this.requiredAmount = requiredAmount;
    }

    public ObjectiveType getType() {
        return type;
    }

    public String getTarget() {
        return target;
    }

    public int getRequiredAmount() {
        return requiredAmount;
    }
}