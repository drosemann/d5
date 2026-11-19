package net.anweisen.utilities.common.logging;

import java.util.logging.Level;
import javax.annotation.Nonnull;

public enum LogLevel {
   TRACE(0, "TRACE", "trace", Level.FINEST, false),
   DEBUG(2, "DEBUG", "debug", Level.FINER, false),
   EXTENDED(5, "EXTENDED", "extended", Level.FINE, false),
   STATUS(7, "STATUS", "status", Level.CONFIG, false),
   INFO(10, "INFO", "info", Level.INFO, false),
   WARN(15, "WARN", "warn", Level.WARNING, true),
   ERROR(25, "ERROR", "error", Level.SEVERE, true);

   private final String uppercaseName;
   private final String lowercaseName;
   private final Level javaLevel;
   private final int value;
   private final boolean highlighted;

   private LogLevel(int value, @Nonnull String uppercaseName, @Nonnull String lowercaseName, @Nonnull Level javaLevel, boolean highlighted) {
      this.uppercaseName = uppercaseName;
      this.lowercaseName = lowercaseName;
      this.javaLevel = javaLevel;
      this.value = value;
      this.highlighted = highlighted;
   }

   @Nonnull
   public Level getJavaUtilLevel() {
      return this.javaLevel;
   }

   public boolean isShownAtLoggerLevel(@Nonnull LogLevel loggerLevel) {
      return this.getValue() >= loggerLevel.getValue();
   }

   public int getValue() {
      return this.value;
   }

   @Nonnull
   public String getLowerCaseName() {
      return this.lowercaseName;
   }

   @Nonnull
   public String getUpperCaseName() {
      return this.uppercaseName;
   }

   public boolean isHighlighted() {
      return this.highlighted;
   }

   @Nonnull
   public static LogLevel fromJavaLevel(@Nonnull Level level) {
      LogLevel[] var1 = values();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         LogLevel logLevel = var1[var3];
         if (logLevel.getJavaUtilLevel().intValue() == level.intValue()) {
            return logLevel;
         }
      }

      return INFO;
   }

   @Nonnull
   public static LogLevel fromValue(int value) {
      LogLevel[] var1 = values();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         LogLevel level = var1[var3];
         if (level.getValue() == value) {
            return level;
         }
      }

      return INFO;
   }

   @Nonnull
   public static LogLevel fromName(@Nonnull String name) {
      LogLevel[] var1 = values();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         LogLevel level = var1[var3];
         if (level.getUpperCaseName().equalsIgnoreCase(name)) {
            return level;
         }
      }

      return INFO;
   }
}
