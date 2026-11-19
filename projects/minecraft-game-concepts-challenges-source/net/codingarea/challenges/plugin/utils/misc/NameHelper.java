package net.codingarea.challenges.plugin.utils.misc;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.management.cloud.CloudSupportManager;
import org.bukkit.OfflinePlayer;

public final class NameHelper {
   private NameHelper() {
   }

   @Nonnull
   public static String getName(@Nonnull OfflinePlayer player) {
      CloudSupportManager cloudSupport = Challenges.getInstance().getCloudSupportManager();
      if (cloudSupport.isNameSupport() && cloudSupport.hasNameFor(player.getUniqueId())) {
         return player.isOnline() && player.getPlayer() != null ? cloudSupport.getColoredName(player.getPlayer()) : cloudSupport.getColoredName(player.getUniqueId());
      } else {
         return player.getName() == null ? "" : player.getName();
      }
   }
}
