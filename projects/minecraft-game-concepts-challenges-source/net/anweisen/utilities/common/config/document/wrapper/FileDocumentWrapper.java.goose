// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/wrapper/FileDocumentWrapper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/wrapper/FileDocumentWrapper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/wrapper/FileDocumentWrapper.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document.wrapper;
//
// import java.io.File;
// import java.nio.file.Path;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.FileDocument;
//
// public class FileDocumentWrapper implements WrappedDocument, FileDocument {
//    protected final Document document;
//    protected final File file;
//
//    public FileDocumentWrapper(@Nonnull File file, @Nonnull Document document) {
//       this.file = file;
//       this.document = document;
//    }
//
//    public Document getWrappedDocument() {
//       return this.document;
//    }
//
//    @Nonnull
//    public File getFile() {
//       return this.file;
//    }
//
//    @Nonnull
//    public Path getPath() {
//       return this.file.toPath();
//    }
//
//    @Nonnull
//    public FileDocument set(@Nonnull String path, @Nullable Object value) {
//       return (FileDocument)WrappedDocument.super.set(path, value);
//    }
//
//    @Nonnull
//    public FileDocument set(@Nonnull Object value) {
//       return (FileDocument)WrappedDocument.super.set(value);
//    }
//
//    @Nonnull
//    public FileDocument clear() {
//       return (FileDocument)WrappedDocument.super.clear();
//    }
//
//    @Nonnull
//    public FileDocument remove(@Nonnull String path) {
//       return (FileDocument)WrappedDocument.super.remove(path);
//    }
// }
//
