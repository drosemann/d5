// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeService.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeService.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/upgrade/PlotUpgradeService.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.upgrade;
//
// import java.util.List;
// import java.util.Optional;
// import java.util.UUID;
//
// public interface PlotUpgradeService {
//     Optional<PlotProgressionState> getState(String plotId);
//     List<PlotUpgradeView> getAvailableUpgrades(String plotId, UUID playerId);
//     boolean canUpgrade(String plotId, UUID playerId, String upgradeId);
//     boolean applyUpgrade(String plotId, UUID playerId, String upgradeId);
//     boolean canPrestige(String plotId, UUID playerId);
//     boolean prestige(String plotId, UUID playerId);
//     PlotExperienceResult grantExperience(String plotId, UUID playerId, String source, int suggestedAmount);
// }
//
