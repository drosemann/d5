// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/NameHelper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/NameHelper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/NameHelper.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.management.cloud.CloudSupportManager;
// import org.bukkit.OfflinePlayer;
//
// public final class NameHelper {
//    private NameHelper() {
//    }
//
//    @Nonnull
//    public static String getName(@Nonnull OfflinePlayer player) {
//       CloudSupportManager cloudSupport = Challenges.getInstance().getCloudSupportManager();
//       if (cloudSupport.isNameSupport() && cloudSupport.hasNameFor(player.getUniqueId())) {
//          return player.isOnline() && player.getPlayer() != null ? cloudSupport.getColoredName(player.getPlayer()) : cloudSupport.getColoredName(player.getUniqueId());
//       } else {
//          return player.getName() == null ? "" : player.getName();
//       }
//    }
// }
//
