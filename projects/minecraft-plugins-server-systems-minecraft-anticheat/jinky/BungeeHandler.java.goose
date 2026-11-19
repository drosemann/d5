// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/BungeeHandler.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/BungeeHandler.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/BungeeHandler.java), unveraendert, als Inline-Doku ----
// package me.jinky;
//
// import java.io.ByteArrayInputStream;
// import java.io.ByteArrayOutputStream;
// import java.io.DataInputStream;
// import java.io.DataOutputStream;
// import java.io.IOException;
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.messaging.PluginMessageListener;
//
// public class BungeeHandler implements PluginMessageListener {
//    public static void load(BAC plugin) {
//       Bukkit.getMessenger().registerOutgoingPluginChannel(plugin, "BAC:BACAlert".toLowerCase());
//       Bukkit.getMessenger().registerOutgoingPluginChannel(plugin, "BAC:BACPunish".toLowerCase());
//       Bukkit.getMessenger().registerIncomingPluginChannel(plugin, "BAC:BACAlert".toLowerCase(), new BungeeHandler());
//    }
//
//    private static void sbmsg(String msg, String ch) {
//       ByteArrayOutputStream b = new ByteArrayOutputStream();
//       DataOutputStream out = new DataOutputStream(b);
//
//       try {
//          out.writeUTF(msg);
//       } catch (IOException var5) {
//          var5.printStackTrace();
//       }
//
//       Bukkit.getServer().sendPluginMessage(BAC.getBAC(), ch.toLowerCase(), b.toByteArray());
//    }
//
//    public static void handleCrossAlert(String msg) {
//       sbmsg(msg, "bac:bacalert");
//    }
//
//    public static boolean handleBungeePunish(String msg) {
//       if (msg.toLowerCase().startsWith("bungeecord:")) {
//          sbmsg(msg.replaceAll("bungeecord:", ""), "bac:bacpunish");
//          return true;
//       } else {
//          return false;
//       }
//    }
//
//    public synchronized void onPluginMessageReceived(String channel, Player player, byte[] message) {
//       DataInputStream in = new DataInputStream(new ByteArrayInputStream(message));
//       if (channel.equals("bac:bacalert")) {
//          try {
//             String msg = in.readUTF();
//             BAC.getBAC().broadcast(msg);
//          } catch (IOException var6) {
//             var6.printStackTrace();
//          }
//       }
//
//    }
// }
//
