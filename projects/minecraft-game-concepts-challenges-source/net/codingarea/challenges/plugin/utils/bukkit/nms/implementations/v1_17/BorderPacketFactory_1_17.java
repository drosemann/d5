package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_17;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSUtils;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.BorderPacketFactory;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.PacketBorder;

public class BorderPacketFactory_1_17 extends BorderPacketFactory {
   public Object center(PacketBorder packetBorder) {
      return this.createPacket(packetBorder, "ClientboundSetBorderCenterPacket");
   }

   public Object size(PacketBorder packetBorder) {
      return this.createPacket(packetBorder, "ClientboundSetBorderSizePacket");
   }

   public Object warningDelay(PacketBorder packetBorder) {
      return this.createPacket(packetBorder, "ClientboundSetBorderWarningDelayPacket");
   }

   public Object warningDistance(PacketBorder packetBorder) {
      return this.createPacket(packetBorder, "ClientboundSetBorderWarningDistancePacket");
   }

   private Object createPacket(PacketBorder packetBorder, String className) {
      Class clazz = NMSUtils.getClass("network.protocol.game." + className);

      try {
         return ReflectionUtil.invokeConstructor(clazz, new Class[]{packetBorder.getNMSClass()}, new Object[]{packetBorder.getWorldBorderObject()});
      } catch (Exception var5) {
         Challenges.getInstance().getLogger().error("Failed to create packet {}:", new Object[]{className, var5});
         return null;
      }
   }
}
