package net.anweisen.utilities.common.config.document.wrapper;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.io.Writer;
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
import java.util.function.Function;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.version.Version;

public interface WrappedDocument extends Document {
   Document getWrappedDocument();

   default boolean isReadonly() {
      return this.getWrappedDocument().isReadonly();
   }

   @Nonnull
   default Document getDocument(@Nonnull String path) {
      return this.getWrappedDocument().getDocument(path);
   }

   @Nonnull
   default List getDocumentList(@Nonnull String path) {
      return this.getWrappedDocument().getDocumentList(path);
   }

   @Nonnull
   default List getSerializableList(@Nonnull String path, @Nonnull Class classOfT) {
      return this.getWrappedDocument().getSerializableList(path, classOfT);
   }

   @Nonnull
   default Document set(@Nonnull String path, @Nullable Object value) {
      this.getWrappedDocument().set(path, value);
      return this.self();
   }

   @Nonnull
   default Document set(@Nonnull Object value) {
      this.getWrappedDocument().set(value);
      return this.self();
   }

   @Nonnull
   default Document clear() {
      this.getWrappedDocument().clear();
      return this.self();
   }

   @Nonnull
   default Document remove(@Nonnull String path) {
      this.getWrappedDocument().remove(path);
      return this.self();
   }

   default void write(@Nonnull Writer writer) throws IOException {
      this.getWrappedDocument().write(writer);
   }

   default void saveToFile(@Nonnull File file) throws IOException {
      this.getWrappedDocument().saveToFile(file);
   }

   @Nonnull
   default String toJson() {
      return this.getWrappedDocument().toJson();
   }

   @Nonnull
   default String toPrettyJson() {
      return this.getWrappedDocument().toPrettyJson();
   }

   default Object getInstance(@Nonnull String path, @Nonnull Class classOfT) {
      return this.getWrappedDocument().getInstance(path, classOfT);
   }

   default Object toInstanceOf(@Nonnull Class classOfT) {
      return this.getWrappedDocument().toInstanceOf(classOfT);
   }

   @Nullable
   default Object getObject(@Nonnull String path) {
      return this.getWrappedDocument().getObject(path);
   }

   @Nonnull
   default Object getObject(@Nonnull String path, @Nonnull Object def) {
      return this.getWrappedDocument().getObject(path, def);
   }

   @Nonnull
   default Optional getOptional(@Nonnull String key, @Nonnull BiFunction extractor) {
      return this.getWrappedDocument().getOptional(key, extractor);
   }

   @Nullable
   default String getString(@Nonnull String path) {
      return this.getWrappedDocument().getString(path);
   }

   @Nonnull
   default String getString(@Nonnull String path, @Nonnull String def) {
      return this.getWrappedDocument().getString(path, def);
   }

   default char getChar(@Nonnull String path) {
      return this.getWrappedDocument().getChar(path);
   }

   default char getChar(@Nonnull String path, char def) {
      return this.getWrappedDocument().getChar(path, def);
   }

   default long getLong(@Nonnull String path) {
      return this.getWrappedDocument().getLong(path);
   }

   default long getLong(@Nonnull String path, long def) {
      return this.getWrappedDocument().getLong(path, def);
   }

   default int getInt(@Nonnull String path) {
      return this.getWrappedDocument().getInt(path);
   }

   default int getInt(@Nonnull String path, int def) {
      return this.getWrappedDocument().getInt(path, def);
   }

   default short getShort(@Nonnull String path) {
      return this.getWrappedDocument().getShort(path);
   }

   default short getShort(@Nonnull String path, short def) {
      return this.getWrappedDocument().getShort(path, def);
   }

   default byte getByte(@Nonnull String path) {
      return this.getWrappedDocument().getByte(path);
   }

   default byte getByte(@Nonnull String path, byte def) {
      return this.getWrappedDocument().getByte(path, def);
   }

   default float getFloat(@Nonnull String path) {
      return this.getWrappedDocument().getFloat(path);
   }

   default float getFloat(@Nonnull String path, float def) {
      return this.getWrappedDocument().getFloat(path, def);
   }

   default double getDouble(@Nonnull String path) {
      return this.getWrappedDocument().getDouble(path);
   }

   default double getDouble(@Nonnull String path, double def) {
      return this.getWrappedDocument().getDouble(path, def);
   }

   default boolean getBoolean(@Nonnull String path) {
      return this.getWrappedDocument().getBoolean(path);
   }

   default boolean getBoolean(@Nonnull String path, boolean def) {
      return this.getWrappedDocument().getBoolean(path, def);
   }

   @Nonnull
   default List getStringList(@Nonnull String path) {
      return this.getWrappedDocument().getStringList(path);
   }

   @Nonnull
   default String[] getStringArray(@Nonnull String path) {
      return this.getWrappedDocument().getStringArray(path);
   }

   @Nonnull
   default List mapList(@Nonnull String path, @Nonnull Function mapper) {
      return this.getWrappedDocument().mapList(path, mapper);
   }

   @Nonnull
   default List getEnumList(@Nonnull String path, @Nonnull Class classOfEnum) {
      return this.getWrappedDocument().getEnumList(path, classOfEnum);
   }

   @Nonnull
   default List getUUIDList(@Nonnull String path) {
      return this.getWrappedDocument().getUUIDList(path);
   }

   @Nonnull
   default List getCharacterList(@Nonnull String path) {
      return this.getWrappedDocument().getCharacterList(path);
   }

   @Nonnull
   default List getByteList(@Nonnull String path) {
      return this.getWrappedDocument().getByteList(path);
   }

