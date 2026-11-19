// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/SnapshotMeta.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/SnapshotMeta.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/plot/snapshot/SnapshotMeta.java), unveraendert, als Inline-Doku ----
// package de.streuland.plot.snapshot;
//
// import java.util.UUID;
//
// public class SnapshotMeta {
//     private final String id;
//     private final long createdAt;
//     private final UUID creator;
//     private final String authorName;
//     private final String note;
//
//     public SnapshotMeta(String id, long createdAt, UUID creator) {
//         this(id, createdAt, creator, null, null);
//     }
//
//     public SnapshotMeta(String id, long createdAt, UUID creator, String authorName, String note) {
//         this.id = id;
//         this.createdAt = createdAt;
//         this.creator = creator;
//         this.authorName = authorName;
//         this.note = note;
//     }
//
//     public String getId() {
//         return id;
//     }
//
//     public long getCreatedAt() {
//         return createdAt;
//     }
//
//     public UUID getCreator() {
//         return creator;
//     }
//
//     public String getAuthorName() {
//         return authorName;
//     }
//
//     public String getNote() {
//         return note;
//     }
// }
//
