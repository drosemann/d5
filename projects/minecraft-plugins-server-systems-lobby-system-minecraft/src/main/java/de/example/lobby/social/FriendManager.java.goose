// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-lobby-system-minecraft/src/main/java/de/example/lobby/social/FriendManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-lobby-system-minecraft/src/main/java/de/example/lobby/social/FriendManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-lobby-system-minecraft/src/main/java/de/example/lobby/social/FriendManager.java), unveraendert, als Inline-Doku ----
// package de.example.lobby.social;
//
// import de.example.lobby.LobbyPlugin;
// import org.bukkit.Bukkit;
// import org.bukkit.OfflinePlayer;
// import org.bukkit.entity.Player;
//
// import java.util.HashMap;
// import java.util.HashSet;
// import java.util.Map;
// import java.util.Set;
// import java.util.UUID;
//
// public class FriendManager {
//     private final LobbyPlugin plugin;
//     private final Map<UUID, Set<UUID>> friendLists = new HashMap<>();
//
//     public FriendManager(LobbyPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     public void addFriend(Player player, Player friend) {
//         UUID playerId = player.getUniqueId();
//         UUID friendId = friend.getUniqueId();
//         friendLists.computeIfAbsent(playerId, k -> new HashSet<>()).add(friendId);
//         player.sendMessage("You are now friends with " + friend.getName() + "!");
//     }
//
//     public void removeFriend(Player player, OfflinePlayer friend) {
//         UUID playerId = player.getUniqueId();
//         UUID friendId = friend.getUniqueId();
//         Set<UUID> friends = friendLists.get(playerId);
//         if (friends != null && friends.remove(friendId)) {
//             player.sendMessage("You are no longer friends with " + friend.getName() + ".");
//         }
//     }
//
//     public void showOnlineFriends(Player player) {
//         Set<UUID> friends = friendLists.get(player.getUniqueId());
//         if (friends != null) {
//             player.sendMessage("Online Friends:");
//             for (UUID friendId : friends) {
//                 Player onlineFriend = Bukkit.getPlayer(friendId);
//                 if (onlineFriend != null && onlineFriend.isOnline()) {
//                     player.sendMessage("- " + onlineFriend.getName());
//                 }
//             }
//         }
//     }
// } 
