package net.anweisen.utilities.bukkit.utils.bstats.chart;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;

public class AdvancedBarChart extends CustomChart {
   private final Callable callable;

   public AdvancedBarChart(String chartId, Callable callable) {
      super(chartId);
      this.callable = callable;
   }

   protected JsonObjectBuilder.JsonObject getChartData() throws Exception {
      JsonObjectBuilder valuesBuilder = new JsonObjectBuilder();
      Map map = (Map)this.callable.call();
      if (map != null && !map.isEmpty()) {
         boolean allSkipped = true;
         Iterator var4 = map.entrySet().iterator();

         while(var4.hasNext()) {
            Entry entry = (Entry)var4.next();
            if (((int[])entry.getValue()).length != 0) {
               allSkipped = false;
               valuesBuilder.appendField((String)entry.getKey(), (int[])entry.getValue());
            }
         }

         if (allSkipped) {
            return null;
         } else {
            return (new JsonObjectBuilder()).appendField("values", valuesBuilder.build()).build();
         }
      } else {
         return null;
      }
   }
}
