package net.codingarea.challenges.plugin.management.bstats;

import java.util.HashMap;
import net.anweisen.utilities.bukkit.utils.bstats.Metrics;
import net.anweisen.utilities.bukkit.utils.bstats.chart.AdvancedPie;
import net.anweisen.utilities.bukkit.utils.bstats.chart.SimplePie;
import net.anweisen.utilities.bukkit.utils.bstats.chart.SingleLineChart;
import net.anweisen.utilities.common.misc.StringUtils;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.content.loader.LanguageLoader;
import net.codingarea.challenges.plugin.utils.misc.MemoryConverter;

public class MetricsLoader {
   public void start() {
      Challenges plugin = Challenges.getInstance();
      Metrics metrics = new Metrics(plugin, 11494);
      metrics.addCustomChart(new SimplePie("language", () -> {
         LanguageLoader loader = (LanguageLoader)Challenges.getInstance().getLoaderRegistry().getFirstLoaderByClass(LanguageLoader.class);
         return loader == null ? "NULL" : loader.getLanguage();
      }));
      metrics.addCustomChart(new SimplePie("cloudType", () -> {
         return StringUtils.getEnumName(plugin.getCloudSupportManager().getType());
      }));
      metrics.addCustomChart(new SimplePie("databaseType", () -> {
         return StringUtils.getEnumName(plugin.getDatabaseManager().getType());
      }));
      metrics.addCustomChart(new SingleLineChart("totalMemory", this::getMemory));
      metrics.addCustomChart(new SingleLineChart("totalCores", () -> {
         return Runtime.getRuntime().availableProcessors();
      }));
      metrics.addCustomChart(new AdvancedPie("maxMemory", () -> {
         HashMap map = new HashMap();
         if (Runtime.getRuntime().maxMemory() == Long.MAX_VALUE) {
            return map;
         } else {
            map.put(String.valueOf(this.getMemory()), 1);
            return map;
         }
      }));
   }

   private int getMemory() {
      return MemoryConverter.getGB(Runtime.getRuntime().maxMemory());
   }
}
