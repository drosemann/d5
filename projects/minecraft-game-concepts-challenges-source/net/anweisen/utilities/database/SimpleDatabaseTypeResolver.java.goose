// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/SimpleDatabaseTypeResolver.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/SimpleDatabaseTypeResolver.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/database/SimpleDatabaseTypeResolver.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.database;
//
// import java.util.HashMap;
// import java.util.Map;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.misc.ReflectionUtils;
//
// public final class SimpleDatabaseTypeResolver {
//    private static final Map registry = new HashMap();
//
//    private SimpleDatabaseTypeResolver() {
//    }
//
//    @Nullable
//    public static Class findDatabaseType(@Nonnull String name) {
//       return ReflectionUtils.getClassOrNull((String)registry.get(name));
//    }
//
//    @Nullable
//    public static Class findDatabaseType(@Nonnull String name, boolean initialize, @Nonnull ClassLoader classLoader) {
//       return ReflectionUtils.getClassOrNull((String)registry.get(name), initialize, classLoader);
//    }
//
//    public static void registerType(@Nonnull String name, @Nonnull String className) {
//       registry.put(name, className);
//    }
//
//    public static void registerType(@Nonnull String name, @Nonnull Class databaseClass) {
//       registerType(name, databaseClass.getName());
//    }
//
//    static {
//       registerType("mongodb", "net.anweisen.utilities.database.internal.mongodb.MongoDBDatabase");
//       registerType("mysql", "net.anweisen.utilities.database.internal.sql.mysql.MySQLDatabase");
//       registerType("sqlite", "net.anweisen.utilities.database.internal.sql.sqlite.SQLiteDatabase");
//    }
// }
//
