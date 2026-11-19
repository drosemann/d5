// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestProgress.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestProgress.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestProgress.java), unveraendert, als Inline-Doku ----
// package de.streuland.quest;
//
// public class QuestProgress {
//     private int value;
//     private boolean completed;
//     private long completedAt;
//
//     public int getValue() {
//         return value;
//     }
//
//     public void setValue(int value) {
//         this.value = Math.max(0, value);
//     }
//
//     public void increment(int delta) {
//         setValue(value + delta);
//     }
//
//     public boolean isCompleted() {
//         return completed;
//     }
//
//     public void setCompleted(boolean completed) {
//         this.completed = completed;
//         if (completed && completedAt == 0L) {
//             this.completedAt = System.currentTimeMillis();
//         }
//     }
//
//     public long getCompletedAt() {
//         return completedAt;
//     }
//
//     public void setCompletedAt(long completedAt) {
//         this.completedAt = completedAt;
//     }
// }
//
