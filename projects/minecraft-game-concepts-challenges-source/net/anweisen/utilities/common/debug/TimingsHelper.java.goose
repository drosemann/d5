// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/debug/TimingsHelper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/debug/TimingsHelper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/debug/TimingsHelper.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.debug;
//
// import java.util.Map;
// import java.util.concurrent.ConcurrentHashMap;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.collection.NumberFormatter;
// import net.anweisen.utilities.common.logging.ILogger;
// import net.anweisen.utilities.common.misc.ReflectionUtils;
//
// public final class TimingsHelper {
//    public static final ILogger LOGGER = ILogger.forThisClass();
//    private static final Map timings = new ConcurrentHashMap();
//
//    private TimingsHelper() {
//    }
//
//    public static void start(@Nonnull String id) {
//       timings.put(id, System.currentTimeMillis());
//    }
//
//    public static void stop(@Nonnull String id) {
//       Long start = (Long)timings.remove(id);
//       if (start == null) {
//          LOGGER.warn("Stopped timing {} which was not started before", id);
//       } else {
//          long time = System.currentTimeMillis() - start;
//          LOGGER.debug("Finished timings '{}' within {}ms ({}s)", id, time, NumberFormatter.DOUBLE_FLOATING_POINT.format((double)time / 1000.0D));
//       }
//    }
//
//    public static void restart(@Nonnull String id) {
//       stop(id);
//       start(id);
//    }
//
//    public static void start() {
//       start(ReflectionUtils.getCallerName());
//    }
//
//    public static void stop() {
//       stop(ReflectionUtils.getCallerName());
//    }
//
//    public static void restart() {
//       restart(ReflectionUtils.getCallerName());
//    }
// }
//
