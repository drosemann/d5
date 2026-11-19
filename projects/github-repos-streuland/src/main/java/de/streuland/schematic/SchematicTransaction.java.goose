// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/schematic/SchematicTransaction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/schematic/SchematicTransaction.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/schematic/SchematicTransaction.java), unveraendert, als Inline-Doku ----
// package de.streuland.schematic;
//
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.block.data.BlockData;
// import org.bukkit.plugin.java.JavaPlugin;
//
// import java.io.File;
// import java.io.IOException;
// import java.nio.charset.StandardCharsets;
// import java.nio.file.Files;
// import java.text.SimpleDateFormat;
// import java.util.ArrayList;
// import java.util.Date;
// import java.util.List;
// import java.util.UUID;
//
// class SchematicTransaction {
//     private final JavaPlugin plugin;
//     private final UUID actor;
//     private final String templateName;
//     private final List<BlockStateSnapshot> snapshots = new ArrayList<>();
//
//     SchematicTransaction(JavaPlugin plugin, UUID actor, String templateName) {
//         this.plugin = plugin;
//         this.actor = actor;
//         this.templateName = templateName;
//     }
//
//     void capture(Block block) {
//         snapshots.add(new BlockStateSnapshot(block.getLocation(), block.getType(), block.getBlockData()));
//     }
//
//     void rollback() {
//         for (int i = snapshots.size() - 1; i >= 0; i--) {
//             BlockStateSnapshot snapshot = snapshots.get(i);
//             Block block = snapshot.location.getBlock();
//             block.setType(snapshot.type, false);
//             block.setBlockData(snapshot.blockData, false);
//         }
//     }
//
//     void writeLog(boolean success, String message) {
//         File transactionDir = new File(plugin.getDataFolder(), "transactions");
//         if (!transactionDir.exists()) {
//             transactionDir.mkdirs();
//         }
//         String timestamp = new SimpleDateFormat("yyyyMMdd-HHmmss").format(new Date());
//         File out = new File(transactionDir, timestamp + "-" + templateName + "-" + actor + ".log");
//         StringBuilder sb = new StringBuilder();
//         sb.append("success=").append(success).append('\n');
//         sb.append("actor=").append(actor).append('\n');
//         sb.append("template=").append(templateName).append('\n');
//         sb.append("capturedBlocks=").append(snapshots.size()).append('\n');
//         sb.append("message=").append(message).append('\n');
//         try {
//             Files.write(out.toPath(), sb.toString().getBytes(StandardCharsets.UTF_8));
//         } catch (IOException e) {
//             plugin.getLogger().warning("Konnte Transaktions-Log nicht schreiben: " + e.getMessage());
//         }
//     }
//
//     private static class BlockStateSnapshot {
//         private final Location location;
//         private final Material type;
//         private final BlockData blockData;
//
//         private BlockStateSnapshot(Location location, Material type, BlockData blockData) {
//             this.location = location;
//             this.type = type;
//             this.blockData = blockData;
//         }
//     }
// }
//
