// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/PlotSnapshot.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/PlotSnapshot.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/PlotSnapshot.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.snapshot;
//
// import java.util.Collections;
// import java.util.List;
// import java.util.UUID;
//
// public class PlotSnapshot {
//     private final String id;
//     private final String plotId;
//     private final UUID creator;
//     private final long createdAt;
//     private final List<BlockSnapshot> blocks;
//     private final PlotSnapshotMetadata metadata;
//
//     public PlotSnapshot(String id, String plotId, UUID creator, long createdAt, List<BlockSnapshot> blocks) {
//         this(id, plotId, creator, createdAt, blocks, null);
//     }
//
//     public PlotSnapshot(String id, String plotId, UUID creator, long createdAt, List<BlockSnapshot> blocks,
//                         PlotSnapshotMetadata metadata) {
//         this.id = id;
//         this.plotId = plotId;
//         this.creator = creator;
//         this.createdAt = createdAt;
//         this.blocks = blocks;
//         this.metadata = metadata;
//     }
//
//     public String getId() {
//         return id;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public UUID getCreator() {
//         return creator;
//     }
//
//     public long getCreatedAt() {
//         return createdAt;
//     }
//
//     public List<BlockSnapshot> getBlocks() {
//         return Collections.unmodifiableList(blocks);
//     }
//
//     public PlotSnapshotMetadata getMetadata() {
//         return metadata;
//     }
// }
//
