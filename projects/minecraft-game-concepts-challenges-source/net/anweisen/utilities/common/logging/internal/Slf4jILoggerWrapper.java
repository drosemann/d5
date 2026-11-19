package net.anweisen.utilities.common.logging.internal;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.WrappedILogger;
import net.anweisen.utilities.common.logging.lib.Slf4jILogger;
import org.slf4j.helpers.MarkerIgnoringBase;

public class Slf4jILoggerWrapper extends MarkerIgnoringBase implements WrappedILogger, Slf4jILogger {
   private final ILogger logger;

   public Slf4jILoggerWrapper(@Nonnull ILogger logger) {
      this.logger = logger;
   }

   @Nonnull
   public ILogger getWrappedLogger() {
      return this.logger;
   }

   public boolean isTraceEnabled() {
      return this.logger.isTraceEnabled();
   }

   public void trace(String message) {
      this.logger.trace(message);
   }

   public void trace(String message, Object arg) {
      this.logger.trace(message, arg);
   }

   public void trace(String message, Object arg1, Object arg2) {
      this.logger.trace(message, arg1, arg2);
   }

   public void trace(String message, Object... args) {
      this.logger.trace(message, args);
   }

   public void trace(String message, Throwable ex) {
      this.logger.trace(message, ex);
   }

   public boolean isDebugEnabled() {
      return this.logger.isDebugEnabled();
   }

   public void debug(String message) {
      this.logger.debug(message);
   }

   public void debug(String message, Object arg) {
      this.logger.debug(message, arg);
   }

   public void debug(String message, Object arg1, Object arg2) {
      this.logger.debug(message, arg1, arg2);
   }

   public void debug(String message, Object... args) {
      this.logger.debug(message, args);
   }

   public void debug(String message, Throwable ex) {
      this.logger.debug(message, ex);
   }

   public boolean isInfoEnabled() {
      return this.logger.isInfoEnabled();
   }

   public void info(String message) {
      this.logger.info(message);
   }

   public void info(String message, Object arg) {
      this.logger.info(message, arg);
   }

   public void info(String message, Object arg1, Object arg2) {
      this.logger.info(message, arg1, arg2);
   }

   public void info(String message, Object... args) {
      this.logger.info(message, args);
   }

   public void info(String message, Throwable ex) {
      this.logger.info(message, ex);
   }

   public boolean isWarnEnabled() {
      return this.logger.isWarnEnabled();
   }

   public void warn(String message) {
      this.logger.warn(message);
   }

   public void warn(String message, Object arg) {
      this.logger.warn(message, arg);
   }

   public void warn(String message, Object... args) {
      this.logger.warn(message, args);
   }

   public void warn(String message, Object arg1, Object arg2) {
      this.logger.warn(message, arg1, arg2);
   }

   public void warn(String message, Throwable ex) {
      this.logger.warn(message, ex);
   }

   public boolean isErrorEnabled() {
      return this.logger.isWarnEnabled();
   }

   public void error(String message) {
      this.logger.error(message);
   }

   public void error(String message, Object arg) {
      this.logger.error(message, arg);
   }

   public void error(String message, Object arg1, Object arg2) {
      this.logger.error(message, arg1, arg2);
   }

   public void error(String message, Object... args) {
      this.logger.error(message, args);
   }

   public void error(String message, Throwable ex) {
      this.logger.error(message, ex);
   }
}
