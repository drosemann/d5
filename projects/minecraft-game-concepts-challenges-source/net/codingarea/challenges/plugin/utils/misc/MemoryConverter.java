package net.codingarea.challenges.plugin.utils.misc;

public class MemoryConverter {
   private static final long GIGABYTE = 1073741824L;

   public static int getGB(long bytes) {
      return (int)(bytes / 1073741824L);
   }
}
