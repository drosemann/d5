// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/GsonDocument.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/GsonDocument.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/GsonDocument.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document;
//
// import com.google.gson.Gson;
// import com.google.gson.GsonBuilder;
// import com.google.gson.JsonArray;
// import com.google.gson.JsonElement;
// import com.google.gson.JsonNull;
// import com.google.gson.JsonObject;
// import com.google.gson.JsonPrimitive;
// import com.google.gson.JsonSyntaxException;
// import com.google.gson.TypeAdapter;
// import com.google.gson.internal.LazilyParsedNumber;
// import com.google.gson.internal.bind.TypeAdapters;
// import com.google.gson.stream.JsonReader;
// import com.google.gson.stream.JsonToken;
// import com.google.gson.stream.JsonWriter;
// import java.awt.Color;
// import java.io.BufferedReader;
// import java.io.File;
// import java.io.IOException;
// import java.io.Reader;
// import java.io.Writer;
// import java.time.OffsetDateTime;
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Collections;
// import java.util.Date;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.Map;
// import java.util.Optional;
// import java.util.UUID;
// import java.util.Map.Entry;
// import java.util.function.BiConsumer;
// import java.util.function.Function;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.collection.pair.Pair;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.document.gson.BukkitReflectionSerializableTypeAdapter;
// import net.anweisen.utilities.common.config.document.gson.ClassTypeAdapter;
// import net.anweisen.utilities.common.config.document.gson.ColorTypeAdapter;
// import net.anweisen.utilities.common.config.document.gson.DocumentTypeAdapter;
// import net.anweisen.utilities.common.config.document.gson.GsonTypeAdapter;
// import net.anweisen.utilities.common.config.document.gson.PairTypeAdapter;
// import net.anweisen.utilities.common.misc.BukkitReflectionSerializationUtils;
// import net.anweisen.utilities.common.misc.FileUtils;
// import net.anweisen.utilities.common.misc.GsonUtils;
//
// public class GsonDocument extends AbstractDocument {
//    TypeAdapter NUMBER;
//    public static final Gson GSON;
//    public static final Gson GSON_PRETTY_PRINT;
//    private static boolean cleanupEmptyObjects;
//    private static boolean cleanupEmptyArrays;
//    private static boolean writePrettyJson;
//    protected JsonObject jsonObject;
//
//    public static void setCleanupEmptyArrays(boolean clean) {
//       cleanupEmptyArrays = clean;
//    }
//
//    public static void setCleanupEmptyObjects(boolean clean) {
//       cleanupEmptyObjects = clean;
//    }
//
//    public static void setWritePrettyJson(boolean pretty) {
//       writePrettyJson = pretty;
//    }
//
//    public static boolean isWritePrettyJson() {
//       return writePrettyJson;
//    }
//
//    @Nonnull
//    public static List convertArrayToDocuments(@Nonnull JsonArray array) {
//       List list = new ArrayList(array.size());
//       Iterator var2 = array.iterator();
//
//       while(var2.hasNext()) {
//          JsonElement element = (JsonElement)var2.next();
//          if (element.isJsonObject()) {
//             list.add(new GsonDocument(element.getAsJsonObject()));
//          }
//       }
//
//       return list;
//    }
//
//    @Nonnull
//    public static List convertArrayToStrings(@Nonnull JsonArray array) {
//       List list = new ArrayList(array.size());
//       Iterator var2 = array.iterator();
//
//       while(var2.hasNext()) {
//          JsonElement element = (JsonElement)var2.next();
//          if (element.isJsonObject()) {
//             list.add(element.getAsString());
//          }
//       }
//
//       return list;
//    }
//
//    public GsonDocument(@Nonnull File file) throws IOException {
//       this(FileUtils.newBufferedReader(file));
//    }
//
//    public GsonDocument(@Nonnull Reader reader) throws IOException {
//       this(new BufferedReader(reader));
//    }
//
//    public GsonDocument(@Nonnull BufferedReader reader) throws IOException {
//       this(reader.ready() ? (JsonObject)GSON.fromJson(reader, JsonObject.class) : new JsonObject());
//    }
//
//    public GsonDocument(@Nonnull String json) {
//       this((JsonObject)GSON.fromJson(json, JsonObject.class));
//    }
//
//    public GsonDocument(@Nonnull String json, @Nonnull Document root, @Nullable Document parent) {
//       this((JsonObject)GSON.fromJson(json, JsonObject.class), root, parent);
//    }
//
//    public GsonDocument(@Nullable JsonObject jsonObject) {
//       this.NUMBER = new TypeAdapter() {
//          public void write(JsonWriter out, Number value) throws IOException {
//             out.value(value);
//          }
//
//          public Number read(JsonReader in) throws IOException {
//             JsonToken jsonToken = in.peek();
//             switch(jsonToken) {
//             case NUMBER:
//             case STRING:
//                return new LazilyParsedNumber(in.nextString());
//             case BOOLEAN:
//             default:
//                throw new JsonSyntaxException("Expecting number, got: " + jsonToken);
//             case NULL:
//                in.nextNull();
//                return null;
//             }
//          }
//       };
//       this.jsonObject = jsonObject == null ? new JsonObject() : jsonObject;
//    }
//
//    public GsonDocument(@Nullable JsonObject jsonObject, @Nonnull Document root, @Nullable Document parent) {
//       super(root, parent);
//       this.NUMBER = new TypeAdapter() {
//          public void write(JsonWriter out, Number value) throws IOException {
//             out.value(value);
//          }
//
//          public Number read(JsonReader in) throws IOException {
//             JsonToken jsonToken = in.peek();
//             switch(jsonToken) {
//             case NUMBER:
//             case STRING:
//                return new LazilyParsedNumber(in.nextString());
//             case BOOLEAN:
//             default:
//                throw new JsonSyntaxException("Expecting number, got: " + jsonToken);
//             case NULL:
//                in.nextNull();
//                return null;
//             }
//          }
//       };
//       this.jsonObject = jsonObject == null ? new JsonObject() : jsonObject;
//    }
//
//    public GsonDocument(@Nonnull Map values) {
//       this();
//       GsonUtils.setDocumentProperties(GSON, this.jsonObject, values);
//    }
//
//    public GsonDocument() {
//       this(new JsonObject());
//    }
//
//    public GsonDocument(@Nonnull Object object) {
//       this(GSON.toJsonTree(object).getAsJsonObject());
//    }
//
//    @Nullable
//    public String getString(@Nonnull String path) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse((Object)null);
//       return GsonUtils.convertJsonElementToString(element);
//    }
//
//    @Nullable
//    public Object getObject(@Nonnull String path) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse((Object)null);
//       return GsonUtils.unpackJsonElement(element);
//    }
//
//    @Nullable
//    public Object getInstance(@Nonnull String path, @Nonnull Class classOfType) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse((Object)null);
//       return GSON.fromJson(element, classOfType);
//    }
//
//    public Object toInstanceOf(@Nonnull Class classOfT) {
//       return this.isEmpty() ? null : GSON.fromJson(this.jsonObject, classOfT);
//    }
//
//    @Nullable
//    public Object getSerializable(@Nonnull String path, @Nonnull Class classOfT) {
//       return this.getInstance(path, classOfT);
//    }
//
//    @Nonnull
//    public Document getDocument0(@Nonnull String path, @Nonnull Document root, @Nullable Document parent) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse((Object)null);
//       if (element == null || !((JsonElement)element).isJsonObject()) {
//          this.setElement(path, element = new JsonObject());
//       }
//
//       return new GsonDocument(((JsonElement)element).getAsJsonObject(), root, parent);
//    }
//
//    @Nonnull
//    public List getDocumentList(@Nonnull String path) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse(new JsonArray());
//       if (element.isJsonNull()) {
//          return new ArrayList();
//       } else {
//          JsonArray array = element.getAsJsonArray();
//          List documents = new ArrayList(array.size());
//          Iterator var5 = array.iterator();
//
//          while(true) {
//             while(var5.hasNext()) {
//                JsonElement current = (JsonElement)var5.next();
//                if (current != null && !current.isJsonNull()) {
//                   if (current.isJsonObject()) {
//                      documents.add(new GsonDocument(current.getAsJsonObject(), this.root, this));
//                   }
//                } else {
//                   documents.add(new GsonDocument((JsonObject)null, this.root, this));
//                }
//             }
//
//             return documents;
//          }
//       }
//    }
//
//    public char getChar(@Nonnull String path) {
//       return this.getChar(path, '\u0000');
//    }
//
//    public char getChar(@Nonnull String path, char def) {
//       return (Character)this.getPrimitive(path).map(JsonPrimitive::getAsCharacter).orElse(def);
//    }
//
//    public long getLong(@Nonnull String path, long def) {
//       return (Long)this.getPrimitive(path).map(JsonPrimitive::getAsLong).orElse(def);
//    }
//
//    public int getInt(@Nonnull String path, int def) {
//       return (Integer)this.getPrimitive(path).map(JsonPrimitive::getAsInt).orElse(def);
//    }
//
//    public short getShort(@Nonnull String path, short def) {
//       return (Short)this.getPrimitive(path).map(JsonPrimitive::getAsShort).orElse(def);
//    }
//
//    public byte getByte(@Nonnull String path, byte def) {
//       return (Byte)this.getPrimitive(path).map(JsonPrimitive::getAsByte).orElse(def);
//    }
//
//    public double getDouble(@Nonnull String path, double def) {
//       return (Double)this.getPrimitive(path).map(JsonPrimitive::getAsDouble).orElse(def);
//    }
//
//    public float getFloat(@Nonnull String path, float def) {
//       return (Float)this.getPrimitive(path).map(JsonPrimitive::getAsFloat).orElse(def);
//    }
//
//    public boolean getBoolean(@Nonnull String path, boolean def) {
//       return (Boolean)this.getPrimitive(path).map(JsonPrimitive::getAsBoolean).orElse(def);
//    }
//
//    @Nonnull
//    public List getStringList(@Nonnull String path) {
//       JsonElement element = (JsonElement)this.getElement(path).orElse((Object)null);
//       if (element != null && !element.isJsonNull()) {
//          if (element.isJsonPrimitive()) {
//             return new ArrayList(Collections.singletonList(GsonUtils.convertJsonElementToString(element)));
//          } else if (element.isJsonObject()) {
//             throw new IllegalStateException("Cannot extract list out of json object at '" + path + "'");
//          } else {
//             return GsonUtils.convertJsonArrayToStringList(element.getAsJsonArray());
//          }
//       } else {
//          return new ArrayList();
//       }
//    }
//
//    @Nullable
//    public UUID getUUID(@Nonnull String path) {
//       return (UUID)this.getInstance(path, UUID.class);
//    }
//
//    @Nullable
//    public Date getDate(@Nonnull String path) {
//       return (Date)this.getInstance(path, Date.class);
//    }
//
//    @Nullable
//    public OffsetDateTime getDateTime(@Nonnull String path) {
//       return (OffsetDateTime)this.getInstance(path, OffsetDateTime.class);
//    }
//
//    @Nullable
//    public Color getColor(@Nonnull String path) {
//       return (Color)this.getInstance(path, Color.class);
//    }
//
//    @Nullable
//    public Enum getEnum(@Nonnull String path, @Nonnull Class classOfEnum) {
//       return (Enum)this.getInstance(path, classOfEnum);
//    }
//
//    public boolean isList(@Nonnull String path) {
//       return this.checkElement(path, JsonElement::isJsonArray);
//    }
//
//    public boolean isDocument(@Nonnull String path) {
//       return this.checkElement(path, JsonElement::isJsonObject);
//    }
//
//    public boolean isObject(@Nonnull String path) {
//       return this.checkElement(path, JsonElement::isJsonPrimitive);
//    }
//
//    private boolean checkElement(@Nonnull String path, @Nonnull Function check) {
//       return (Boolean)this.getElement(path).map(check).orElse(false);
//    }
//
//    public boolean contains(@Nonnull String path) {
//       return this.getElement(path).isPresent();
//    }
//
//    public int size() {
//       return GsonUtils.getSize(this.jsonObject);
//    }
//
//    public void set0(@Nonnull String path, @Nullable Object value) {
//       this.setElement(path, value);
//    }
//
//    @Nonnull
//    public Document set(@Nonnull Object object) {
//       JsonObject json = GSON.toJsonTree(object).getAsJsonObject();
//       Iterator var3 = json.entrySet().iterator();
//
//       while(var3.hasNext()) {
//          Entry entry = (Entry)var3.next();
//          this.jsonObject.add((String)entry.getKey(), (JsonElement)entry.getValue());
//       }
//
//       return this;
//    }
//
//    public void clear0() {
//       this.jsonObject = new JsonObject();
//    }
//
//    public void remove0(@Nonnull String path) {
//       this.setElement(path, (Object)null);
//    }
//
//    @Nonnull
//    public Map values() {
//       return GsonUtils.convertJsonObjectToMap(this.jsonObject);
//    }
//
//    public void forEach(@Nonnull BiConsumer action) {
//       this.values().forEach(action);
//    }
//
//    @Nonnull
//    public Collection keys() {
//       Collection keys = new ArrayList(this.size());
//       Iterator var2 = this.jsonObject.entrySet().iterator();
//
//       while(var2.hasNext()) {
//          Entry entry = (Entry)var2.next();
//          keys.add(entry.getKey());
//       }
//
//       return keys;
//    }
//
//    @Nonnull
//    private Optional getPrimitive(@Nonnull String path) {
//       Optional var10000 = this.getElement(path);
//       JsonPrimitive.class.getClass();
//       var10000 = var10000.filter(JsonPrimitive.class::isInstance);
//       JsonPrimitive.class.getClass();
//       return var10000.map(JsonPrimitive.class::cast);
//    }
//
//    @Nonnull
//    private Optional getElement(@Nonnull String path) {
//       return this.getElement(path, this.jsonObject);
//    }
//
//    @Nonnull
//    private Optional getElement(@Nonnull String path, @Nonnull JsonObject object) {
//       JsonElement fullPathElement = object.get(path);
//       if (fullPathElement != null) {
//          return Optional.of(fullPathElement);
//       } else {
//          int index = path.indexOf(46);
//          if (index == -1) {
//             return Optional.empty();
//          } else {
//             String child = path.substring(0, index);
//             String newPath = path.substring(index + 1);
//             JsonElement element = object.get(child);
//             return element != null && !element.isJsonNull() ? this.getElement(newPath, element.getAsJsonObject()) : Optional.empty();
//          }
//       }
//    }
//
//    private void setElement(@Nonnull String path, @Nullable Object value) {
//       LinkedList paths = this.determinePath(path);
//       JsonObject object = this.jsonObject;
//
//       for(int i = 0; i < paths.size() - 1; ++i) {
//          String current = (String)paths.get(i);
//          JsonElement element = object.get(current);
//          if (element == null || ((JsonElement)element).isJsonNull()) {
//             if (value == null) {
//                return;
//             }
//
//             object.add(current, (JsonElement)(element = new JsonObject()));
//          }
//
//          if (!((JsonElement)element).isJsonObject()) {
//             throw new IllegalArgumentException("Cannot replace '" + current + "' on '" + path + "'; It's not an object (" + element.getClass().getName() + ")");
//          }
//
//          object = ((JsonElement)element).getAsJsonObject();
//       }
//
//       String lastPath = (String)paths.getLast();
//       JsonElement jsonValue = value instanceof JsonElement ? (JsonElement)value : (value == null ? JsonNull.INSTANCE : (value instanceof Number ? this.NUMBER.toJsonTree((Number)value) : (value instanceof Boolean ? TypeAdapters.BOOLEAN.toJsonTree((Boolean)value) : (value instanceof Character ? TypeAdapters.CHARACTER.toJsonTree((Character)value) : GSON.toJsonTree(value)))));
//       object.add(lastPath, (JsonElement)jsonValue);
//    }
//
//    @Nonnull
//    private LinkedList determinePath(@Nonnull String path) {
//       LinkedList paths = new LinkedList();
//       String pathCopy = path;
//
//       int index;
//       while((index = pathCopy.indexOf(46)) != -1) {
//          String child = pathCopy.substring(0, index);
//          pathCopy = pathCopy.substring(index + 1);
//          paths.add(child);
//       }
//
//       paths.add(pathCopy);
//       return paths;
//    }
//
//    @Nonnull
//    public String toJson() {
//       return GSON.toJson(this.jsonObject);
//    }
//
//    @Nonnull
//    public String toPrettyJson() {
//       return GSON_PRETTY_PRINT.toJson(this.jsonObject);
//    }
//
//    public String toString() {
//       return this.toJson();
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          GsonDocument that = (GsonDocument)o;
//          return this.jsonObject.equals(that.jsonObject);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return this.jsonObject.hashCode();
//    }
//
//    public void write(@Nonnull Writer writer) throws IOException {
//       this.cleanup();
//       (writePrettyJson ? GSON_PRETTY_PRINT : GSON).toJson(this.jsonObject, writer);
//    }
//
//    @Nonnull
//    public JsonObject getJsonObject() {
//       return this.jsonObject;
//    }
//
//    public boolean isReadonly() {
//       return false;
//    }
//
//    public void cleanup() {
//       cleanup(this.jsonObject);
//    }
//
//    public static void cleanup(@Nonnull JsonObject jsonObject) {
//       Iterator iterator = jsonObject.entrySet().iterator();
//
//       while(iterator.hasNext()) {
//          Entry entry = (Entry)iterator.next();
//          JsonElement value = (JsonElement)entry.getValue();
//          if (value.isJsonObject()) {
//             cleanup(value.getAsJsonObject());
//          }
//
//          if (cleanupEmptyObjects && value.isJsonObject() && GsonUtils.getSize(value.getAsJsonObject()) == 0) {
//             iterator.remove();
//          }
//
//          if (cleanupEmptyArrays && value.isJsonArray() && value.getAsJsonArray().size() == 0) {
//             iterator.remove();
//          }
//       }
//
//    }
//
//    static {
//       GsonBuilder builder = (new GsonBuilder()).disableHtmlEscaping().registerTypeAdapterFactory(GsonTypeAdapter.newPredictableFactory(BukkitReflectionSerializationUtils::isSerializable, new BukkitReflectionSerializableTypeAdapter())).registerTypeAdapterFactory(GsonTypeAdapter.newTypeHierarchyFactory(Document.class, new DocumentTypeAdapter())).registerTypeAdapterFactory(GsonTypeAdapter.newTypeHierarchyFactory(Pair.class, new PairTypeAdapter())).registerTypeAdapterFactory(GsonTypeAdapter.newTypeHierarchyFactory(Class.class, new ClassTypeAdapter())).registerTypeAdapterFactory(GsonTypeAdapter.newTypeHierarchyFactory(Color.class, new ColorTypeAdapter()));
//       GSON = builder.create();
//       GSON_PRETTY_PRINT = builder.setPrettyPrinting().create();
//       cleanupEmptyObjects = false;
//       cleanupEmptyArrays = false;
//       writePrettyJson = true;
//    }
// }
//
