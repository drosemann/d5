package net.anweisen.utilities.bukkit.utils.bstats.chart;

import java.util.concurrent.Callable;
import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;

public class SingleLineChart extends CustomChart {
   private final Callable callable;

   public SingleLineChart(String chartId, Callable callable) {
      super(chartId);
      this.callable = callable;
   }

   protected JsonObjectBuilder.JsonObject getChartData() throws Exception {
      int value = (Integer)this.callable.call();
      return value == 0 ? null : (new JsonObjectBuilder()).appendField("value", value).build();
   }
}
