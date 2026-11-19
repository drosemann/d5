// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/MapManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/MapManager.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-minigame-template/src/main/java/MapManager.java), unveraendert, als Inline-Doku ----
// package com.example.minigame;
//
// import org.bukkit.Bukkit;
// import org.bukkit.Location;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.java.JavaPlugin;
//
// import java.util.HashMap;
// import java.util.Map;
//
// public class MapManager implements CommandExecutor {
//     private final JavaPlugin plugin;
//     private final Map<String, GameMap> maps;
//
//     public MapManager(JavaPlugin plugin) {
//         this.plugin = plugin;
//         this.maps = new HashMap<>();
//         plugin.getCommand("map").setExecutor(this);
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (args.length == 0) {
//             return false; // Show usage
//         }
//
//         switch (args[0].toLowerCase()) {
//             case "create":
//                 return createMap(sender, args);
//             case "setspawnpoint":
//                 return setSpawnPoint(sender, args);
//             case "sethub":
//                 return setHub(sender);
//             case "finish":
//                 return finishMap(sender, args);
//             case "list":
//                 return listMaps(sender);
//             case "delete":
//                 return deleteMap(sender, args);
//             case "join":
//                 return joinMap(sender, args);
//             default:
//                 return false; // Show usage
//         }
//     }
//
//     private boolean createMap(CommandSender sender, String[] args) {
//         if (args.length < 2) {
//             sender.sendMessage("Usage: /map create NAME");
//             return true;
//         }
//         String mapName = args[1];
//         if (maps.containsKey(mapName)) {
//             sender.sendMessage("Map with this name already exists!");
//             return true;
//         }
//         maps.put(mapName, new GameMap(mapName));
//         sender.sendMessage("Map " + mapName + " created!");
//         return true;
//     }
//
//     private boolean setSpawnPoint(CommandSender sender, String[] args) {
//         if (!(sender instanceof Player)) {
//             sender.sendMessage("Only players can set spawn points!");
//             return true;
//         }
//         Player player = (Player) sender;
//         if (args.length < 2) {
//             player.sendMessage("Usage: /map setspawnpoint NAME");
//             return true;
//         }
//         String mapName = args[1];
//         GameMap map = maps.get(mapName);
//         if (map == null) {
//             player.sendMessage("Map not found!");
//             return true;
//         }
//         Location location = player.getLocation();
//         map.addSpawnPoint(location);
//         player.sendMessage("Spawn point set for map " + mapName + "!");
//         return true;
//     }
//
//     private boolean setHub(CommandSender sender) {
//         if (!(sender instanceof Player)) {
//             sender.sendMessage("Only players can set the hub!");
//             return true;
//         }
//         Player player = (Player) sender;
//         Location location = player.getLocation();
//         // Set the hub location (you may want to store this in a specific map)
//         // For simplicity, we can just send a message
//         player.sendMessage("Hub set at your current location!");
//         return true;
//     }
//
//     private boolean finishMap(CommandSender sender, String[] args) {
//         if (args.length < 2) {
//             sender.sendMessage("Usage: /map finish NAME");
//             return true;
//         }
//         String mapName = args[1];
//         GameMap map = maps.get(mapName);
//         if (map == null) {
//             sender.sendMessage("Map not found!");
//             return true;
//         }
//         map.setFinished(true);
//         sender.sendMessage("Map " + mapName + " finished!");
//         return true;
//     }
//
//     private boolean listMaps(CommandSender sender) {
//         if (maps.isEmpty()) {
//             sender.sendMessage("No maps available.");
//             return true;
//         }
//         sender.sendMessage("Available maps:");
//         for (String mapName : maps.keySet()) {
//             sender.sendMessage("- " + mapName);
//         }
//         return true;
//     }
//
//     private boolean deleteMap(CommandSender sender, String[] args) {
//         if (args.length < 2) {
//             sender.sendMessage("Usage: /map delete NAME");
//             return true;
//         }
//         String mapName = args[1];
//         if (maps.remove(mapName) != null) {
//             sender.sendMessage("Map " + mapName + " deleted!");
//         } else {
//             sender.sendMessage("Map not found!");
//         }
//         return true;
//     }
//
//     private boolean joinMap(CommandSender sender, String[] args) {
//         if (!(sender instanceof Player)) {
//             sender.sendMessage("Only players can join maps!");
//             return true;
//         }
//         Player player = (Player) sender;
//         if (args.length < 2) {
//             player.sendMessage("Usage: /map join NAME");
//             return true;
//         }
//         String mapName = args[1];
//         GameMap map = maps.get(mapName);
//         if (map == null) {
//             player.sendMessage("Map not found!");
//             return true;
//         }
//         // Teleport the player to the map's spawn point (you may want to implement this)
//         player.teleport(map.getSpawnPoint());
//         player.sendMessage("Joined map " + mapName + "!");
//         return true;
//     }
// } 
