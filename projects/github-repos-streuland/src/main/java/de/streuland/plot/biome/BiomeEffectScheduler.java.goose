// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffectScheduler.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffectScheduler.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/biome/BiomeEffectScheduler.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.biome;
//
// import de.streuland.plot.Plot;
// import de.streuland.plot.PlotManager;
// import org.bukkit.block.Biome;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
// import org.bukkit.scheduler.BukkitTask;
//
// public class BiomeEffectScheduler {
//     private final JavaPlugin plugin;
//     private final PlotManager plotManager;
//     private final BiomeBonusService biomeBonusService;
//     private BukkitTask task;
//
//     public BiomeEffectScheduler(JavaPlugin plugin, PlotManager plotManager, BiomeBonusService biomeBonusService) {
//         this.plugin = plugin;
//         this.plotManager = plotManager;
//         this.biomeBonusService = biomeBonusService;
//     }
//
//     public void start() {
//         stop();
//         task = plugin.getServer().getScheduler().runTaskTimer(plugin, this::tick, 100L, 100L);
//     }
//
//     public void stop() {
//         if (task != null) {
//             task.cancel();
//             task = null;
//         }
//     }
//
//     private void tick() {
//         for (Player player : plotManager.getWorld().getPlayers()) {
//             Plot plot = plotManager.getPlotAt(player.getLocation().getBlockX(), player.getLocation().getBlockZ());
//             if (plot == null) {
//                 continue;
//             }
//             Biome biome = player.getLocation().getBlock().getBiome();
//             BiomeRuleSet rules = biomeBonusService.getRuleSetForBiome(biome);
//             if (rules.isGrantsNightVision()) {
//                 player.addPotionEffect(new PotionEffect(PotionEffectType.NIGHT_VISION, 160, 0, true, false, true));
//             }
//             if (rules.isGrantsHeatResistanceOnSpawn()) {
//                 player.addPotionEffect(new PotionEffect(PotionEffectType.FIRE_RESISTANCE, 160, 0, true, false, true));
//             }
//             if (biome.name().contains("JUNGLE")) {
//                 plotManager.getWorld().setStorm(true);
//             }
//         }
//     }
// }
//
