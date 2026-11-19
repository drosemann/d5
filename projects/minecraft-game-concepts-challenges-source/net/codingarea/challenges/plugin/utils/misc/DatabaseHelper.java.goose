// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/DatabaseHelper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/DatabaseHelper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/DatabaseHelper.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import com.mojang.authlib.GameProfile;
// import com.mojang.authlib.properties.Property;
// import com.mojang.authlib.properties.PropertyMap;
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.UUID;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.bukkit.utils.misc.GameProfileUtils;
// import net.codingarea.challenges.plugin.Challenges;
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
//
// public final class DatabaseHelper {
//    private static final Map cachedTextures = new HashMap();
//
//    private DatabaseHelper() {
//    }
//
//    @Nullable
//    public static String getPlayerTextures(@Nonnull Player player) {
//       GameProfile profile = GameProfileUtils.getGameProfile(player);
//       PropertyMap properties = profile.getProperties();
//       List textures = new ArrayList(properties.get("textures"));
//       return textures.isEmpty() ? null : ((Property)textures.get(0)).getValue();
//    }
//
//    public static void savePlayerData(@Nonnull Player player) {
//       try {
//          String textures = getPlayerTextures(player);
//          if (textures != null) {
//             cachedTextures.put(player.getUniqueId(), textures);
//          }
//
//          Challenges.getInstance().getDatabaseManager().getDatabase().insertOrUpdate("challenges").set("textures", textures).set("name", player.getName()).where("uuid", (Object)player.getUniqueId()).execute();
//       } catch (Exception var2) {
//          Logger.error("Unable to update textures for {} | {}", player.getName(), player.getUniqueId(), var2);
//       }
//
//    }
//
//    @Nullable
//    public static String getTextures(@Nonnull UUID uuid) {
//       String cached = (String)cachedTextures.get(uuid);
//       if (cached != null) {
//          return cached;
//       } else {
//          Player player = Bukkit.getPlayer(uuid);
//          String textures;
//          if (player != null) {
//             textures = getPlayerTextures(player);
//             if (textures != null) {
//                cachedTextures.put(uuid, textures);
//                return textures;
//             }
//          }
//
//          if (!Challenges.getInstance().getDatabaseManager().isConnected()) {
//             return null;
//          } else {
//             try {
//                textures = Challenges.getInstance().getDatabaseManager().getDatabase().query("challenges").select("textures").where("uuid", (Object)uuid).execute().firstOrEmpty().getString("textures");
//                cachedTextures.put(uuid, textures);
//                return textures;
//             } catch (Exception var4) {
//                Logger.error("Unable to get textures for {}", uuid, var4);
//                return null;
//             }
//          }
//       }
//    }
//
//    public static void clearCache(@Nonnull UUID uuid) {
//       cachedTextures.remove(uuid);
//    }
// }
//
