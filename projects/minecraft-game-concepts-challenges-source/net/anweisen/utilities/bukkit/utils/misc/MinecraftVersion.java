package net.anweisen.utilities.bukkit.utils.misc;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.version.Version;
import org.bukkit.Bukkit;

public enum MinecraftVersion implements Version {
   V1_0,
   V1_1,
   V1_2_1,
   V1_3_1,
   V1_4_2,
   V1_5,
   V1_6,
   V1_7,
   V1_7_2,
   V1_8,
   V1_9,
   V1_10,
   V1_11,
   V1_12,
   V1_13,
   V1_14,
   V1_15,
   V1_16,
   V1_16_5,
   V1_17,
   V1_18,
   V1_19,
   V1_20,
   V1_20_5,
   V1_21;

   private final int major;
   private final int minor;
   private final int revision;
   private static Version currentExact;
   private static MinecraftVersion current;

   private MinecraftVersion() {
      String name = this.name().substring(1);
      String[] version = name.split("_");
      if (version.length != 2 && version.length != 3) {
         throw new IllegalArgumentException("Name '" + this.name() + "' does not match pattern: V{major}_{minor}_[revision]");
      } else {
         this.major = Integer.parseInt(version[0]);
         this.minor = Integer.parseInt(version[1]);
         this.revision = version.length > 2 ? Integer.parseInt(version[2]) : 0;
      }
   }

   public int getMajor() {
      return this.major;
   }

   public int getMinor() {
      return this.minor;
   }

   public int getRevision() {
      return this.revision;
   }

   public String toString() {
      return this.format();
   }

   @Nonnull
   @CheckReturnValue
   public static Version parseExact(@Nonnull String bukkitVersion) {
      bukkitVersion = bukkitVersion.substring(0, bukkitVersion.indexOf("-"));
      return Version.parse(bukkitVersion);
   }

   @Nonnull
   @CheckReturnValue
   public static MinecraftVersion findNearest(@Nonnull Version realVersion) {
      return (MinecraftVersion)Version.findNearest(realVersion, values());
   }

   @Nonnull
   @CheckReturnValue
   public static Version currentExact() {
      if (currentExact == null) {
         currentExact = parseExact(Bukkit.getBukkitVersion());
      }

      return currentExact;
   }

   @Nonnull
   @CheckReturnValue
   public static MinecraftVersion current() {
      if (current == null) {
         current = findNearest(currentExact());
      }

      return current;
   }
}
