// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/MapUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/MapUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/MapUtils.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
//
// public class MapUtils {
//    public static Map createStringMap(String... data) {
//       Map map = new HashMap();
//
//       for(int i = 1; i < data.length; i += 2) {
//          String key = data[i - 1];
//          String value = data[i];
//          map.put(key, value);
//       }
//
//       return map;
//    }
//
//    public static Map createStringArrayMap(String key, String... values) {
//       Map map = new HashMap();
//       map.put(key, values);
//       return map;
//    }
//
//    public static Map createStringListMap(String key, String... values) {
//       Map map = new HashMap();
//       map.put(key, new ArrayList(Arrays.asList(values)));
//       return map;
//    }
//
//    public static Map createSubSettingsMapFromDocument(Document document) {
//       if (document == null) {
//          return new HashMap();
//       } else {
//          Map map = new HashMap();
//          Iterator var2 = document.entrySet().iterator();
//
//          while(var2.hasNext()) {
//             Entry entry = (Entry)var2.next();
//
//             try {
//                map.put((String)entry.getKey(), document.getStringArray((String)entry.getKey()));
//             } catch (Exception var5) {
//                Challenges.getInstance().getLogger().error("", new Object[]{var5});
//             }
//          }
//
//          return map;
//       }
//    }
// }
//
