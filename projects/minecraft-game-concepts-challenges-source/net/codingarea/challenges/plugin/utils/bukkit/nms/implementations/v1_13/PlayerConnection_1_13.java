package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSUtils;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.PlayerConnection;

public class PlayerConnection_1_13 extends PlayerConnection {
   public PlayerConnection_1_13(Object connection) throws ClassNotFoundException {
      super(NMSUtils.getClass("network.protocol.Packet"), connection);
   }

   public void sendPacket(Object packet) {
      try {
         ReflectionUtil.invokeMethod(this.connection, "sendPacket", new Class[]{this.nmsClass}, new Object[]{packet});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to send packet {}:", new Object[]{packet.getClass().getSimpleName(), var3});
      }

   }
}
