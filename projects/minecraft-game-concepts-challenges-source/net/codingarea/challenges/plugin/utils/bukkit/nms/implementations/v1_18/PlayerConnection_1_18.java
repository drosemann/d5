package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_18;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13.PlayerConnection_1_13;

public class PlayerConnection_1_18 extends PlayerConnection_1_13 {
   public PlayerConnection_1_18(Object connection) throws ClassNotFoundException {
      super(connection);
   }

   public void sendPacket(Object packet) {
      try {
         ReflectionUtil.invokeMethod(this.connection, "a", new Class[]{this.nmsClass}, new Object[]{packet});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to send packet {}:", new Object[]{packet.getClass().getSimpleName(), var3});
      }

   }
}
