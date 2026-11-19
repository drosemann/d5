package net.anweisen.utilities.common.logging.internal;

import java.util.ResourceBundle;
import java.util.function.Supplier;
import java.util.logging.Filter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.LogLevel;
import net.anweisen.utilities.common.logging.lib.JavaILogger;

public class JavaLoggerWrapper extends JavaILogger {
   protected final Logger logger;

   public JavaLoggerWrapper(@Nonnull Logger logger) {
      super((String)null, (String)null);
      this.logger = logger;
   }

   public boolean getUseParentHandlers() {
      return this.logger.getUseParentHandlers();
   }

   public Filter getFilter() {
      return this.logger.getFilter();
   }

   public Handler[] getHandlers() {
      return this.logger.getHandlers();
   }

   public Level getLevel() {
      return this.logger.getLevel();
   }

   public Logger getParent() {
      return this.logger.getParent();
   }

   public ResourceBundle getResourceBundle() {
      return this.logger.getResourceBundle();
   }

   public String getResourceBundleName() {
      return this.logger.getResourceBundleName();
   }

   public void log(LogRecord record) {
      this.mapLevel(record);
      this.logger.log(record);
   }

   public void log(Level level, String msg, Object[] params) {
      this.logger.log(this.mapLevel(level), msg, params);
   }

   public void log(Level level, String msg, Object param1) {
      this.logger.log(this.mapLevel(level), msg, param1);
   }

   public void log(Level level, Supplier msgSupplier) {
      this.logger.log(this.mapLevel(level), msgSupplier);
   }

   public void log(Level level, String msg) {
      this.logger.log(this.mapLevel(level), msg);
   }

   public void log(Level level, String msg, Throwable thrown) {
      this.logger.log(this.mapLevel(level), msg, thrown);
   }

