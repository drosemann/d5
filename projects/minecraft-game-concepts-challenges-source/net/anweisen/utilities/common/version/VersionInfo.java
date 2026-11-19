package net.anweisen.utilities.common.version;

import java.util.Objects;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;

public class VersionInfo implements Version {
   protected static final ILogger logger = ILogger.forThisClass();
   private final int major;
   private final int minor;
   private final int revision;

   public VersionInfo() {
      this(1, 0, 0);
   }

   public VersionInfo(int major, int minor, int revision) {
      this.major = major;
      this.minor = minor;
      this.revision = revision;
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

   public boolean equals(Object other) {
      if (this == other) {
         return true;
      } else {
         return !(other instanceof Version) ? false : this.equals((Version)other);
      }
   }

   public int hashCode() {
      return Objects.hash(new Object[]{this.major, this.minor, this.revision});
   }

   public String toString() {
      return this.format();
   }

   public static Version parseExceptionally(@Nullable String input) {
      if (input == null) {
         throw new IllegalArgumentException("Version cannot be null");
      } else {
         String[] array = input.split("\\.");
         if (array.length == 0) {
            throw new IllegalArgumentException("Version cannot be empty");
         } else {
            try {
               int major = Integer.parseInt(array[0]);
               int minor = array.length >= 2 ? Integer.parseInt(array[1]) : 0;
               int revision = array.length >= 3 ? Integer.parseInt(array[2]) : 0;
               return new VersionInfo(major, minor, revision);
            } catch (Exception var5) {
               throw new IllegalArgumentException("Cannot parse Version: " + input + " (" + var5.getMessage() + ")");
            }
         }
      }
   }

   public static Version parse(@Nullable String input, Version def) {
      try {
         return parseExceptionally(input);
      } catch (Exception var3) {
         logger.error("Could not parse version for input {}", var3.getMessage());
         return def;
      }
   }
}
