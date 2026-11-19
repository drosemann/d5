// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/DrilldownPie.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/DrilldownPie.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/chart/DrilldownPie.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.bstats.chart;
//
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.concurrent.Callable;
// import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;
//
// public class DrilldownPie extends CustomChart {
//    private final Callable callable;
//
//    public DrilldownPie(String chartId, Callable callable) {
//       super(chartId);
//       this.callable = callable;
//    }
//
//    public JsonObjectBuilder.JsonObject getChartData() throws Exception {
//       JsonObjectBuilder valuesBuilder = new JsonObjectBuilder();
//       Map map = (Map)this.callable.call();
//       if (map != null && !map.isEmpty()) {
//          boolean reallyAllSkipped = true;
//          Iterator var4 = map.entrySet().iterator();
//
//          while(var4.hasNext()) {
//             Entry entryValues = (Entry)var4.next();
//             JsonObjectBuilder valueBuilder = new JsonObjectBuilder();
//             boolean allSkipped = true;
//
//             for(Iterator var8 = ((Map)map.get(entryValues.getKey())).entrySet().iterator(); var8.hasNext(); allSkipped = false) {
//                Entry valueEntry = (Entry)var8.next();
//                valueBuilder.appendField((String)valueEntry.getKey(), (Integer)valueEntry.getValue());
//             }
//
//             if (!allSkipped) {
//                reallyAllSkipped = false;
//                valuesBuilder.appendField((String)entryValues.getKey(), valueBuilder.build());
//             }
//          }
//
//          if (reallyAllSkipped) {
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
