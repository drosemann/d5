package net.codingarea.challenges.plugin.management.cloud.support;

import de.dytanic.cloudnet.driver.CloudNetDriver;
import de.dytanic.cloudnet.driver.permission.IPermissionGroup;
import de.dytanic.cloudnet.driver.permission.IPermissionManagement;
import de.dytanic.cloudnet.driver.permission.IPermissionUser;
import de.dytanic.cloudnet.ext.bridge.BridgeHelper;
import de.dytanic.cloudnet.ext.bridge.bukkit.BukkitCloudNetHelper;
import java.util.UUID;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.management.cloud.CloudSupport;
import org.bukkit.entity.Player;

public final class CloudNet3Support implements CloudSupport {
   @Nonnull
   public String getColoredName(@Nonnull Player player) {
      return this.getColoredName(player.getUniqueId());
   }

   @Nonnull
   public String getColoredName(@Nonnull UUID uuid) {
      IPermissionManagement management = CloudNetDriver.getInstance().getPermissionManagement();
      IPermissionUser user = management.getUser(uuid);
      if (user == null) {
         return "Unknown CloudPlayer";
      } else {
         IPermissionGroup group = management.getHighestPermissionGroup(user);
         String color = group.getColor();
         return color.replace('&', '§') + user.getName();
      }
   }

   public boolean hasNameFor(@Nonnull UUID uuid) {
      return CloudNetDriver.getInstance().getPermissionManagement().getUser(uuid) != null;
   }

   public void startNewService() {
      BukkitCloudNetHelper.changeToIngame();
   }

   public void setIngame() {
      BukkitCloudNetHelper.setState("INGAME");
      BridgeHelper.updateServiceInfo();
   }

   public void setLobby() {
      BukkitCloudNetHelper.setState("LOBBY");
      BridgeHelper.updateServiceInfo();
   }
}
