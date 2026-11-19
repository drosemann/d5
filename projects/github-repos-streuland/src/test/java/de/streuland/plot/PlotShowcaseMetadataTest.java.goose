// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotShowcaseMetadataTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotShowcaseMetadataTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/plot/PlotShowcaseMetadataTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot;
//
// import org.junit.jupiter.api.Test;
//
// import java.util.Arrays;
// import java.util.LinkedHashSet;
// import java.util.UUID;
//
// import static org.junit.jupiter.api.Assertions.*;
//
// class PlotShowcaseMetadataTest {
//
//     @Test
//     void showcaseTagsAndTextAreNormalized() {
//         PlotData data = new PlotData();
//
//         data.setShowcaseTitle("  My   Cozy Plot  ");
//         data.setShowcaseDescription("  A   nice   place to visit. ");
//         data.setShowcaseTags(new LinkedHashSet<>(Arrays.asList(" Nature Build ", "Café", "nature build")));
//
//         assertEquals("My Cozy Plot", data.getShowcaseTitle());
//         assertEquals("A nice place to visit.", data.getShowcaseDescription());
//         assertTrue(data.getShowcaseTags().contains("nature-build"));
//         assertTrue(data.getShowcaseTags().contains("caf"));
//     }
//
//     @Test
//     void trustedCompatibilityStillMapsToBuilderPermissions() {
//         UUID owner = UUID.randomUUID();
//         UUID trusted = UUID.randomUUID();
//         Plot plot = new Plot("plot_compat", 0, 0, 64, owner, 1L, 70, Plot.PlotState.CLAIMED);
//
//         plot.addTrusted(trusted);
//
//         assertTrue(plot.getTrustedPlayers().contains(trusted));
//         assertTrue(plot.isAllowed(trusted, Permission.BUILD));
//         assertFalse(plot.isAllowed(UUID.randomUUID(), Permission.BUILD));
//     }
// }
//
