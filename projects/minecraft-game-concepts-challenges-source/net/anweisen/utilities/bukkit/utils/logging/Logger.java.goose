// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/logging/Logger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/logging/Logger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/logging/Logger.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.logging;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.core.BukkitModule;
// import net.anweisen.utilities.common.logging.ILogger;
// import net.anweisen.utilities.common.misc.ReflectionUtils;
//
// public final class Logger {
//    private Logger() {
//    }
//
//    @Nonnull
//    public static ILogger getInstance() {
//       return BukkitModule.getProvidingModule(ReflectionUtils.getCaller()).getLogger();
//    }
//
//    public static void error(@Nullable Object message, @Nonnull Object... args) {
//       getInstance().error(message, args);
//    }
//
//    public static void warn(@Nullable Object message, @Nonnull Object... args) {
//       getInstance().warn(message, args);
//    }
//
//    public static void info(@Nullable Object message, @Nonnull Object... args) {
//       getInstance().info(message, args);
//    }
//
//    public static void debug(@Nullable Object message, @Nonnull Object... args) {
//       getInstance().debug(message, args);
//    }
//
//    public static void trace(@Nullable Object message, @Nonnull Object... args) {
//       getInstance().trace(message, args);
//    }
// }
//
