// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotStorageBackedUpgradeStorage.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotStorageBackedUpgradeStorage.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotStorageBackedUpgradeStorage.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// import de.streuland.plot.PlotData;
// import de.streuland.plot.PlotStorage;
//
// import java.util.Optional;
//
// public class PlotStorageBackedUpgradeStorage implements PlotUpgradeStorage {
//     private final PlotStorage plotStorage;
//
//     public PlotStorageBackedUpgradeStorage(PlotStorage plotStorage) {
//         this.plotStorage = plotStorage;
//     }
//
//     @Override
//     public Optional<PlotProgressionState> load(String plotId) {
//         PlotData data = plotStorage.getPlotData(plotId);
//         return Optional.ofNullable(data == null ? PlotProgressionState.initial() : data.getProgressionState());
//     }
//
//     @Override
//     public void save(String plotId, PlotProgressionState state) {
//         PlotData data = plotStorage.getPlotData(plotId);
//         data.setProgressionState(state);
//         plotStorage.savePlotData(plotId, data);
//     }
//
//     public void applyLevelReward(String plotId, PlotLevelReward reward) {
//         if (reward == null) {
//             return;
//         }
//         PlotData data = plotStorage.getPlotData(plotId);
//         data.setBonusStorageSlots(data.getBonusStorageSlots() + reward.getStorageSlots());
//         data.getUnlockedAbilities().addAll(reward.getUnlockedAbilities());
//         data.getCosmeticInventory().addAll(reward.getCosmetics());
//         reward.getStatBonuses().forEach((key, value) ->
//                 data.getStatBonuses().merge(key, value, Double::sum));
//         plotStorage.savePlotData(plotId, data);
//     }
// }
//
