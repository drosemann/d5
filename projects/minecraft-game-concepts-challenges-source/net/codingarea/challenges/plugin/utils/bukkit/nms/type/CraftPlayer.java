package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSProvider;
import org.bukkit.entity.Player;

public abstract class CraftPlayer extends BukkitNMSClass {
   public CraftPlayer(Class nmsClass, Player player) {
      super(nmsClass, player);
   }

   public abstract Object getPlayerConnectionObject();

   public PlayerConnection getConnection() {
      return NMSProvider.createPlayerConnection(this);
   }
}
