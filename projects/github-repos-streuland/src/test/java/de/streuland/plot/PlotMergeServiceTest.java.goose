// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeServiceTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeServiceTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeServiceTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot;
//
// import org.junit.jupiter.api.Test;
//
// import java.util.UUID;
//
// import static org.junit.jupiter.api.Assertions.*;
//
// class PlotMergeServiceTest {
//
//     @Test
//     void adjacentPlotsAreDetectedHorizontally() {
//         Plot a = new Plot("world_plot_1", 0, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//         Plot b = new Plot("world_plot_2", 16, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//
//         assertTrue(PlotMergeService.areAdjacent(a, b));
//     }
//
//     @Test
//     void diagonalPlotsAreNotAdjacent() {
//         Plot a = new Plot("world_plot_1", 0, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//         Plot b = new Plot("world_plot_2", 16, 16, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//
//         assertFalse(PlotMergeService.areAdjacent(a, b));
//     }
//
//     @Test
//     void mergeBoundsContainBothPlots() {
//         Plot a = new Plot("world_plot_1", 0, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//         Plot b = new Plot("world_plot_2", 16, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//
//         PlotMergeService.Bounds bounds = PlotMergeService.mergeBounds(a, b);
//         assertEquals(-8, bounds.minX);
//         assertEquals(24, bounds.maxX);
//         assertEquals(-8, bounds.minZ);
//         assertEquals(8, bounds.maxZ);
//     }
// }
//
