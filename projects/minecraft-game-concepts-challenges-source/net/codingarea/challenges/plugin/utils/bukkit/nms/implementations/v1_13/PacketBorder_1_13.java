package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSProvider;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSUtils;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.CraftPlayer;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.PacketBorder;
import org.bukkit.World;
import org.bukkit.entity.Player;

public class PacketBorder_1_13 extends PacketBorder {
   protected PacketBorder_1_13(World world, Class nmsClass) {
      super(nmsClass, world);
   }

   public PacketBorder_1_13(World world) {
      this(world, NMSUtils.getClass("WorldBorder"));
   }

   protected Object createWorldBorder() {
      try {
         return ReflectionUtil.invokeConstructor(this.nmsClass);
      } catch (Exception var2) {
         Challenges.getInstance().getLogger().error("Failed to create world border:", new Object[]{var2});
         return null;
      }
   }

   protected void setWorld(World world) {
      try {
         ReflectionUtil.setFieldValue(this.worldBorder, "world", this.getWorldServer(world));
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to set world:", new Object[]{var3});
      }

   }

   protected void setSizeField(double size) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "setSize", new Class[]{Double.TYPE}, new Object[]{size});
      } catch (Exception var4) {
         Challenges.getInstance().getLogger().error("Failed to set border size:", new Object[]{var4});
      }

   }

   protected void transitionSizeBetween(double oldSize, double newSize, long animationTime) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "transitionSizeBetween", new Class[]{Double.TYPE, Double.TYPE, Long.TYPE}, new Object[]{oldSize, newSize, animationTime});
      } catch (Exception var8) {
         Challenges.getInstance().getLogger().error("Failed to set border size:", new Object[]{var8});
      }

   }

   protected void setCenterField(double x, double z) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "setCenter", new Class[]{Double.TYPE, Double.TYPE}, new Object[]{x, z});
      } catch (Exception var6) {
         Challenges.getInstance().getLogger().error("Failed to set border center:", new Object[]{var6});
      }

   }

   protected void setWarningTimeField(int warningTime) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "setWarningTime", new Class[]{Integer.TYPE}, new Object[]{warningTime});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to set border warning time:", new Object[]{var3});
      }

   }

   protected void setWarningDistanceField(int warningDistance) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "setWarningDistance", new Class[]{Integer.TYPE}, new Object[]{warningDistance});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to set border warning distance:", new Object[]{var3});
      }

   }

   public void send(Player player, PacketBorder.UpdateType updateType) {
      try {
         Object packet = updateType.createPacket(this);
         CraftPlayer craftPlayer = NMSProvider.createCraftPlayer(player);
         craftPlayer.getConnection().sendPacket(packet);
      } catch (Exception var5) {
         Challenges.getInstance().getLogger().error("Failed to send update {} to player {}:", new Object[]{updateType.name(), player.getName(), var5});
      }

   }
}
