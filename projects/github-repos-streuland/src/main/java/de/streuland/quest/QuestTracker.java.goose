// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestTracker.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestTracker.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/quest/QuestTracker.java), unveraendert, als Inline-Doku ----
// package de.streuland.quest;
//
// import de.streuland.district.District;
// import de.streuland.district.DistrictManager;
// import de.streuland.plot.Plot;
// import de.streuland.plot.PlotManager;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.Listener;
// import org.bukkit.event.block.BlockPlaceEvent;
//
// public class QuestTracker implements Listener {
//     private final PlotManager plotManager;
//     private final DistrictManager districtManager;
//     private final QuestService questService;
//
//     public QuestTracker(PlotManager plotManager, DistrictManager districtManager, QuestService questService) {
//         this.plotManager = plotManager;
//         this.districtManager = districtManager;
//         this.questService = questService;
//     }
//
//     @EventHandler
//     public void onBlockPlace(BlockPlaceEvent event) {
//         Plot plot = plotManager.getPlotAt(event.getBlock().getWorld(), event.getBlock().getX(), event.getBlock().getZ());
//         if (plot == null || plot.getOwner() == null || !plot.getOwner().equals(event.getPlayer().getUniqueId())) {
//             return;
//         }
//
//         Material material = event.getBlock().getType();
//         if (material.name().endsWith("_DOOR")) {
//             questService.updateProgress(event.getPlayer(), plot.getPlotId(), QuestService.OBJECTIVE_BUILD_HOUSES, 1);
//         }
//
//         syncDistrictQuest(event.getPlayer(), plot);
//     }
//
//     public void onNeighborAdded(Player player) {
//         Plot plot = plotManager.getPlotAt(player.getWorld(), player.getLocation().getBlockX(), player.getLocation().getBlockZ());
//         if (plot == null || plot.getOwner() == null || !plot.getOwner().equals(player.getUniqueId())) {
//             return;
//         }
//         questService.updateProgress(player, plot.getPlotId(), QuestService.OBJECTIVE_BEFRIEND_PLOTS, 1);
//     }
//
//     public void syncDistrictQuest(Player player, Plot plot) {
//         if (plot == null) {
//             return;
//         }
//         District district = districtManager.getDistrictForPlot(plot);
//         if (district == null) {
//             return;
//         }
//         questService.syncMilestoneProgress(player, plot.getPlotId(), QuestService.OBJECTIVE_DISTRICT_LEVEL, district.getLevel().ordinal() + 1);
//     }
// }
//
