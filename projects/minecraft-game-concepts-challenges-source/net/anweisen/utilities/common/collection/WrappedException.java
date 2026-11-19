package net.anweisen.utilities.common.collection;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class WrappedException extends RuntimeException {
   public WrappedException(@Nullable String message, @Nonnull Throwable cause) {
      super(message, cause);
   }

   public WrappedException(@Nonnull Throwable cause) {
      super(cause);
   }

   @Nonnull
   public Throwable getCause() {
      return super.getCause();
   }

   @Nonnull
   public static RuntimeException rethrow(@Nonnull Throwable ex) {
      if (ex instanceof Error) {
         throw (Error)ex;
      } else if (ex instanceof RuntimeException) {
         throw (RuntimeException)ex;
      } else {
         throw silent(ex);
      }
   }

   @Nonnull
   public static WrappedException silent(@Nonnull Throwable cause) {
      return new WrappedException.SilentWrappedException(cause);
   }

   @Nonnull
   public static WrappedException silent(@Nullable String message, @Nonnull Throwable cause) {
      return new WrappedException.SilentWrappedException(message, cause);
   }

   public static class SilentWrappedException extends WrappedException {
      public SilentWrappedException(@Nullable String message, @Nonnull Throwable cause) {
         super(message, cause);
      }

      public SilentWrappedException(@Nonnull Throwable cause) {
         super(cause);
      }

      public synchronized Throwable fillInStackTrace() {
         return this;
      }
   }
}
