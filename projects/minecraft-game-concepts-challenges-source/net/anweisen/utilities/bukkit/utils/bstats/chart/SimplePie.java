package net.anweisen.utilities.bukkit.utils.bstats.chart;

import java.util.concurrent.Callable;
import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;

public class SimplePie extends CustomChart {
   private final Callable callable;

   public SimplePie(String chartId, Callable callable) {
      super(chartId);
      this.callable = callable;
   }

   protected JsonObjectBuilder.JsonObject getChartData() throws Exception {
      String value = (String)this.callable.call();
      return value != null && !value.isEmpty() ? (new JsonObjectBuilder()).appendField("value", value).build() : null;
   }
}
