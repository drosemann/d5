package net.anweisen.utilities.common.collection;

import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.GraphicsEnvironment;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;

public class FontBuilder {
   private Font font;

   public FontBuilder(@Nonnull File file) throws IOException, FontFormatException {
      this((File)file, 0);
   }

   public FontBuilder(@Nonnull File file, int type) throws IOException, FontFormatException {
      this.font = Font.createFont(type, file);
   }

   public FontBuilder(@Nonnull String resource) throws IOException, FontFormatException {
      this((String)resource, 0);
   }

   public FontBuilder(@Nonnull String resource, int type) throws IOException, FontFormatException {
      this.font = Font.createFont(type, (InputStream)Objects.requireNonNull(this.getClass().getClassLoader().getResourceAsStream(resource)));
   }

   @Nonnull
   @CheckReturnValue
   public FontBuilder bold() {
      return this.style(1);
   }

   @Nonnull
   @CheckReturnValue
   public FontBuilder italic() {
      return this.style(2);
   }

   @Nonnull
   @CheckReturnValue
   public FontBuilder style(int style) {
      this.font = this.font.deriveFont(style);
      return this;
   }

   @Nonnull
   @CheckReturnValue
   public FontBuilder size(float size) {
      this.font = this.font.deriveFont(size);
      return this;
   }

   @Nonnull
   @CheckReturnValue
   public FontBuilder derive(int style, float size) {
      this.font = this.font.deriveFont(style, size);
      return this;
   }

   @Nonnull
   public Font build() {
      registerFont(this.font);
      return this.font;
   }

   public static void registerFont(@Nonnull Font font) {
      GraphicsEnvironment.getLocalGraphicsEnvironment().registerFont(font);
   }

   @Nonnull
   @CheckReturnValue
   public static FontBuilder fromFile(@Nonnull String filename) {
      try {
         return new FontBuilder(new File(filename));
      } catch (Exception var2) {
         throw new WrappedException(var2);
      }
   }

   @Nonnull
   @CheckReturnValue
   public static FontBuilder fromResource(@Nonnull String resource) {
      try {
         return new FontBuilder(resource);
      } catch (Exception var2) {
         throw new WrappedException(var2);
      }
   }
}
