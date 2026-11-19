// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/PlotStoragePartitioner.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/PlotStoragePartitioner.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/PlotStoragePartitioner.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot;
//
// import org.bukkit.plugin.java.JavaPlugin;
//
// import java.io.File;
//
// public class PlotStoragePartitioner {
//     private final File rootFolder;
//
//     public PlotStoragePartitioner(JavaPlugin plugin) {
//         this.rootFolder = new File(plugin.getDataFolder(), "plots");
//         if (!rootFolder.exists()) {
//             rootFolder.mkdirs();
//         }
//     }
//
//     public File resolveWorldFolder(String worldName) {
//         File worldFolder = new File(rootFolder, sanitize(worldName));
//         if (!worldFolder.exists()) {
//             worldFolder.mkdirs();
//         }
//         return worldFolder;
//     }
//
//     private String sanitize(String value) {
//         return value == null ? "world_main" : value.toLowerCase().replaceAll("[^a-z0-9_\\-]", "_");
//     }
// }
//