   @Nonnull
   default List getShortList(@Nonnull String path) {
      return this.getWrappedDocument().getShortList(path);
   }

   @Nonnull
   default List getIntegerList(@Nonnull String path) {
      return this.getWrappedDocument().getIntegerList(path);
   }

   @Nonnull
   default List getLongList(@Nonnull String path) {
      return this.getWrappedDocument().getLongList(path);
   }

   @Nonnull
   default List getFloatList(@Nonnull String path) {
      return this.getWrappedDocument().getFloatList(path);
   }

   @Nonnull
   default List getDoubleList(@Nonnull String path) {
      return this.getWrappedDocument().getDoubleList(path);
   }

   @Nullable
   default UUID getUUID(@Nonnull String path) {
      return this.getWrappedDocument().getUUID(path);
   }

   @Nonnull
   default UUID getUUID(@Nonnull String path, @Nonnull UUID def) {
      return this.getWrappedDocument().getUUID(path, def);
   }

   @Nullable
   default Date getDate(@Nonnull String path) {
      return this.getWrappedDocument().getDate(path);
   }

   @Nonnull
   default Date getDate(@Nonnull String path, @Nonnull Date def) {
      return this.getWrappedDocument().getDate(path, def);
   }

   @Nullable
   default OffsetDateTime getDateTime(@Nonnull String path) {
      return this.getWrappedDocument().getDateTime(path);
   }

   @Nonnull
   default OffsetDateTime getDateTime(@Nonnull String path, @Nonnull OffsetDateTime def) {
      return this.getWrappedDocument().getDateTime(path, def);
   }

   @Nullable
   default Color getColor(@Nonnull String path) {
      return this.getWrappedDocument().getColor(path);
   }

   @Nonnull
   default Color getColor(@Nonnull String path, @Nonnull Color def) {
      return this.getWrappedDocument().getColor(path, def);
   }

   @Nullable
   default Enum getEnum(@Nonnull String path, @Nonnull Class classOfEnum) {
      return this.getWrappedDocument().getEnum(path, classOfEnum);
   }

   @Nonnull
   default Enum getEnum(@Nonnull String path, @Nonnull Enum def) {
      return this.getWrappedDocument().getEnum(path, def);
   }

   @Nullable
   default Object getSerializable(@Nonnull String path, @Nonnull Class classOfT) {
      return this.getWrappedDocument().getSerializable(path, classOfT);
   }

   @Nonnull
   default Object getSerializable(@Nonnull String path, @Nonnull Object def) {
      return this.getWrappedDocument().getSerializable(path, def);
   }

   @Nullable
   default Class getClass(@Nonnull String path) {
      return this.getWrappedDocument().getClass(path);
   }

   @Nonnull
   default Class getClass(@Nonnull String path, @Nonnull Class def) {
      return this.getWrappedDocument().getClass(path, def);
   }

   @Nullable
   default Version getVersion(@Nonnull String path) {
      return this.getWrappedDocument().getVersion(path);
   }

   @Nonnull
   default Version getVersion(@Nonnull String path, @Nonnull Version def) {
      return this.getWrappedDocument().getVersion(path, def);
   }

   @Nullable
   default byte[] getBinary(@Nonnull String path) {
      return this.getWrappedDocument().getBinary(path);
   }

   default boolean contains(@Nonnull String path) {
      return this.getWrappedDocument().contains(path);
   }

   default boolean hasChildren(@Nonnull String path) {
      return this.getWrappedDocument().hasChildren(path);
   }

   default boolean isObject(@Nonnull String path) {
      return this.getWrappedDocument().isObject(path);
   }

   default boolean isList(@Nonnull String path) {
      return this.getWrappedDocument().isList(path);
   }

   default boolean isDocument(@Nonnull String path) {
      return this.getWrappedDocument().isDocument(path);
   }

   default boolean isEmpty() {
      return this.getWrappedDocument().isEmpty();
   }

   default int size() {
      return this.getWrappedDocument().size();
   }

   @Nonnull
   default Map values() {
      return this.getWrappedDocument().values();
   }

   @Nonnull
   default Map valuesAsStrings() {
      return this.getWrappedDocument().valuesAsStrings();
   }

   @Nonnull
   default Map children() {
      return this.getWrappedDocument().children();
   }

   @Nonnull
   default Map mapValues(@Nonnull Function keyMapper, @Nonnull Function valueMapper) {
      return this.getWrappedDocument().mapValues(keyMapper, valueMapper);
   }

   @Nonnull
   default Map mapDocuments(@Nonnull Function keyMapper, @Nonnull Function valueMapper) {
      return this.getWrappedDocument().mapDocuments(keyMapper, valueMapper);
   }

   @Nonnull
   default Object mapDocument(@Nonnull String path, @Nonnull Function mapper) {
      return this.getWrappedDocument().mapDocument(path, mapper);
   }

   @Nullable
   default Object mapDocumentNullable(@Nonnull String path, @Nonnull Function mapper) {
      return this.getWrappedDocument().mapDocumentNullable(path, mapper);
   }

   @Nonnull
   default Collection keys() {
      return this.getWrappedDocument().keys();
   }

   @Nonnull
   default Set entrySet() {
      return this.getWrappedDocument().entrySet();
   }

   default void forEach(@Nonnull BiConsumer action) {
      this.getWrappedDocument().forEach(action);
   }

   @Nonnull
   default Document readonly() {
      return this.getWrappedDocument().readonly();
   }

   @Nullable
   default Document getParent() {
      return this.getWrappedDocument().getParent();
   }

   @Nonnull
   default Document getRoot() {
      return this.getWrappedDocument().getRoot();
   }

   default Document self() {
      return this;
   }
}
