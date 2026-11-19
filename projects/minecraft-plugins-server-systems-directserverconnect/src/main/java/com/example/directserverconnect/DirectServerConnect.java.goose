// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-directserverconnect/src/main/java/com/example/directserverconnect/DirectServerConnect.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-directserverconnect/src/main/java/com/example/directserverconnect/DirectServerConnect.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-directserverconnect/src/main/java/com/example/directserverconnect/DirectServerConnect.java), unveraendert, als Inline-Doku ----
// package com.example.directserverconnect;
//
// import org.bukkit.Bukkit;
// import org.bukkit.ChatColor;
// import org.bukkit.configuration.file.FileConfiguration;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import java.util.List;
//
// public class DirectServerConnect extends JavaPlugin {
//     private FileConfiguration config;
//     private List<String> allowedIps;
//
//     @Override
//     public void onEnable() {
//         saveDefaultConfig();
//         config = getConfig();
//         allowedIps = config.getStringList("allowed-ips");
//     }
//
//     @Override
//     public void onDisable() {
//         // Plugin shutdown logic
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (command.getName().equalsIgnoreCase("connect")) {
//             if (sender instanceof Player) {
//                 Player player = (Player) sender;
//                 if (args.length < 1) {
//                     player.sendMessage(ChatColor.RED + "Bitte gib eine IP-Adresse an.");
//                     return true;
//                 }
//                 String targetIp = args[0];
//                 String[] ipParts = targetIp.split(":");
//                 String ip = ipParts[0];
//                 int port = (ipParts.length > 1) ? Integer.parseInt(ipParts[1]) : config.getInt("default-port");
//
//                 if (isAllowedIp(ip + ":" + port)) {
//                     // Hier sollte die Logik zur Verbindung mit dem Server implementiert werden
//                     player.sendMessage(ChatColor.GREEN + "Verbindung erfolgreich zu " + ip + ":" + port + " hergestellt!");
//                 } else {
//                     player.sendMessage(ChatColor.RED + "Verbindung zu " + ip + ":" + port + " fehlgeschlagen. Bitte überprüfe die Adresse.");
//                 }
//             } else {
//                 sender.sendMessage("Dieser Befehl kann nur von Spielern verwendet werden.");
//             }
//             return true;
//         }
//
//         if (command.getName().equalsIgnoreCase("connectreload")) {
//             if (sender.hasPermission("directconnect.admin")) {
//                 reloadConfig();
//                 allowedIps = config.getStringList("allowed-ips");
//                 sender.sendMessage(ChatColor.GREEN + "Konfiguration neu geladen.");
//             } else {
//                 sender.sendMessage(ChatColor.RED + "Du hast keine Berechtigung, diesen Befehl auszuführen.");
//             }
//             return true;
//         }
//
//         if (command.getName().equalsIgnoreCase("addallowedip")) {
//             if (sender.hasPermission("directconnect.admin")) {
//                 if (args.length < 1) {
//                     sender.sendMessage(ChatColor.RED + "Bitte gib eine IP-Adresse an.");
//                     return true;
//                 }
//                 String newIp = args[0];
//                 allowedIps.add(newIp);
//                 config.set("allowed-ips", allowedIps);
//                 saveConfig();
//                 sender.sendMessage(ChatColor.GREEN + "IP " + newIp + " zur Liste der erlaubten Verbindungen hinzugefügt.");
//             } else {
//                 sender.sendMessage(ChatColor.RED + "Du hast keine Berechtigung, diesen Befehl auszuführen.");
//             }
//             return true;
//         }
//
//         if (command.getName().equalsIgnoreCase("listallowedips")) {
//             if (sender.hasPermission("directconnect.admin")) {
//                 sender.sendMessage(ChatColor.GREEN + "Erlaubte IPs: " + String.join(", ", allowedIps));
//             } else {
//                 sender.sendMessage(ChatColor.RED + "Du hast keine Berechtigung, diesen Befehl auszuführen.");
//             }
//             return true;
//         }
//
//         return false;
//     }
//
//     private boolean isAllowedIp(String ipWithPort) {
//         return allowedIps.stream().anyMatch(allowedIp -> allowedIp.equalsIgnoreCase(ipWithPort));
//     }
// } 
