package net.anweisen.utilities.common.config.document;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.exceptions.ConfigReadOnlyException;
import net.anweisen.utilities.common.version.Version;

public class EmptyDocument implements Document {
   public static final EmptyDocument ROOT = new EmptyDocument();
   protected final Document root;
   protected final Document parent;

   public EmptyDocument(@Nonnull Document root, @Nullable Document parent) {
      this.root = root;
      this.parent = parent;
   }

   public EmptyDocument() {
      this.root = this;
      this.parent = null;
   }

   @Nonnull
   public Document getDocument(@Nonnull String path) {
      return new EmptyDocument();
   }

   @Nonnull
   public Object mapDocument(@Nonnull String path, @Nonnull Function mapper) {
      return mapper.apply(Document.empty());
   }

   @Nullable
   public Object mapDocumentNullable(@Nonnull String path, @Nonnull Function mapper) {
      return null;
   }

   @Nonnull
   public List getDocumentList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getSerializableList(@Nonnull String path, @Nonnull Class classOfT) {
      return new ArrayList();
   }

   @Nonnull
   public Document set(@Nonnull String path, @Nullable Object value) {
      throw new ConfigReadOnlyException("set");
   }

   @Nonnull
   public Document set(@Nonnull Object value) {
      throw new ConfigReadOnlyException("set");
   }

   @Nonnull
   public Document clear() {
      return this;
   }

   @Nonnull
   public Document remove(@Nonnull String path) {
      return this;
   }

   public void write(@Nonnull Writer writer) throws IOException {
      throw new UnsupportedOperationException("EmptyDocument.write(Writer)");
   }

   public void saveToFile(@Nonnull File file) throws IOException {
      throw new UnsupportedOperationException("EmptyDocument.save(File)");
   }

   @Nullable
   public Object getObject(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public Object getObject(@Nonnull String path, @Nonnull Object def) {
      return def;
   }

   public Object getInstance(@Nonnull String path, @Nonnull Class classOfT) {
      return null;
   }

   public Object toInstanceOf(@Nonnull Class classOfT) {
      throw new UnsupportedOperationException();
   }

   @Nonnull
   public Optional getOptional(@Nonnull String key, @Nonnull BiFunction extractor) {
      return Optional.empty();
   }

   @Nullable
   public String getString(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public String getString(@Nonnull String path, @Nonnull String def) {
      return def;
   }

   public char getChar(@Nonnull String path) {
      return '\u0000';
   }

   public char getChar(@Nonnull String path, char def) {
      return def;
   }

   public long getLong(@Nonnull String path) {
      return 0L;
   }

   public long getLong(@Nonnull String path, long def) {
      return def;
   }

   public int getInt(@Nonnull String path) {
      return 0;
   }

   public int getInt(@Nonnull String path, int def) {
      return def;
   }

   public short getShort(@Nonnull String path) {
      return 0;
   }

   public short getShort(@Nonnull String path, short def) {
      return def;
   }

   public byte getByte(@Nonnull String path) {
      return 0;
   }

   public byte getByte(@Nonnull String path, byte def) {
      return def;
   }

   public float getFloat(@Nonnull String path) {
      return 0.0F;
   }

   public float getFloat(@Nonnull String path, float def) {
      return def;
   }

   public double getDouble(@Nonnull String path) {
      return 0.0D;
   }

   public double getDouble(@Nonnull String path, double def) {
      return def;
   }

   public boolean getBoolean(@Nonnull String path) {
      return false;
   }

   public boolean getBoolean(@Nonnull String path, boolean def) {
      return def;
   }

   @Nullable
   public byte[] getBinary(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public List getStringList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public String[] getStringArray(@Nonnull String path) {
      return new String[0];
   }

   @Nonnull
   public List getEnumList(@Nonnull String path, @Nonnull Class classOfEnum) {
      return new ArrayList();
   }

   @Nonnull
   public List mapList(@Nonnull String path, @Nonnull Function mapper) {
      return new ArrayList();
   }

   @Nonnull
   public List getUUIDList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getCharacterList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getByteList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getShortList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getIntegerList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getLongList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getFloatList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nonnull
   public List getDoubleList(@Nonnull String path) {
      return new ArrayList();
   }

   @Nullable
   public UUID getUUID(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public UUID getUUID(@Nonnull String path, @Nonnull UUID def) {
      return def;
   }

   @Nullable
   public Date getDate(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public Date getDate(@Nonnull String path, @Nonnull Date def) {
      return def;
   }

   @Nullable
   public OffsetDateTime getDateTime(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public OffsetDateTime getDateTime(@Nonnull String path, @Nonnull OffsetDateTime def) {
      return def;
   }

   @Nullable
   public Color getColor(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public Color getColor(@Nonnull String path, @Nonnull Color def) {
      return def;
   }

   @Nullable
   public Enum getEnum(@Nonnull String path, @Nonnull Class classOfEnum) {
      return null;
   }

   @Nonnull
   public Enum getEnum(@Nonnull String path, @Nonnull Enum def) {
      return def;
   }

   @Nullable
   public Object getSerializable(@Nonnull String path, @Nonnull Class classOfT) {
      return null;
   }

   @Nonnull
   public Object getSerializable(@Nonnull String path, @Nonnull Object def) {
      return def;
   }

   @Nullable
   public Class getClass(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public Class getClass(@Nonnull String path, @Nonnull Class def) {
      return def;
   }

   @Nullable
   public Version getVersion(@Nonnull String path) {
      return null;
   }

   @Nonnull
   public Version getVersion(@Nonnull String path, @Nonnull Version def) {
      return def;
   }

   public boolean contains(@Nonnull String path) {
      return false;
   }

   public boolean isEmpty() {
      return true;
   }

   public boolean hasChildren(@Nonnull String path) {
      return false;
   }

   public boolean isList(@Nonnull String path) {
      return false;
   }

   public boolean isObject(@Nonnull String path) {
      return false;
   }

   public boolean isDocument(@Nonnull String path) {
      return false;
   }

   public int size() {
      return 0;
   }

   @Nonnull
   public Map values() {
      return Collections.emptyMap();
   }

   @Nonnull
   public Map valuesAsStrings() {
      return new HashMap();
   }

   @Nonnull
   public Map children() {
      return new HashMap();
   }

   @Nonnull
   public Map mapValues(@Nonnull Function keyMapper, @Nonnull Function valueMapper) {
      return new HashMap();
   }

   @Nonnull
   public Map mapDocuments(@Nonnull Function keyMapper, @Nonnull Function valueMapper) {
      return new HashMap();
   }

   @Nonnull
   public Collection keys() {
      return Collections.emptyList();
   }

   @Nonnull
   public Set entrySet() {
      return Collections.emptySet();
   }

   public void forEach(@Nonnull BiConsumer action) {
   }

   @Nonnull
   public String toJson() {
      return "{}";
   }

   @Nonnull
   public String toPrettyJson() {
      return "{}";
   }

   @Nonnull
   public String toString() {
      return "{}";
   }

   public boolean isReadonly() {
      return true;
   }

   @Nonnull
   public Document readonly() {
      return this;
   }

   @Nullable
   public Document getParent() {
      return this.parent;
   }

   @Nonnull
   public Document getRoot() {
      return this.root;
   }
}
