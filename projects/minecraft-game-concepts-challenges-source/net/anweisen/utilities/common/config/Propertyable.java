package net.anweisen.utilities.common.config;

import java.awt.Color;
import java.time.OffsetDateTime;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.version.Version;

public interface Propertyable {
   Object getInstance(@Nonnull String var1, @Nonnull Class var2);

   @Nullable
   Object getObject(@Nonnull String var1);

   @Nonnull
   Object getObject(@Nonnull String var1, @Nonnull Object var2);

   @Nonnull
   default Optional getOptional(@Nonnull String key, @Nonnull BiFunction extractor) {
      return Optional.ofNullable(extractor.apply(this, key));
   }

   @Nonnull
   default Propertyable apply(@Nonnull Consumer action) {
      action.accept(this);
      return this;
   }

   @Nonnull
   default Propertyable applyIf(boolean expression, @Nonnull Consumer action) {
      if (expression) {
         this.apply(action);
      }

      return this;
   }

   @Nullable
   String getString(@Nonnull String var1);

   @Nonnull
   String getString(@Nonnull String var1, @Nonnull String var2);

   @Nullable
   byte[] getBinary(@Nonnull String var1);

   char getChar(@Nonnull String var1);

   char getChar(@Nonnull String var1, char var2);

   long getLong(@Nonnull String var1);

   long getLong(@Nonnull String var1, long var2);

   int getInt(@Nonnull String var1);

   int getInt(@Nonnull String var1, int var2);

   short getShort(@Nonnull String var1);

   short getShort(@Nonnull String var1, short var2);

   byte getByte(@Nonnull String var1);

   byte getByte(@Nonnull String var1, byte var2);

   float getFloat(@Nonnull String var1);

   float getFloat(@Nonnull String var1, float var2);

   double getDouble(@Nonnull String var1);

   double getDouble(@Nonnull String var1, double var2);

   boolean getBoolean(@Nonnull String var1);

   boolean getBoolean(@Nonnull String var1, boolean var2);

   @Nonnull
   List getStringList(@Nonnull String var1);

   @Nonnull
   String[] getStringArray(@Nonnull String var1);

   @Nonnull
   List getEnumList(@Nonnull String var1, @Nonnull Class var2);

   @Nonnull
   List getUUIDList(@Nonnull String var1);

   @Nonnull
   List getCharacterList(@Nonnull String var1);

   @Nonnull
   List getByteList(@Nonnull String var1);

   @Nonnull
   List getShortList(@Nonnull String var1);

   @Nonnull
   List getIntegerList(@Nonnull String var1);

   @Nonnull
   List getLongList(@Nonnull String var1);

   @Nonnull
   List getFloatList(@Nonnull String var1);

   @Nonnull
   List getDoubleList(@Nonnull String var1);

   @Nullable
   UUID getUUID(@Nonnull String var1);

   @Nonnull
   UUID getUUID(@Nonnull String var1, @Nonnull UUID var2);

   @Nullable
   OffsetDateTime getDateTime(@Nonnull String var1);

   @Nonnull
   OffsetDateTime getDateTime(@Nonnull String var1, @Nonnull OffsetDateTime var2);

   @Nullable
   Date getDate(@Nonnull String var1);

   @Nonnull
   Date getDate(@Nonnull String var1, @Nonnull Date var2);

   @Nullable
   Color getColor(@Nonnull String var1);

   @Nonnull
   Color getColor(@Nonnull String var1, @Nonnull Color var2);

   @Nullable
   Enum getEnum(@Nonnull String var1, @Nonnull Class var2);

   @Nonnull
   Enum getEnum(@Nonnull String var1, @Nonnull Enum var2);

   @Nullable
   Class getClass(@Nonnull String var1);

   @Nonnull
   Class getClass(@Nonnull String var1, @Nonnull Class var2);

   @Nullable
   Version getVersion(@Nonnull String var1);

   @Nonnull
   Version getVersion(@Nonnull String var1, @Nonnull Version var2);

   boolean isList(@Nonnull String var1);

   boolean isObject(@Nonnull String var1);

   boolean contains(@Nonnull String var1);

   boolean isEmpty();

   @Nonnegative
   int size();

   @Nonnull
   Map values();

   @Nonnull
   Map valuesAsStrings();

   @Nonnull
   Map mapValues(@Nonnull Function var1, @Nonnull Function var2);

   @Nonnull
   List mapList(@Nonnull String var1, @Nonnull Function var2);

   @Nonnull
   Collection keys();

   @Nonnull
   Set entrySet();

   void forEach(@Nonnull BiConsumer var1);
}
