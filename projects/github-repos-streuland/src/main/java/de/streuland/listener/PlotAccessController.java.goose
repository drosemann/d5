// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/listener/PlotAccessController.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/listener/PlotAccessController.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/listener/PlotAccessController.java), unveraendert, als Inline-Doku ----
// package de.streuland.listener;
//
// import de.streuland.plot.Permission;
// import de.streuland.plot.Plot;
// import de.streuland.plot.PlotManager;
//
// import java.util.UUID;
//
// public final class PlotAccessController {
//     private final PlotManager plotManager;
//
//     public PlotAccessController(PlotManager plotManager) {
//         this.plotManager = plotManager;
//     }
//
//     public boolean canBuild(Plot plot, UUID playerId) {
//         return plot != null && plotManager.hasPermission(plot, playerId, Permission.BUILD);
//     }
//
//     public boolean canBreak(Plot plot, UUID playerId) {
//         return plot != null && plotManager.hasPermission(plot, playerId, Permission.BREAK);
//     }
//
//     public boolean canInteract(Plot plot, UUID playerId, Permission permission) {
//         return plot != null && plotManager.hasPermission(plot, playerId, permission);
//     }
// }
//
