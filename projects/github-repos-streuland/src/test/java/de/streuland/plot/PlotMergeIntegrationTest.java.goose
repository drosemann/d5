// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeIntegrationTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeIntegrationTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotMergeIntegrationTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot;
//
// import be.seeseemelk.mockbukkit.MockBukkit;
// import be.seeseemelk.mockbukkit.ServerMock;
// import org.junit.jupiter.api.AfterEach;
// import org.junit.jupiter.api.Test;
//
// import java.util.UUID;
//
// import static org.junit.jupiter.api.Assertions.assertTrue;
//
// class PlotMergeIntegrationTest {
//     private ServerMock server;
//
//     @AfterEach
//     void tearDown() {
//         MockBukkit.unmock();
//     }
//
//     @Test
//     void adjacentPlotsCanBeValidatedInMockServerEnvironment() {
//         server = MockBukkit.mock();
//         server.addSimpleWorld("world");
//
//         Plot a = new Plot("world_plot_10", 0, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//         Plot b = new Plot("world_plot_11", 16, 0, 16, UUID.randomUUID(), System.currentTimeMillis(), 64, Plot.PlotState.CLAIMED);
//
//         assertTrue(PlotMergeService.areAdjacent(a, b));
//     }
// }
//
