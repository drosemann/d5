package net.anweisen.utilities.common.collection;

import java.awt.Color;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;

public final class Colors {
   public static final Color ONLINE = Color.decode("#40AC7B");
   public static final Color DO_NOT_DISTURB = Color.decode("#E84444");
   public static final Color IDLE = Color.decode("#F09F19");
   public static final Color OFFLINE = Color.decode("#747F8D");
   public static final Color STREAMING = Color.decode("#573591");
   public static final Color EMBED = Color.decode("#2F3136");
   public static final Color NO_RANK = Color.decode("#CCD8DE");
   public static final Color LIGHT_BLACK = Color.decode("#1c1c1c");

   private Colors() {
   }

   @Nonnull
   @CheckReturnValue
   public static String asHex(@Nonnull Color color) {
      String red = Integer.toHexString(color.getRed());
      String green = Integer.toHexString(color.getGreen());
      String blue = Integer.toHexString(color.getBlue());
      return "#" + (red.length() == 1 ? "0" + red : red) + (green.length() == 1 ? "0" + green : green) + (blue.length() == 1 ? "0" + blue : blue);
   }
}
