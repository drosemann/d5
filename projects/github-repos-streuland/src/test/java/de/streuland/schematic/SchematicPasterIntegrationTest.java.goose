// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/schematic/SchematicPasterIntegrationTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/schematic/SchematicPasterIntegrationTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/schematic/SchematicPasterIntegrationTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.schematic;
//
// import be.seeseemelk.mockbukkit.MockBukkit;
// import be.seeseemelk.mockbukkit.ServerMock;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.junit.jupiter.api.AfterEach;
// import org.junit.jupiter.api.Assertions;
// import org.junit.jupiter.api.BeforeEach;
// import org.junit.jupiter.api.Test;
//
// import java.util.Arrays;
// import java.util.UUID;
// import java.util.concurrent.CompletableFuture;
//
// class SchematicPasterIntegrationTest {
//     private ServerMock server;
//     private JavaPlugin plugin;
//
//     @BeforeEach
//     void setUp() {
//         server = MockBukkit.mock();
//         plugin = MockBukkit.createMockPlugin();
//     }
//
//     @AfterEach
//     void tearDown() {
//         MockBukkit.unmock();
//     }
//
//     @Test
//     void pasteFailureRollsBackWorldState() {
//         World world = server.addSimpleWorld("world");
//         UUID actorId = UUID.randomUUID();
//         Location center = new Location(world, 10, 64, 10);
//
//         world.getBlockAt(10, 64, 10).setType(Material.DIRT);
//         world.getBlockAt(11, 64, 10).setType(Material.DIRT);
//         world.getBlockAt(12, 64, 10).setType(Material.DIRT);
//
//         Schematic schematic = new Schematic("small", Arrays.asList(
//                 new Schematic.SchematicBlock(0, 0, 0, Material.STONE),
//                 new Schematic.SchematicBlock(1, 0, 0, Material.OAK_PLANKS),
//                 new Schematic.SchematicBlock(2, 0, 0, Material.GLASS)
//         ));
//
//         SchematicPaster paster = new SchematicPaster(plugin);
//         paster.setFailureAfterBlocksForTest(2);
//
//         CompletableFuture<Boolean> result = paster.pasteAsync(schematic, center, actorId);
//         for (int i = 0; i < 10 && !result.isDone(); i++) {
//             server.getScheduler().performOneTick();
//         }
//
//         Assertions.assertTrue(result.isDone(), "Paste future should complete");
//         Assertions.assertFalse(result.join(), "Paste should fail due to simulated exception");
//
//         Assertions.assertEquals(Material.DIRT, world.getBlockAt(10, 64, 10).getType());
//         Assertions.assertEquals(Material.DIRT, world.getBlockAt(11, 64, 10).getType());
//         Assertions.assertEquals(Material.DIRT, world.getBlockAt(12, 64, 10).getType());
//     }
// }
//
