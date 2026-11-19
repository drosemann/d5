package net.anweisen.utilities.common.collection;

import java.io.PrintWriter;
import javax.annotation.Nonnull;

public class StringBuilderPrintWriter extends PrintWriter {
   protected final StringBuilderWriter writer;

   public StringBuilderPrintWriter() {
      super(new StringBuilderWriter());
      this.writer = (StringBuilderWriter)this.out;
   }

   @Nonnull
   public StringBuilder getBuilder() {
      return this.writer.getBuilder();
   }

   public String toString() {
      return this.getBuilder().toString();
   }
}
