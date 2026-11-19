package net.anweisen.utilities.common.config.document.readonly;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.document.wrapper.WrappedDocument;

public final class ReadOnlyDocumentWrapper implements WrappedDocument {
   private final Document document;

   public ReadOnlyDocumentWrapper(@Nonnull Document document) {
      this.document = document;
   }

   public Document getWrappedDocument() {
      return this.document;
   }

   public boolean isReadonly() {
      return true;
   }
}
