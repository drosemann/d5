package net.anweisen.utilities.common.config.document;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.time.OffsetDateTime;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.function.BiConsumer;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.collection.Colors;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.PropertyHelper;
import net.anweisen.utilities.common.misc.FileUtils;
import net.anweisen.utilities.common.misc.PropertiesUtils;

public class PropertiesDocument extends AbstractDocument {
   protected final Properties properties;

   public PropertiesDocument(@Nullable Properties properties) {
      this.properties = properties == null ? new Properties() : properties;
   }

   public PropertiesDocument(@Nonnull File file) throws IOException {
      this.properties = new Properties();
      this.properties.load(FileUtils.newBufferedReader(file));
   }

   @Nonnull
   public Document getDocument0(@Nonnull String path, @Nonnull Document root, @Nullable Document parent) {
      throw new UnsupportedOperationException("PropertiesDocument.getDocument(String)");
   }

   @Nonnull
   public List getDocumentList(@Nonnull String path) {
      throw new UnsupportedOperationException("PropertiesDocument.getDocumentList(String)");
   }

   @Nonnull
   public List getStringList(@Nonnull String path) {
      throw new UnsupportedOperationException("PropertiesDocument.getList(String)");
   }

   @Nullable
   public Object getObject(@Nonnull String path) {
      return this.properties.get(path);
   }

   public Object getInstance(@Nonnull String path, @Nonnull Class classOfT) {
      return classOfT.cast(this.getObject(path));
   }

   public Object toInstanceOf(@Nonnull Class classOfT) {
      return this.copyJson().toInstanceOf(classOfT);
   }

   @Nullable
   public String getString(@Nonnull String path) {
      return this.properties.getProperty(path);
   }

   public long getLong(@Nonnull String path, long def) {
      try {
         return Long.parseLong(this.getString(path));
      } catch (Exception var5) {
         return def;
      }
   }

   public int getInt(@Nonnull String path, int def) {
      try {
         return Integer.parseInt(this.getString(path));
      } catch (Exception var4) {
         return def;
      }
   }

   public short getShort(@Nonnull String path, short def) {
      try {
         return Short.parseShort(this.getString(path));
      } catch (Exception var4) {
         return def;
      }
   }

   public byte getByte(@Nonnull String path, byte def) {
      try {
         return Byte.parseByte(this.getString(path));
      } catch (Exception var4) {
         return def;
      }
   }

   public float getFloat(@Nonnull String path, float def) {
      try {
         return Float.parseFloat(this.getString(path));
      } catch (Exception var4) {
         return def;
      }
   }

   public double getDouble(@Nonnull String path, double def) {
      try {
         return Double.parseDouble(this.getString(path));
      } catch (Exception var5) {
         return def;
      }
   }

   public boolean getBoolean(@Nonnull String path, boolean def) {
      return !this.contains(path) ? def : Boolean.parseBoolean(this.getString(path));
   }

   @Nullable
   public UUID getUUID(@Nonnull String path) {
      try {
         return UUID.fromString(this.getString(path));
      } catch (Exception var3) {
         return null;
      }
   }

   @Nullable
   public Date getDate(@Nonnull String path) {
      return PropertyHelper.parseDate(this.getString(path));
   }

   @Nullable
   public OffsetDateTime getDateTime(@Nonnull String path) {
      try {
         return OffsetDateTime.parse(this.getString(path));
      } catch (Exception var3) {
         return null;
      }
   }

   @Nullable
   public Color getColor(@Nonnull String path) {
      String string = this.getString(path);
      return string == null ? null : Color.decode(string);
   }

   @Nullable
   public Enum getEnum(@Nonnull String path, @Nonnull Class classOfEnum) {
      try {
         String name = this.getString(path);
         return name == null ? null : Enum.valueOf(classOfEnum, name);
      } catch (Throwable var4) {
         return null;
      }
   }

   public boolean contains(@Nonnull String path) {
      return this.properties.containsKey(path);
   }

   public boolean isList(@Nonnull String path) {
      return false;
   }

   public boolean isObject(@Nonnull String path) {
      return true;
   }

   public boolean isDocument(@Nonnull String path) {
      return false;
   }

   public int size() {
      return this.properties.size();
   }

   @Nonnull
   public Map values() {
      Map map = new LinkedHashMap();
      Iterator var2 = this.properties.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         map.put((String)entry.getKey(), entry.getValue());
      }

      return map;
   }

   @Nonnull
   public Collection keys() {
      return this.properties.stringPropertyNames();
   }

   public void forEach(@Nonnull BiConsumer action) {
      this.values().forEach(action);
   }

   public void set0(@Nonnull String path, @Nullable Object value) {
      String asString;
      if (value instanceof Color) {
         asString = Colors.asHex((Color)value);
      } else {
         asString = String.valueOf(value);
      }

      this.properties.setProperty(path, asString);
   }

   public void clear0() {
      this.properties.clear();
   }

   public void remove0(@Nonnull String path) {
      this.properties.remove(path);
   }

   public void write(@Nonnull Writer writer) throws IOException {
      this.properties.store(writer, (String)null);
   }

   @Nonnull
   public Properties getProperties() {
      return this.properties;
   }

   @Nonnull
   public String toJson() {
      return this.copyJson().toJson();
   }

   @Nonnull
   public String toPrettyJson() {
      return this.copyJson().toPrettyJson();
   }

   @Nonnull
   public Document copyJson() {
      Map map = new HashMap();
      PropertiesUtils.setProperties(this.properties, map);
      return new GsonDocument(map);
   }

   public boolean isReadonly() {
      return false;
   }
}
