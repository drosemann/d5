// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ChatInputListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ChatInputListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/listener/ChatInputListener.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.listener;
//
// import java.util.HashMap;
// import java.util.Map;
// import java.util.function.Consumer;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.AsyncPlayerChatEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
//
// public class ChatInputListener implements Listener {
//    private static Map inputActions = new HashMap();
//
//    public ChatInputListener() {
//       inputActions = new HashMap();
//    }
//
//    public static void setInputAction(Player player, Consumer event) {
//       inputActions.put(player.getUniqueId(), event);
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onChat(AsyncPlayerChatEvent event) {
//       Consumer action = (Consumer)inputActions.remove(event.getPlayer().getUniqueId());
//       if (action != null) {
//          action.accept(event);
//          event.setCancelled(true);
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.LOW
//    )
//    public void onQuit(PlayerQuitEvent event) {
//       inputActions.remove(event.getPlayer().getUniqueId());
//    }
// }
//
