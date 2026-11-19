// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Document.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Document.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/Document.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config;
//
// import com.google.gson.JsonArray;
// import java.io.File;
// import java.io.IOException;
// import java.io.InputStream;
// import java.io.InputStreamReader;
// import java.io.Reader;
// import java.io.Writer;
// import java.lang.reflect.Constructor;
// import java.lang.reflect.InvocationTargetException;
// import java.nio.charset.StandardCharsets;
// import java.nio.file.Path;
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.function.Consumer;
// import java.util.function.Function;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.collection.WrappedException;
// import net.anweisen.utilities.common.config.document.EmptyDocument;
// import net.anweisen.utilities.common.config.document.GsonDocument;
// import net.anweisen.utilities.common.config.document.PropertiesDocument;
// import net.anweisen.utilities.common.misc.FileUtils;
// import net.anweisen.utilities.common.misc.GsonUtils;
//
// public interface Document extends Config, Json {
//    @Nonnull
//    Document getDocument(@Nonnull String var1);
//
//    @Nonnull
//    List getDocumentList(@Nonnull String var1);
//
//    @Nonnull
//    default List getInstanceList(@Nonnull String path, @Nonnull Class classOfT) {
//       List documents = this.getDocumentList(path);
//       List result = new ArrayList(documents.size());
//       Iterator var5 = documents.iterator();
//
//       while(var5.hasNext()) {
//          Document document = (Document)var5.next();
//          result.add(document.toInstanceOf(classOfT));
//       }
//
//       return result;
//    }
//
//    @Nonnull
//    List getSerializableList(@Nonnull String var1, @Nonnull Class var2);
//
//    @Nullable
//    Object getSerializable(@Nonnull String var1, @Nonnull Class var2);
//
//    @Nonnull
//    Object getSerializable(@Nonnull String var1, @Nonnull Object var2);
//
//    @Nonnull
//    Map mapDocuments(@Nonnull Function var1, @Nonnull Function var2);
//
//    @Nonnull
//    Object mapDocument(@Nonnull String var1, @Nonnull Function var2);
//
//    @Nullable
//    Object mapDocumentNullable(@Nonnull String var1, @Nonnull Function var2);
//
//    @Nullable
//    Object toInstanceOf(@Nonnull Class var1);
//
//    @Nullable
//    Document getParent();
//
//    @Nonnull
//    Document getRoot();
//
//    @Nonnull
//    Document set(@Nonnull String var1, @Nullable Object var2);
//
//    @Nonnull
//    Document clear();
//
//    @Nonnull
//    Document remove(@Nonnull String var1);
//
//    @Nonnull
//    default Document apply(@Nonnull Consumer action) {
//       return (Document)Config.super.apply(action);
//    }
//
//    @Nonnull
//    default Document applyIf(boolean expression, @Nonnull Consumer action) {
//       return (Document)Config.super.applyIf(expression, action);
//    }
//
//    @Nonnull
//    default Document setIfAbsent(@Nonnull String path, @Nonnull Object defaultValue) {
//       return (Document)Config.super.setIfAbsent(path, defaultValue);
//    }
//
//    @Nonnull
//    Document set(@Nonnull Object var1);
//
//    @Nonnull
//    @CheckReturnValue
//    Document readonly();
//
//    @Nonnull
//    Map children();
//
//    boolean isDocument(@Nonnull String var1);
//
//    boolean hasChildren(@Nonnull String var1);
//
//    void write(@Nonnull Writer var1) throws IOException;
//
//    default void saveToFile(@Nonnull File file) throws IOException {
//       FileUtils.createFilesIfNecessary(file);
//       Writer writer = FileUtils.newBufferedWriter(file);
//       this.write(writer);
//       writer.flush();
//       writer.close();
//    }
//
//    default void saveToFile(@Nonnull Path file) throws IOException {
//       FileUtils.createFile(file);
//       Writer writer = FileUtils.newBufferedWriter(file);
//       this.write(writer);
//       writer.flush();
//       writer.close();
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default FileDocument asFileDocument(@Nonnull File file) {
//       return this instanceof FileDocument && ((FileDocument)this).getFile().equals(file) ? (FileDocument)this : FileDocument.wrap(this, file);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default FileDocument asFileDocument(@Nonnull Path file) {
//       return this.asFileDocument(file.toFile());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default Document copyJson() {
//       Document document = create();
//       this.forEach(document::set);
//       return document;
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document empty() {
//       return EmptyDocument.ROOT;
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readFile(@Nonnull Class classOfDocument, @Nonnull File file) {
//       try {
//          Constructor constructor;
//          if (file.exists()) {
//             constructor = classOfDocument.getConstructor(File.class);
//             return (Document)constructor.newInstance(file);
//          } else {
//             constructor = classOfDocument.getConstructor();
//             return (Document)constructor.newInstance();
//          }
//       } catch (InstantiationException | IllegalAccessException | NoSuchMethodException var3) {
//          throw new UnsupportedOperationException(classOfDocument.getName() + " does not support File creation");
//       } catch (InvocationTargetException var4) {
//          throw new WrappedException(var4);
//       }
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readFile(@Nonnull Class classOfDocument, @Nonnull Path file) {
//       return readFile(classOfDocument, file.toFile());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document parseJson(@Nonnull String jsonInput) {
//       return new GsonDocument(jsonInput);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document parseJson(@Nonnull Reader reader) throws IOException {
//       return new GsonDocument(reader);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document parseJson(@Nonnull InputStream input) throws IOException {
//       return new GsonDocument(new InputStreamReader(input, StandardCharsets.UTF_8));
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static List parseJsonArray(@Nonnull String jsonInput) {
//       return GsonDocument.convertArrayToDocuments((JsonArray)GsonDocument.GSON.fromJson(jsonInput, JsonArray.class));
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static List parseStringArray(@Nonnull String jsonInput) {
//       return GsonDocument.convertArrayToStrings((JsonArray)GsonDocument.GSON.fromJson(jsonInput, JsonArray.class));
//    }
//
//    static void saveArray(@Nonnull Iterable objects, @Nonnull Path file) throws IOException {
//       FileUtils.createFile(file);
//       Writer writer = FileUtils.newBufferedWriter(file);
//       JsonArray array = GsonUtils.convertIterableToJsonArray(GsonDocument.GSON, objects);
//       (GsonDocument.isWritePrettyJson() ? GsonDocument.GSON_PRETTY_PRINT : GsonDocument.GSON).toJson(array, writer);
//       writer.flush();
//       writer.close();
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readJsonFile(@Nonnull File file) {
//       return readFile(GsonDocument.class, file);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readJsonFile(@Nonnull Path file) {
//       return readJsonFile(file.toFile());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static List readJsonArrayFile(@Nonnull Path file) {
//       try {
//          JsonArray array = (JsonArray)GsonDocument.GSON.fromJson(FileUtils.newBufferedReader(file), JsonArray.class);
//          if (array == null) {
//             return new ArrayList();
//          } else {
//             List documents = new ArrayList(array.size());
//             array.forEach((element) -> {
//                documents.add(new GsonDocument(element.getAsJsonObject()));
//             });
//             return documents;
//          }
//       } catch (IOException var3) {
//          throw new WrappedException(var3);
//       }
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readPropertiesFile(@Nonnull File file) {
//       return readFile(PropertiesDocument.class, file);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document readPropertiesFile(@Nonnull Path file) {
//       return readPropertiesFile(file.toFile());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document create() {
//       return new GsonDocument();
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static Document of(@Nonnull Object object) {
//       return new GsonDocument(object);
//    }
//
//    @Nullable
//    @CheckReturnValue
//    static Document ofNullable(@Nullable Object object) {
//       return object == null ? null : of(object);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static List arrayOf(@Nonnull Collection objects) {
//       List documents = new ArrayList(objects.size());
//       objects.forEach((object) -> {
//          documents.add(of(object));
//       });
//       return documents;
//    }
// }
//
