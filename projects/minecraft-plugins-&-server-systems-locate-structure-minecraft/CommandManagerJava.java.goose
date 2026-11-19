// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-locate-structure-minecraft/CommandManagerJava.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-locate-structure-minecraft/CommandManagerJava.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-locate-structure-minecraft/CommandManagerJava.java), unveraendert, als Inline-Doku ----
// public class CommandManagerJava implements CommandExecutor {
//     @Override
//     public boolean onCommand(@NotNull CommandSender sender, @NotNull Command command, @NotNull String label, @NotNull String[] args) {
//         if(command.getName().equals("testlocate")) {
//             //Cast sender to player
//             if(!(sender instanceof Player player)) return false;
//          
//             //Find the nearest structure
//             var location = player.getWorld().locateNearestStructure(player.getLocation(), StructureType.DESERT_PYRAMID, 32, false);
//          
//             //Tell the player the location
//             if(location == null) {
//                 player.sendMessage("Location not found");
//             } else {
//                 player.sendMessage("Location: " + location.getBlockX() + " " + location.getBlockY() + " " + location.getBlockZ());
//             }
//          
//             return true;
//         }
//      
//         return false;
//     }
// }
