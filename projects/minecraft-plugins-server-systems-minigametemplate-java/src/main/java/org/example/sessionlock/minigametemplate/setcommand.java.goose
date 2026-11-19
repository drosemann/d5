// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/org/example/sessionlock/minigametemplate/setcommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/org/example/sessionlock/minigametemplate/setcommand.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minigametemplate-java/src/main/java/org/example/sessionlock/minigametemplate/setcommand.java), unveraendert, als Inline-Doku ----
// import org.bukkit.Location;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.Player;
//
// public class SetCommand implements CommandExecutor {
//     private final Main plugin;
//
//     public SetCommand(Main plugin) {
//         this.plugin = plugin;
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (sender instanceof Player) {
//             Player player = (Player) sender;
//             if (args.length > 0) {
//                 String type = args[0];
//                 Location loc = player.getLocation();
//                 switch (type.toLowerCase()) {
//                     case "teamspawn":
//                         // Setze Team-Spawn
//                         break;
//                     case "kiste":
//                         // Setze Kiste
//                         loc.getBlock().setType(Material.CHEST);
//                         break;
//                     case "eisenspawner":
//                         // Setze Eisenspawner
//                         loc.getBlock().setType(Material.IRON_BLOCK);
//                         break;
//                     case "bett":
//                         // Setze "Bett"-Block
//                         loc.getBlock().setType(Material.BEDROCK);
//                         plugin.getBedBlocks().add(loc);
//                         break;
//                     case "monster":
//                         // Setze Monster-Spawnblock
//                         plugin.getMonsters().add(player.getWorld().spawnEntity(loc, EntityType.ZOMBIE));
//                         break;
//                     default:
//                         player.sendMessage("Unbekannter Typ!");
//                         return false;
//                 }
//                 player.sendMessage(type + " gesetzt!");
//                 return true;
//             }
//         }
//         return false;
//     }
// }
//
