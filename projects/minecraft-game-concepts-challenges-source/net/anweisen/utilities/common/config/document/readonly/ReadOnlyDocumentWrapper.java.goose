// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/readonly/ReadOnlyDocumentWrapper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/readonly/ReadOnlyDocumentWrapper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/readonly/ReadOnlyDocumentWrapper.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document.readonly;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.document.wrapper.WrappedDocument;
//
// public final class ReadOnlyDocumentWrapper implements WrappedDocument {
//    private final Document document;
//
//    public ReadOnlyDocumentWrapper(@Nonnull Document document) {
//       this.document = document;
//    }
//
//    public Document getWrappedDocument() {
//       return this.document;
//    }
//
//    public boolean isReadonly() {
//       return true;
//    }
// }
//
