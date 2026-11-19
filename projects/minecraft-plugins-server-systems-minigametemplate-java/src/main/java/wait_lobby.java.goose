// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/wait_lobby.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/wait_lobby.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/wait_lobby.java), unveraendert, als Inline-Doku ----
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// public class LobbyCommand implements CommandExecutor {
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (sender instanceof Player) {
//             Player player = (Player) sender;
//             // Teleportiere Spieler zur Wartelobby
//             player.teleport(new Location(player.getWorld(), x, y, z)); // Setze x, y, z auf die Koordinaten der Wartelobby
//             player.sendMessage("Du bist jetzt in der Wartelobby!");
//             return true;
//         }
//         return false;
//     }
// }
//
