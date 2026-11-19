// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-questsystem/src/main/java/com/questsystem/plugin/ActiveQuest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-questsystem/src/main/java/com/questsystem/plugin/ActiveQuest.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-questsystem/src/main/java/com/questsystem/plugin/ActiveQuest.java), unveraendert, als Inline-Doku ----
// package com.questsystem.plugin;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class ActiveQuest {
//     private final Quest quest;
//     private final Map<Objective, Integer> progress = new HashMap<>();
//
//     public ActiveQuest(Quest quest) {
//         this.quest = quest;
//         quest.getObjectives().forEach(obj -> progress.put(obj, 0));
//     }
//
//     public Quest getQuest() {
//         return quest;
//     }
//
//     public void updateProgress(Objective.ObjectiveType type, String target) {
//         progress.keySet().stream()
//             .filter(obj -> obj.getType() == type && obj.getTarget().equalsIgnoreCase(target))
//             .forEach(obj -> progress.merge(obj, 1, Integer::sum));
//     }
//
//     public boolean isComplete() {
//         return progress.entrySet().stream()
//             .allMatch(entry -> entry.getValue() >= entry.getKey().getRequiredAmount());
//     }
// }
