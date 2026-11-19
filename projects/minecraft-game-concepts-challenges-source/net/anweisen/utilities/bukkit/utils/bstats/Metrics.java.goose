// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/Metrics.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/Metrics.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/bstats/Metrics.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.bstats;
//
// import java.io.BufferedReader;
// import java.io.ByteArrayOutputStream;
// import java.io.DataOutputStream;
// import java.io.File;
// import java.io.IOException;
// import java.io.InputStreamReader;
// import java.lang.reflect.Method;
// import java.net.URL;
// import java.nio.charset.StandardCharsets;
// import java.util.Collection;
// import java.util.HashSet;
// import java.util.Objects;
// import java.util.Set;
// import java.util.UUID;
// import java.util.concurrent.Executors;
// import java.util.concurrent.ScheduledExecutorService;
// import java.util.concurrent.TimeUnit;
// import java.util.function.BiConsumer;
// import java.util.function.Consumer;
// import java.util.function.Supplier;
// import java.util.logging.Level;
// import java.util.zip.GZIPOutputStream;
// import javax.net.ssl.HttpsURLConnection;
// import net.anweisen.utilities.bukkit.utils.bstats.chart.CustomChart;
// import org.bukkit.Bukkit;
// import org.bukkit.configuration.file.YamlConfiguration;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.Plugin;
// import org.bukkit.plugin.java.JavaPlugin;
//
// public class Metrics {
//    private final Plugin plugin;
//    private final Metrics.MetricsBase metricsBase;
//
//    public Metrics(JavaPlugin plugin, int serviceId) {
//       this.plugin = plugin;
//       File bStatsFolder = new File(plugin.getDataFolder().getParentFile(), "bStats");
//       File configFile = new File(bStatsFolder, "config.yml");
//       YamlConfiguration config = YamlConfiguration.loadConfiguration(configFile);
//       if (!config.isSet("serverUuid")) {
//          config.addDefault("enabled", true);
//          config.addDefault("serverUuid", UUID.randomUUID().toString());
//          config.addDefault("logFailedRequests", false);
//          config.addDefault("logSentData", false);
//          config.addDefault("logResponseStatusText", false);
//          config.options().header("bStats (https://bStats.org) collects some basic information for plugin authors, like how\nmany people use their plugin and their total player count. It's recommended to keep bStats\nenabled, but if you're not comfortable with this, you can turn this setting off. There is no\nperformance penalty associated with having metrics enabled, and data sent to bStats is fully\nanonymous.").copyDefaults(true);
//
//          try {
//             config.save(configFile);
//          } catch (IOException var10) {
//          }
//       }
//
//       String serverUUID = config.getString("serverUuid");
//       boolean logErrors = config.getBoolean("logFailedRequests", false);
//       boolean logSentData = config.getBoolean("logSentData", false);
//       boolean logResponseStatusText = config.getBoolean("logResponseStatusText", false);
//       this.metricsBase = new Metrics.MetricsBase("bukkit", serverUUID, serviceId, true, this::appendPlatformData, this::appendServiceData, (submitDataTask) -> {
//          Bukkit.getScheduler().runTask(plugin, submitDataTask);
//       }, plugin::isEnabled, (message, error) -> {
//          this.plugin.getLogger().log(Level.WARNING, message, error);
//       }, (message) -> {
//          this.plugin.getLogger().log(Level.INFO, message);
//       }, logErrors, logSentData, logResponseStatusText);
//    }
//
//    public void addCustomChart(CustomChart chart) {
//       this.metricsBase.addCustomChart(chart);
//    }
//
//    private void appendPlatformData(JsonObjectBuilder builder) {
//       builder.appendField("playerAmount", this.getPlayerAmount());
//       builder.appendField("onlineMode", Bukkit.getOnlineMode() ? 1 : 0);
//       builder.appendField("bukkitVersion", Bukkit.getVersion());
//       builder.appendField("bukkitName", Bukkit.getName());
//       builder.appendField("javaVersion", System.getProperty("java.version"));
//       builder.appendField("osName", System.getProperty("os.name"));
//       builder.appendField("osArch", System.getProperty("os.arch"));
//       builder.appendField("osVersion", System.getProperty("os.version"));
//       builder.appendField("coreCount", Runtime.getRuntime().availableProcessors());
//    }
//
//    private void appendServiceData(JsonObjectBuilder builder) {
//       builder.appendField("pluginVersion", this.plugin.getDescription().getVersion());
//    }
//
//    private int getPlayerAmount() {
//       try {
//          Method onlinePlayersMethod = Class.forName("org.bukkit.Server").getMethod("getOnlinePlayers");
//          return onlinePlayersMethod.getReturnType().equals(Collection.class) ? ((Collection)onlinePlayersMethod.invoke(Bukkit.getServer())).size() : ((Player[])((Player[])onlinePlayersMethod.invoke(Bukkit.getServer()))).length;
//       } catch (Exception var2) {
//          return Bukkit.getOnlinePlayers().size();
//       }
//    }
//
//    public static class MetricsBase {
//       public static final String METRICS_VERSION = "2.2.1";
//       private static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1, (task) -> {
//          return new Thread(task, "bStats-Metrics");
//       });
//       private static final String REPORT_URL = "https://bStats.org/api/v2/data/%s";
//       private final String platform;
//       private final String serverUuid;
//       private final int serviceId;
//       private final Consumer appendPlatformDataConsumer;
//       private final Consumer appendServiceDataConsumer;
//       private final Consumer submitTaskConsumer;
//       private final Supplier checkServiceEnabledSupplier;
//       private final BiConsumer errorLogger;
//       private final Consumer infoLogger;
//       private final boolean logErrors;
//       private final boolean logSentData;
//       private final boolean logResponseStatusText;
//       private final Set customCharts = new HashSet();
//       private final boolean enabled;
//
//       public MetricsBase(String platform, String serverUuid, int serviceId, boolean enabled, Consumer appendPlatformDataConsumer, Consumer appendServiceDataConsumer, Consumer submitTaskConsumer, Supplier checkServiceEnabledSupplier, BiConsumer errorLogger, Consumer infoLogger, boolean logErrors, boolean logSentData, boolean logResponseStatusText) {
//          this.platform = platform;
//          this.serverUuid = serverUuid;
//          this.serviceId = serviceId;
//          this.enabled = enabled;
//          this.appendPlatformDataConsumer = appendPlatformDataConsumer;
//          this.appendServiceDataConsumer = appendServiceDataConsumer;
//          this.submitTaskConsumer = submitTaskConsumer;
//          this.checkServiceEnabledSupplier = checkServiceEnabledSupplier;
//          this.errorLogger = errorLogger;
//          this.infoLogger = infoLogger;
//          this.logErrors = logErrors;
//          this.logSentData = logSentData;
//          this.logResponseStatusText = logResponseStatusText;
//          this.checkRelocation();
//          if (enabled) {
//             this.startSubmitting();
//          }
//
//       }
//
//       public void addCustomChart(CustomChart chart) {
//          this.customCharts.add(chart);
//       }
//
//       private void startSubmitting() {
//          Runnable submitTask = () -> {
//             if (this.enabled && (Boolean)this.checkServiceEnabledSupplier.get()) {
//                if (this.submitTaskConsumer != null) {
//                   this.submitTaskConsumer.accept(this::submitData);
//                } else {
//                   this.submitData();
//                }
//
//             } else {
//                scheduler.shutdown();
//             }
//          };
//          long initialDelay = (long)(60000.0D * (3.0D + Math.random() * 3.0D));
//          long secondDelay = (long)(60000.0D * Math.random() * 30.0D);
//          scheduler.schedule(submitTask, initialDelay, TimeUnit.MILLISECONDS);
//          scheduler.scheduleAtFixedRate(submitTask, initialDelay + secondDelay, 1800000L, TimeUnit.MILLISECONDS);
//       }
//
//       private void submitData() {
//          JsonObjectBuilder baseJsonBuilder = new JsonObjectBuilder();
//          this.appendPlatformDataConsumer.accept(baseJsonBuilder);
//          JsonObjectBuilder serviceJsonBuilder = new JsonObjectBuilder();
//          this.appendServiceDataConsumer.accept(serviceJsonBuilder);
//          JsonObjectBuilder.JsonObject[] chartData = (JsonObjectBuilder.JsonObject[])this.customCharts.stream().map((customChart) -> {
//             return customChart.getRequestJsonObject(this.errorLogger, this.logErrors);
//          }).filter(Objects::nonNull).toArray((x$0) -> {
//             return new JsonObjectBuilder.JsonObject[x$0];
//          });
//          serviceJsonBuilder.appendField("id", this.serviceId);
//          serviceJsonBuilder.appendField("customCharts", chartData);
//          baseJsonBuilder.appendField("service", serviceJsonBuilder.build());
//          baseJsonBuilder.appendField("serverUUID", this.serverUuid);
//          baseJsonBuilder.appendField("metricsVersion", "2.2.1");
//          JsonObjectBuilder.JsonObject data = baseJsonBuilder.build();
//          scheduler.execute(() -> {
//             try {
//                this.sendData(data);
//             } catch (Exception var3) {
//                if (this.logErrors) {
//                   this.errorLogger.accept("Could not submit bStats metrics data", var3);
//                }
//             }
//
//          });
//       }
//
//       private void sendData(JsonObjectBuilder.JsonObject data) throws Exception {
//          if (this.logSentData) {
//             this.infoLogger.accept("Sent bStats metrics data: " + data.toString());
//          }
//
//          String url = String.format("https://bStats.org/api/v2/data/%s", this.platform);
//          HttpsURLConnection connection = (HttpsURLConnection)(new URL(url)).openConnection();
//          byte[] compressedData = compress(data.toString());
//          connection.setRequestMethod("POST");
//          connection.addRequestProperty("Accept", "application/json");
//          connection.addRequestProperty("Connection", "close");
//          connection.addRequestProperty("Content-Encoding", "gzip");
//          connection.addRequestProperty("Content-Length", String.valueOf(compressedData.length));
//          connection.setRequestProperty("Content-Type", "application/json");
//          connection.setRequestProperty("User-Agent", "Metrics-Service/1");
//          connection.setDoOutput(true);
//          DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
//          Throwable var6 = null;
//
//          try {
//             outputStream.write(compressedData);
//          } catch (Throwable var29) {
//             var6 = var29;
//             throw var29;
//          } finally {
//             if (outputStream != null) {
//                if (var6 != null) {
//                   try {
//                      outputStream.close();
//                   } catch (Throwable var28) {
//                      var6.addSuppressed(var28);
//                   }
//                } else {
//                   outputStream.close();
//                }
//             }
//
//          }
//
//          StringBuilder builder = new StringBuilder();
//          BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//          Throwable var7 = null;
//
//          try {
//             String line;
//             try {
//                while((line = bufferedReader.readLine()) != null) {
//                   builder.append(line);
//                }
//             } catch (Throwable var31) {
//                var7 = var31;
//                throw var31;
//             }
//          } finally {
//             if (bufferedReader != null) {
//                if (var7 != null) {
//                   try {
//                      bufferedReader.close();
//                   } catch (Throwable var27) {
//                      var7.addSuppressed(var27);
//                   }
//                } else {
//                   bufferedReader.close();
//                }
//             }
//
//          }
//
//          if (this.logResponseStatusText) {
//             this.infoLogger.accept("Sent data to bStats and received response: " + builder);
//          }
//
//       }
//
//       private void checkRelocation() {
//          if (System.getProperty("bstats.relocatecheck") == null || !System.getProperty("bstats.relocatecheck").equals("false")) {
//             String defaultPackage = new String(new byte[]{111, 114, 103, 46, 98, 115, 116, 97, 116, 115});
//             String examplePackage = new String(new byte[]{121, 111, 117, 114, 46, 112, 97, 99, 107, 97, 103, 101});
//             if (Metrics.MetricsBase.class.getPackage().getName().startsWith(defaultPackage) || Metrics.MetricsBase.class.getPackage().getName().startsWith(examplePackage)) {
//                throw new IllegalStateException("bStats Metrics class has not been relocated correctly!");
//             }
//          }
//
//       }
//
//       private static byte[] compress(String str) throws IOException {
//          if (str == null) {
//             return null;
//          } else {
//             ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//             GZIPOutputStream gzip = new GZIPOutputStream(outputStream);
//             Throwable var3 = null;
//
//             try {
//                gzip.write(str.getBytes(StandardCharsets.UTF_8));
//             } catch (Throwable var12) {
//                var3 = var12;
//                throw var12;
//             } finally {
//                if (gzip != null) {
//                   if (var3 != null) {
//                      try {
//                         gzip.close();
//                      } catch (Throwable var11) {
//                         var3.addSuppressed(var11);
//                      }
//                   } else {
//                      gzip.close();
//                   }
//                }
//
//             }
//
//             return outputStream.toByteArray();
//          }
//       }
//    }
// }
//
