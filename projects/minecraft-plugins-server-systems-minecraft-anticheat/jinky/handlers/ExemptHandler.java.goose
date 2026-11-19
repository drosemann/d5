// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/handlers/ExemptHandler.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/handlers/ExemptHandler.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/handlers/ExemptHandler.java), unveraendert, als Inline-Doku ----
// package me.jinky.handlers;
//
// import java.util.HashMap;
// import java.util.Map;
// import me.jinky.BAC;
// import me.jinky.util.MiniPlugin;
// import org.bukkit.entity.Player;
//
// public class ExemptHandler extends MiniPlugin {
//    private static Map EXEMPT = new HashMap();
//    private static Map EXEMPT_BLOCK = new HashMap();
//    private static Map EXEMPT_REASON = new HashMap();
//
//    public ExemptHandler(BAC plugin) {
//       super("Exemption Handler", plugin);
//    }
//
//    public boolean isExemptBlock(Player p) {
//       if (EXEMPT_BLOCK.containsKey(p)) {
//          if (System.currentTimeMillis() < (Long)EXEMPT_BLOCK.get(p)) {
//             return true;
//          } else {
//             EXEMPT_BLOCK.remove(p);
//             return false;
//          }
//       } else {
//          return false;
//       }
//    }
//
//    public void removeExemptionBlock(Player p) {
//       if (EXEMPT_BLOCK.containsKey(p)) {
//          EXEMPT_BLOCK.remove(p);
//       }
//
//    }
//
//    public void addExemptionBlock(Player p, int ms) {
//       if (this.isExempt(p)) {
//          this.removeExemption(p);
//       }
//
//       EXEMPT_BLOCK.put(p, System.currentTimeMillis() + (long)ms);
//    }
//
//    public boolean isExempt(Player p) {
//       if (EXEMPT.containsKey(p)) {
//          if (System.currentTimeMillis() < (Long)EXEMPT.get(p) && !this.isExemptBlock(p)) {
//             return true;
//          } else {
//             EXEMPT.remove(p);
//             if (EXEMPT_REASON.containsKey(p)) {
//                EXEMPT_REASON.remove(p);
//             }
//
//             return false;
//          }
//       } else {
//          return false;
//       }
//    }
//
//    public void removeExemption(Player p) {
//       if (EXEMPT.containsKey(p)) {
//          EXEMPT.remove(p);
//       }
//
//       if (EXEMPT_REASON.containsKey(p)) {
//          EXEMPT_REASON.remove(p);
//       }
//
//    }
//
//    public String getExemptReason(Player p) {
//       return EXEMPT_REASON.containsKey(p) ? (String)EXEMPT_REASON.get(p) : "unknown/notexempt";
//    }
//
//    public void addExemption(Player p, int ms, String s) {
//       if (!this.isExemptBlock(p)) {
//          if (this.isExempt(p)) {
//             this.removeExemption(p);
//          }
//
//          EXEMPT_REASON.put(p, s);
//          EXEMPT.put(p, System.currentTimeMillis() + (long)ms);
//       }
//    }
// }
//
