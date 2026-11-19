// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/events/ChatListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/events/ChatListener.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-buildffa-revamp/Private - BuildFFA/src/net/bote/bffa/events/ChatListener.java), unveraendert, als Inline-Doku ----
// package net.bote.bffa.events;
//
// import org.bukkit.Bukkit;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.AsyncPlayerChatEvent;
//
// import net.bote.bffa.main.Main;
//
// public class ChatListener implements Listener {
// 	
// 	@EventHandler
// 	public void onChat(AsyncPlayerChatEvent e) {
// 		e.setCancelled(true);
// 		if(Main.cfg.getBoolean("Config.ShowDisplayname") == true) {
// 			Bukkit.broadcastMessage(Main.prefix + e.getPlayer().getDisplayName() + " §8● §f" + e.getMessage());
// 		} else {
// 			Bukkit.broadcastMessage(Main.prefix+"§a" + e.getPlayer().getName() + " §8● §f" + e.getMessage());
// 		}
// 	}
// 	
// }
//
