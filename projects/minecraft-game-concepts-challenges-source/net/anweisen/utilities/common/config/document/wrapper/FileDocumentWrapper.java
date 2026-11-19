package net.anweisen.utilities.common.config.document.wrapper;

import java.io.File;
import java.nio.file.Path;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.FileDocument;

public class FileDocumentWrapper implements WrappedDocument, FileDocument {
   protected final Document document;
   protected final File file;

   public FileDocumentWrapper(@Nonnull File file, @Nonnull Document document) {
      this.file = file;
      this.document = document;
   }

   public Document getWrappedDocument() {
      return this.document;
   }

   @Nonnull
   public File getFile() {
      return this.file;
   }

   @Nonnull
   public Path getPath() {
      return this.file.toPath();
   }

   @Nonnull
   public FileDocument set(@Nonnull String path, @Nullable Object value) {
      return (FileDocument)WrappedDocument.super.set(path, value);
   }

   @Nonnull
   public FileDocument set(@Nonnull Object value) {
      return (FileDocument)WrappedDocument.super.set(value);
   }

   @Nonnull
   public FileDocument clear() {
      return (FileDocument)WrappedDocument.super.clear();
   }

   @Nonnull
   public FileDocument remove(@Nonnull String path) {
      return (FileDocument)WrappedDocument.super.remove(path);
   }
}
