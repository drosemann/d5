package net.anweisen.utilities.common.config;

import java.util.function.Supplier;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;

public interface Json {
   @Nonnull
   String toJson();

   @Nonnull
   String toPrettyJson();

   @Nonnull
   @CheckReturnValue
   static Json empty() {
      return constant("{}", "{}");
   }

   @Nonnull
   @CheckReturnValue
   static Json supply(@Nonnull final Supplier normal, @Nonnull final Supplier pretty) {
      return new Json() {
         @Nonnull
         public String toJson() {
            return (String)normal.get();
         }

         @Nonnull
         public String toPrettyJson() {
            return (String)pretty.get();
         }
      };
   }

   @Nonnull
   @CheckReturnValue
   static Json constant(@Nonnull String json, @Nonnull String prettyJson) {
      return supply(() -> {
         return json;
      }, () -> {
         return prettyJson;
      });
   }
}
