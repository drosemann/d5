// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestReward.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestReward.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestReward.java), unveraendert, als Inline-Doku ----
// package de.streuland.quest;
//
// import java.util.ArrayList;
// import java.util.Collections;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
//
// public class QuestReward {
//     private final int storageSlots;
//     private final List<String> cosmeticItems;
//     private final List<String> abilityUnlocks;
//     private final Map<String, Double> statBonuses;
//
//     public QuestReward(int storageSlots, List<String> cosmeticItems, List<String> abilityUnlocks, Map<String, Double> statBonuses) {
//         this.storageSlots = storageSlots;
//         this.cosmeticItems = cosmeticItems == null ? new ArrayList<String>() : new ArrayList<>(cosmeticItems);
//         this.abilityUnlocks = abilityUnlocks == null ? new ArrayList<String>() : new ArrayList<>(abilityUnlocks);
//         this.statBonuses = statBonuses == null ? new HashMap<String, Double>() : new HashMap<>(statBonuses);
//     }
//
//     public int getStorageSlots() {
//         return storageSlots;
//     }
//
//     public List<String> getCosmeticItems() {
//         return Collections.unmodifiableList(cosmeticItems);
//     }
//
//     public List<String> getAbilityUnlocks() {
//         return Collections.unmodifiableList(abilityUnlocks);
//     }
//
//     public Map<String, Double> getStatBonuses() {
//         return Collections.unmodifiableMap(statBonuses);
//     }
// }
//
