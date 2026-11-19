// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/ChatManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/ChatManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/ChatManager.java), unveraendert, als Inline-Doku ----
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.Set;
//
// public class ChatManager {
//     private final Map<String, Set<Player>> teamChatMap;
//
//     public ChatManager() {
//         this.teamChatMap = new HashMap<>();
//     }
//
//     public void sendMessage(Player sender, String message) {
//         // Send a public message to all players
//         Bukkit.broadcastMessage(sender.getName() + ": " + message);
//     }
//
//     public void sendTeamMessage(Player sender, String teamName, String message) {
//         Set<Player> teamMembers = teamChatMap.get(teamName);
//         if (teamMembers != null) {
//             for (Player member : teamMembers) {
//                 member.sendMessage("[Team] " + sender.getName() + ": " + message);
//             }
//         } else {
//             sender.sendMessage("You are not in a team or the team does not exist.");
//         }
//     }
//
//     public void addPlayerToTeamChat(Player player, String teamName) {
//         teamChatMap.computeIfAbsent(teamName, k -> new HashSet<>()).add(player);
//     }
//
//     public void removePlayerFromTeamChat(Player player, String teamName) {
//         Set<Player> teamMembers = teamChatMap.get(teamName);
//         if (teamMembers != null) {
//             teamMembers.remove(player);
//         }
//     }
// } 
