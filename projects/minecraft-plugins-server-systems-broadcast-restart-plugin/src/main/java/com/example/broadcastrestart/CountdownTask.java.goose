// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/CountdownTask.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/CountdownTask.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-broadcast-restart-plugin/src/main/java/com/example/broadcastrestart/CountdownTask.java), unveraendert, als Inline-Doku ----
// package com.example.broadcastrestart;
//
// import org.bukkit.Bukkit;
// import org.bukkit.ChatColor;
// import org.bukkit.scheduler.BukkitRunnable;
//
// public class CountdownTask extends BukkitRunnable {
//     private int remainingSeconds;
//
//     public CountdownTask(int totalSeconds) {
//         this.remainingSeconds = totalSeconds;
//     }
//
//     @Override
//     public void run() {
//         remainingSeconds--;
//
//         if (remainingSeconds < 0) {
//             cancel();
//             return;
//         }
//
//         if (remainingSeconds == 0) {
//             Bukkit.broadcastMessage(ChatColor.RED + "Restart in 0 seconds!");
//             cancel();
//             return;
//         }
//
//         if (remainingSeconds > 20) {
//             handleMinutePhase();
//         } else if (remainingSeconds >= 10) {
//             handleFiveSecondPhase();
//         } else {
//             handleSecondPhase();
//         }
//     }
//
//     private void handleMinutePhase() {
//         if (remainingSeconds % 60 == 0) {
//             int minutes = remainingSeconds / 60;
//             String message = ChatColor.RED + "Restart in " + minutes + " minute" + (minutes != 1 ? "s" : "") + "!";
//             Bukkit.broadcastMessage(message);
//         }
//     }
//
//     private void handleFiveSecondPhase() {
//         if (remainingSeconds % 5 == 0) {
//             Bukkit.broadcastMessage(ChatColor.RED + "Restart in " + remainingSeconds + " seconds!");
//         }
//     }
//
//     private void handleSecondPhase() {
//         Bukkit.broadcastMessage(ChatColor.RED + "Restart in " + remainingSeconds + " seconds!");
//     }
// }
