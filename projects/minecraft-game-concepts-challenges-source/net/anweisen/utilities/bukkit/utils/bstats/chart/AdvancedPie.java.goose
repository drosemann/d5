// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/AdvancedPie.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/AdvancedPie.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/AdvancedPie.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.bstats.chart;
//
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.concurrent.Callable;
// import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;
//
// public class AdvancedPie extends CustomChart {
//    private final Callable callable;
//
//    public AdvancedPie(String chartId, Callable callable) {
//       super(chartId);
//       this.callable = callable;
//    }
//
//    protected JsonObjectBuilder.JsonObject getChartData() throws Exception {
//       JsonObjectBuilder valuesBuilder = new JsonObjectBuilder();
//       Map map = (Map)this.callable.call();
//       if (map != null && !map.isEmpty()) {
//          boolean allSkipped = true;
//          Iterator var4 = map.entrySet().iterator();
//
//          while(var4.hasNext()) {
//             Entry entry = (Entry)var4.next();
//             if ((Integer)entry.getValue() != 0) {
//                allSkipped = false;
//                valuesBuilder.appendField((String)entry.getKey(), (Integer)entry.getValue());
//             }
//          }
//
//          if (allSkipped) {
//             return null;
//          } else {
//             return (new JsonObjectBuilder()).appendField("values", valuesBuilder.build()).build();
//          }
//       } else {
//          return null;
//       }
//    }
// }
//
