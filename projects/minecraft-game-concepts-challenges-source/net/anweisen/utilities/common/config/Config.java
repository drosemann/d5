package net.anweisen.utilities.common.config;

import java.util.function.Consumer;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public interface Config extends Propertyable {
   @Nonnull
   Config set(@Nonnull String var1, @Nullable Object var2);

   @Nonnull
   Config clear();

   @Nonnull
   Config remove(@Nonnull String var1);

   boolean isReadonly();

   @Nonnull
   @CheckReturnValue
   Config readonly();

   @Nonnull
   default Config apply(@Nonnull Consumer action) {
      return (Config)Propertyable.super.apply(action);
   }

   @Nonnull
   default Config applyIf(boolean expression, @Nonnull Consumer action) {
      return (Config)Propertyable.super.applyIf(expression, action);
   }

   @Nonnull
   default Config increment(@Nonnull String path, double amount) {
      return this.set(path, this.getDouble(path) + amount);
   }

   @Nonnull
   default Config decrement(@Nonnull String path, double amount) {
      return this.set(path, this.getDouble(path) - amount);
   }

   @Nonnull
   default Config multiply(@Nonnull String path, double factor) {
      return this.set(path, this.getDouble(path) * factor);
   }

   @Nonnull
   default Config divide(@Nonnull String path, double divisor) {
      return this.set(path, this.getDouble(path) / divisor);
   }

   @Nonnull
   default Config setIfAbsent(@Nonnull String path, @Nonnull Object defaultValue) {
      if (!this.contains(path)) {
         this.set(path, defaultValue);
      }

      return this;
   }
}
