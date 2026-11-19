// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/access/CachedDatabaseAccess.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/access/CachedDatabaseAccess.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/access/CachedDatabaseAccess.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database.access;
//
// import java.util.Map;
// import java.util.Optional;
// import java.util.concurrent.ConcurrentHashMap;
// import java.util.function.BiFunction;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.Propertyable;
// import net.anweisen.utilities.database.Database;
// import net.anweisen.utilities.database.exceptions.DatabaseException;
//
// public class CachedDatabaseAccess extends DirectDatabaseAccess {
//    protected final Map cache = new ConcurrentHashMap();
//
//    public CachedDatabaseAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config, @Nonnull BiFunction mapper) {
//       super(database, config, mapper);
//    }
//
//    @Nullable
//    public Object getValue(@Nonnull String key) throws DatabaseException {
//       Object value = this.cache.get(key);
//       if (value != null) {
//          return value;
//       } else {
//          value = super.getValue(key);
//          this.cache.put(key, value);
//          return value;
//       }
//    }
//
//    @Nonnull
//    public Object getValue(@Nonnull String key, @Nonnull Object def) throws DatabaseException {
//       Object value = this.cache.get(key);
//       if (value != null) {
//          return value;
//       } else {
//          value = super.getValue(key, def);
//          this.cache.put(key, value);
//          return value;
//       }
//    }
//
//    @Nonnull
//    public Optional getValueOptional(@Nonnull String key) throws DatabaseException {
//       Object cached = this.cache.get(key);
//       return cached != null ? Optional.of(cached) : super.getValueOptional(key);
//    }
//
//    public void setValue(@Nonnull String key, @Nullable Object value) throws DatabaseException {
//       this.cache.put(key, value);
//       super.setValue(key, value);
//    }
//
//    @Nonnull
//    public static CachedDatabaseAccess newStringAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config) {
//       return new CachedDatabaseAccess(database, config, Propertyable::getString);
//    }
//
//    @Nonnull
//    public static CachedDatabaseAccess newIntAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config) {
//       return new CachedDatabaseAccess(database, config, Propertyable::getInt);
//    }
//
//    @Nonnull
//    public static CachedDatabaseAccess newLongAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config) {
//       return new CachedDatabaseAccess(database, config, Propertyable::getLong);
//    }
//
//    @Nonnull
//    public static CachedDatabaseAccess newDoubleAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config) {
//       return new CachedDatabaseAccess(database, config, Propertyable::getDouble);
//    }
//
//    @Nonnull
//    public static CachedDatabaseAccess newDocumentAccess(@Nonnull Database database, @Nonnull DatabaseAccessConfig config) {
//       return new CachedDatabaseAccess(database, config, Document::getDocument);
//    }
// }
//
