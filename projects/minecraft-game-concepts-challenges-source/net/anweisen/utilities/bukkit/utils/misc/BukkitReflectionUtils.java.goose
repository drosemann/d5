// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/BukkitReflectionUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/BukkitReflectionUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/BukkitReflectionUtils.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.misc;
//
// import com.google.common.base.Preconditions;
// import java.lang.reflect.Method;
// import java.util.regex.Pattern;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.logging.ILogger;
// import org.bukkit.Material;
// import org.bukkit.NamespacedKey;
// import org.bukkit.World;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.Player;
// import org.bukkit.plugin.Plugin;
//
// public final class BukkitReflectionUtils {
//    private static final ILogger logger = ILogger.forThisClass();
//    private static final Pattern VALID_KEY = Pattern.compile("[a-z0-9/._-]+");
//
//    private BukkitReflectionUtils() {
//    }
//
//    public static double getAbsorptionAmount(@Nonnull Player player) {
//       Class classOfPlayer = player.getClass();
//
//       try {
//          return player.getAbsorptionAmount();
//       } catch (Throwable var7) {
//          try {
//             Method getHandleMethod = classOfPlayer.getMethod("getHandle");
//             getHandleMethod.setAccessible(true);
//             Object handle = getHandleMethod.invoke(player);
//             Class classOfHandle = handle.getClass();
//             Method getAbsorptionMethod = classOfHandle.getMethod("getAbsorptionHearts");
//             getAbsorptionMethod.setAccessible(true);
//             return (double)(Float)getAbsorptionMethod.invoke(handle);
//          } catch (Throwable var6) {
//             logger.warn("Could not get absorption amount for player of class {}", classOfPlayer.getName());
//             return 0.0D;
//          }
//       }
//    }
//
//    public static boolean isAir(@Nonnull Material material) {
//       try {
//          return material.isAir();
//       } catch (Throwable var3) {
//          String var1 = material.name();
//          byte var2 = -1;
//          switch(var1.hashCode()) {
//          case -1188197377:
//             if (var1.equals("VOID_AIR")) {
//                var2 = 1;
//             }
//             break;
//          case 64810:
//             if (var1.equals("AIR")) {
//                var2 = 0;
//             }
//             break;
//          case 831457204:
//             if (var1.equals("LEGACY_AIR")) {
//                var2 = 3;
//             }
//             break;
//          case 891097464:
//             if (var1.equals("CAVE_AIR")) {
//                var2 = 2;
//             }
//          }
//
//          switch(var2) {
//          case 0:
//          case 1:
//          case 2:
//          case 3:
//             return true;
//          default:
//             return false;
//          }
//       }
//    }
//
//    public static int getMinHeight(@Nonnull World world) {
//       try {
//          return world.getMinHeight();
//       } catch (Throwable var2) {
//          return 0;
//       }
//    }
//
//    /** @deprecated */
//    @Deprecated
//    public static boolean isInWater(@Nonnull Entity entity) {
//       try {
//          return entity.isInWater();
//       } catch (Throwable var2) {
//          return false;
//       }
//    }
//
//    @Nullable
//    public static NamespacedKey fromString(@Nonnull String key) {
//       return fromString(key, (Plugin)null);
//    }
//
//    @Nullable
//    public static NamespacedKey fromString(@Nonnull String string, @Nullable Plugin defaultNamespace) {
//       Preconditions.checkArgument(string != null && !string.isEmpty(), "Input string must not be empty or null");
//       String[] components = string.split(":", 3);
//       if (components.length > 2) {
//          return null;
//       } else {
//          String key = components.length == 2 ? components[1] : "";
//          String namespace;
//          if (components.length == 1) {
//             namespace = components[0];
//             if (!namespace.isEmpty() && VALID_KEY.matcher(namespace).matches()) {
//                return defaultNamespace != null ? new NamespacedKey(defaultNamespace, namespace) : NamespacedKey.minecraft(namespace);
//             } else {
//                return null;
//             }
//          } else if (components.length == 2 && !VALID_KEY.matcher(key).matches()) {
//             return null;
//          } else {
//             namespace = components[0];
//             if (namespace.isEmpty()) {
//                return defaultNamespace != null ? new NamespacedKey(defaultNamespace, key) : NamespacedKey.minecraft(key);
//             } else {
//                return !VALID_KEY.matcher(namespace).matches() ? null : new NamespacedKey(namespace, key);
//             }
//          }
//       }
//    }
// }
//