   public void log(Level level, Throwable thrown, Supplier msgSupplier) {
      this.logger.log(this.mapLevel(level), thrown, msgSupplier);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, String msg) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, msg);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, Supplier msgSupplier) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, msgSupplier);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, String msg, Object param1) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, msg, param1);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, String msg, Object[] params) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, msg, params);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, String msg, Throwable thrown) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, msg, thrown);
   }

   public void logp(Level level, String sourceClass, String sourceMethod, Throwable thrown, Supplier msgSupplier) {
      this.logger.logp(this.mapLevel(level), sourceClass, sourceMethod, thrown, msgSupplier);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, ResourceBundle bundle, String msg, Object... params) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundle, msg, params);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, ResourceBundle bundle, String msg, Throwable thrown) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundle, msg, thrown);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, String bundleName, String msg) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundleName, msg);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, String bundleName, String msg, Object param1) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundleName, msg, param1);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, String bundleName, String msg, Object[] params) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundleName, msg, params);
   }

   public void logrb(Level level, String sourceClass, String sourceMethod, String bundleName, String msg, Throwable thrown) {
      this.logger.logrb(this.mapLevel(level), sourceClass, sourceMethod, bundleName, msg, thrown);
   }

   public boolean isLoggable(Level level) {
      return this.logger.isLoggable(level);
   }

   public void setLevel(Level newLevel) throws SecurityException {
      this.logger.setLevel(newLevel);
   }

   public void setFilter(Filter newFilter) throws SecurityException {
      this.logger.setFilter(newFilter);
   }

   public void setParent(Logger parent) {
      this.logger.setParent(parent);
   }

   public void setResourceBundle(ResourceBundle bundle) {
      this.logger.setResourceBundle(bundle);
   }

   public void setUseParentHandlers(boolean useParentHandlers) {
      this.logger.setUseParentHandlers(useParentHandlers);
   }

   public void severe(String msg) {
      this.logger.severe(msg);
   }

   public void severe(Supplier msgSupplier) {
      this.logger.severe(msgSupplier);
   }

   public void entering(String sourceClass, String sourceMethod) {
      this.logger.entering(sourceClass, sourceMethod);
   }

   public void entering(String sourceClass, String sourceMethod, Object param1) {
      this.logger.entering(sourceClass, sourceMethod, param1);
   }

   public void entering(String sourceClass, String sourceMethod, Object[] params) {
      this.logger.entering(sourceClass, sourceMethod, params);
   }

   public void exiting(String sourceClass, String sourceMethod) {
      this.logger.exiting(sourceClass, sourceMethod);
   }

   public void exiting(String sourceClass, String sourceMethod, Object result) {
      this.logger.exiting(sourceClass, sourceMethod, result);
   }

   public void throwing(String sourceClass, String sourceMethod, Throwable thrown) {
      this.logger.throwing(sourceClass, sourceMethod, thrown);
   }

   public void warning(String msg) {
      this.logger.warning(msg);
   }

   public void info(String msg) {
      this.logger.info(msg);
   }

   public void config(String msg) {
      this.logger.config(msg);
   }

   public void fine(String msg) {
      this.logger.fine(msg);
   }

   public void finer(String msg) {
      this.logger.finer(msg);
   }

   public void finest(String msg) {
      this.logger.finest(msg);
   }

   public void warning(Supplier msgSupplier) {
      this.logger.warning(msgSupplier);
   }

   public void info(Supplier msgSupplier) {
      this.logger.info(msgSupplier);
   }

   public void config(Supplier msgSupplier) {
      this.logger.config(msgSupplier);
   }

   public void fine(Supplier msgSupplier) {
      this.logger.fine(msgSupplier);
   }

   public void finer(Supplier msgSupplier) {
      this.logger.finer(msgSupplier);
   }

   public void finest(Supplier msgSupplier) {
      this.logger.finest(msgSupplier);
   }

   public void addHandler(Handler handler) throws SecurityException {
      this.logger.addHandler(handler);
   }

   public void removeHandler(Handler handler) throws SecurityException {
      this.logger.removeHandler(handler);
   }

   public int hashCode() {
      return this.logger.hashCode();
   }

   public boolean equals(Object obj) {
      return this.logger.equals(obj);
   }

   public String toString() {
      return this.logger.toString();
   }

   protected void mapLevel(@Nonnull LogRecord record) {
      record.setLevel(this.mapLevel(record.getLevel()));
   }

   @Nonnull
   protected Level mapLevel(@Nonnull Level level) {
      return level;
   }

   @Nonnull
   public JavaILogger setMinLevel(@Nonnull LogLevel level) {
      this.setLevel(level.getJavaUtilLevel());
      return this;
   }

   @Nonnull
   public LogLevel getMinLevel() {
      return LogLevel.fromJavaLevel(this.logger.getLevel());
   }

   public void log(@Nonnull LogLevel level, @Nullable String message, @Nonnull Object... args) {
      Throwable thrown = null;
      Object[] var5 = args;
      int var6 = args.length;

      for(int var7 = 0; var7 < var6; ++var7) {
         Object arg = var5[var7];
         if (arg instanceof Throwable) {
            thrown = (Throwable)arg;
         }
      }

      this.log(level.getJavaUtilLevel(), ILogger.formatMessage(message, args), thrown);
   }

   public void log(@Nonnull LogLevel level, @Nullable Object message, @Nonnull Object... args) {
      this.log(level, String.valueOf(message), args);
   }

   public void error(@Nullable String message, @Nonnull Object... args) {
      this.log(LogLevel.ERROR, message, args);
   }

   public void error(@Nullable Object message, @Nonnull Object... args) {
      this.log(LogLevel.ERROR, message, args);
   }

   public void warn(@Nullable String message, @Nonnull Object... args) {
      this.log(LogLevel.WARN, message, args);
   }

   public void warn(@Nullable Object message, @Nonnull Object... args) {
      this.log(LogLevel.WARN, message, args);
   }

   public void info(@Nullable String message, @Nonnull Object... args) {
      this.log(LogLevel.INFO, message, args);
   }

   public void info(@Nullable Object message, @Nonnull Object... args) {
      this.log(LogLevel.INFO, message, args);
   }

   public void status(@Nullable String message, @Nonnull Object... args) {
      this.log(LogLevel.STATUS, message, args);
   }

   public void status(@Nullable Object message, @Nonnull Object... args) {
      this.log(LogLevel.STATUS, message, args);
   }

   public void debug(@Nullable String message, @Nonnull Object... args) {
      this.log(LogLevel.DEBUG, message, args);
   }

   public void debug(@Nullable Object message, @Nonnull Object... args) {
      this.log(LogLevel.DEBUG, message, args);
   }

   public boolean isTraceEnabled() {
      return this.isLevelEnabled(LogLevel.TRACE);
   }
}
