package net.anweisen.utilities.common.misc;

public final class MathHelper {
   private MathHelper() {
   }

   public static double percentage(double total, double proportion) {
      return proportion == 0.0D ? 0.0D : proportion * 100.0D / total;
   }
}
