package net.anweisen.utilities.common.misc;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.font.TextLayout;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.imageio.ImageIO;
import net.anweisen.utilities.common.collection.IOUtils;

public final class ImageUtils {
   private ImageUtils() {
   }

   public static int addCenteredText(@Nonnull Graphics2D graphics, @Nonnull String text, int height) {
      TextLayout layout = getTextLayout(graphics, text);
      int lineWidth = (int)layout.getBounds().getWidth();
      graphics.drawString(text, graphics.getDeviceConfiguration().getBounds().width / 2 - lineWidth / 2, height);
      return lineWidth;
   }

   public static int addText(@Nonnull Graphics2D graphics, @Nonnull String text, int height, int x) {
      TextLayout layout = getTextLayout(graphics, text);
      graphics.drawString(text, x, height);
      return (int)((double)x + layout.getBounds().getWidth());
   }

   public static int addTextEndingAt(@Nonnull Graphics2D graphics, @Nonnull String text, int height, int endX) {
      TextLayout layout = getTextLayout(graphics, text);
      int position = (int)((double)endX - layout.getBounds().getWidth());
      graphics.drawString(text, position, height);
      return position;
   }

   public static void addTextEndingAtMid(@Nonnull Graphics2D graphics, @Nonnull String text, int height) {
      TextLayout layout = getTextLayout(graphics, text);
      int lineWidth = (int)layout.getBounds().getWidth();
      graphics.drawString(text, graphics.getClipBounds().width / 2 - lineWidth, height);
   }

   public static BufferedImage loadUrl(@Nonnull String url) throws IOException {
      URLConnection connection = IOUtils.createConnection(url);
      return ImageIO.read(connection.getInputStream());
   }

   public static BufferedImage loadResource(@Nonnull String path) throws IOException {
      InputStream stream = ImageUtils.class.getClassLoader().getResourceAsStream(path);
      return ImageIO.read(stream);
   }

   public static BufferedImage loadFile(@Nonnull File file) throws IOException {
      return ImageIO.read(file);
   }

   @Nonnull
   public static TextLayout getTextLayout(@Nonnull Graphics2D graphics, @Nonnull String text) {
      return new TextLayout(text, graphics.getFont(), graphics.getFontRenderContext());
   }

   public static void darkenImage(@Nonnull BufferedImage image) {
      for(int i = 0; i < image.getWidth(); ++i) {
         for(int j = 0; j < image.getHeight(); ++j) {
            image.setRGB(i, j, (new Color(image.getRGB(i, j))).darker().getRGB());
         }
      }

   }

   @Nonnull
   @CheckReturnValue
   public static BufferedImage replaceTransparency(@Nonnull BufferedImage image, @Nullable Color replacementColor) {
      if (replacementColor == null) {
         replacementColor = new Color(0, 0, 0, 0);
      }

      BufferedImage created = new BufferedImage(image.getWidth(), image.getHeight(), 2);
      Graphics2D graphics = created.createGraphics();
      graphics.setColor(replacementColor);
      graphics.fillRect(0, 0, image.getWidth(), image.getHeight());
      graphics.drawImage(image, 0, 0, image.getWidth(), image.getHeight(), (ImageObserver)null);
      graphics.dispose();
      return created;
   }
}
