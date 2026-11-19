// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/SimpleBarChart.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/SimpleBarChart.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/SimpleBarChart.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.bstats.chart;
//
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.concurrent.Callable;
// import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;
//
// public class SimpleBarChart extends CustomChart {
//    private final Callable callable;
//
//    public SimpleBarChart(String chartId, Callable callable) {
//       super(chartId);
//       this.callable = callable;
//    }
//
//    protected JsonObjectBuilder.JsonObject getChartData() throws Exception {
//       JsonObjectBuilder valuesBuilder = new JsonObjectBuilder();
//       Map map = (Map)this.callable.call();
//       if (map != null && !map.isEmpty()) {
//          Iterator var3 = map.entrySet().iterator();
//
//          while(var3.hasNext()) {
//             Entry entry = (Entry)var3.next();
//             valuesBuilder.appendField((String)entry.getKey(), new int[]{(Integer)entry.getValue()});
//          }
//
//          return (new JsonObjectBuilder()).appendField("values", valuesBuilder.build()).build();
//       } else {
//          return null;
//       }
//    }
// }
//
