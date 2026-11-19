package net.anweisen.utilities.bukkit.utils.bstats.chart;

import java.util.function.BiConsumer;
import net.anweisen.utilities.bukkit.utils.bstats.JsonObjectBuilder;

public abstract class CustomChart {
   private final String chartId;

   protected CustomChart(String chartId) {
      if (chartId == null) {
         throw new IllegalArgumentException("chartId must not be null");
      } else {
         this.chartId = chartId;
      }
   }

   public JsonObjectBuilder.JsonObject getRequestJsonObject(BiConsumer errorLogger, boolean logErrors) {
      JsonObjectBuilder builder = new JsonObjectBuilder();
      builder.appendField("chartId", this.chartId);

      try {
         JsonObjectBuilder.JsonObject data = this.getChartData();
         if (data == null) {
            return null;
         }

         builder.appendField("data", data);
      } catch (Throwable var5) {
         if (logErrors) {
            errorLogger.accept("Failed to get data for custom chart with id " + this.chartId, var5);
         }

         return null;
      }

      return builder.build();
   }

   protected abstract JsonObjectBuilder.JsonObject getChartData() throws Exception;
}
