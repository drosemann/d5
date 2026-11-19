// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-tablist/src/main/java/org/me/tablist/Tablist.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-tablist/src/main/java/org/me/tablist/Tablist.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-tablist/src/main/java/org/me/tablist/Tablist.java), unveraendert, als Inline-Doku ----
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.scoreboard.DisplaySlot;
// import org.bukkit.scoreboard.Objective;
// import org.bukkit.scoreboard.Scoreboard;
//
// import java.util.ArrayList;
// import java.util.Comparator;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
//
// public class TablistExample extends JavaPlugin implements Listener {
//
//     private Scoreboard scoreboard;
//     private Objective objective;
//     private Map<Player, String> customNames = new HashMap<>();
//     private Map<Player, String> playerGroups = new HashMap<>();
//
//     @Override
//     public void onEnable() {
//         // Erstelle ein neues Scoreboard und Objective
//         this.scoreboard = Bukkit.getScoreboardManager().getNewScoreboard();
//         this.objective = this.scoreboard.registerNewObjective("tablist", "dummy");
//         // Setze das Display-Slot auf TAB_LIST, damit es in der Tabliste angezeigt wird
//         this.objective.setDisplaySlot(DisplaySlot.TAB_LIST);
//
//         // Registriere den Event-Listener
//         getServer().getPluginManager().registerEvents(this, this);
//     }
//
//     @EventHandler
//     public void onPlayerJoin(PlayerJoinEvent event) {
//         Player player = event.getPlayer();
//         // Füge den Spieler dem Scoreboard hinzu
//         player.setScoreboard(scoreboard);
//         // Set default custom name if not set
//         customNames.putIfAbsent(player, player.getName());
//         // Aktualisiere die Tabliste
//         updateTablist();
//     }
//
//     @EventHandler
//     public void onPlayerQuit(PlayerQuitEvent event) {
//         // Aktualisiere die Tabliste, wenn ein Spieler den Server verlässt
//         updateTablist();
//     }
//
//     private void updateTablist() {
//         // Setze den Titel der Tabliste
//         this.objective.setDisplayName("Players Online (" + Bukkit.getOnlinePlayers().size() + ")");
//         List<Player> players = new ArrayList<>(Bukkit.getOnlinePlayers());
//         // Sort players by health
//         players.sort(Comparator.comparingDouble(Player::getHealth).reversed());
//         
//         for (Player player : players) {
//             String group = playerGroups.getOrDefault(player, "Player");
//             String displayName = customNames.get(player);
//             int healthPercentage = (int) ((player.getHealth() / player.getAttribute(Attribute.GENERIC_MAX_HEALTH).getValue()) * 100);
//             this.objective.getScore("[" + group + "] " + displayName + " (" + healthPercentage + "%)").setScore((int) Math.ceil(player.getHealth()));
//         }
//     }
//
//     // Method to set custom name
//     public void setCustomName(Player player, String name) {
//         customNames.put(player, name);
//         updateTablist(); // Update tablist after changing name
//     }
//
//     // Method to set player group
//     public void setPlayerGroup(Player player, String group) {
//         playerGroups.put(player, group);
//         updateTablist(); // Update tablist after changing group
//     }
//
// }
