package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_18;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_17.PacketBorder_1_17;
import org.bukkit.World;

public class PacketBorder_1_18 extends PacketBorder_1_17 {
   public PacketBorder_1_18(World world) {
      super(world);
   }

   protected void setCenterField(double x, double z) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "c", new Class[]{Double.TYPE, Double.TYPE}, new Object[]{x, z});
      } catch (Exception var6) {
         Challenges.getInstance().getLogger().error("Failed to set center:", new Object[]{var6});
      }

   }

   protected void setSizeField(double size) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "a", new Class[]{Double.TYPE}, new Object[]{size});
      } catch (Exception var4) {
         Challenges.getInstance().getLogger().error("Failed to set size:", new Object[]{var4});
      }

   }

   protected void setWarningDistanceField(int warningDistance) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "c", new Class[]{Integer.TYPE}, new Object[]{warningDistance});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to set warning distance:", new Object[]{var3});
      }

   }

   protected void setWarningTimeField(int warningTime) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "b", new Class[]{Integer.TYPE}, new Object[]{warningTime});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("Failed to set warning time:", new Object[]{var3});
      }

   }

   protected void transitionSizeBetween(double oldSize, double newSize, long animationTime) {
      try {
         ReflectionUtil.invokeMethod(this.worldBorder, "a", new Class[]{Double.TYPE, Double.TYPE, Long.TYPE}, new Object[]{oldSize, newSize, animationTime});
      } catch (Exception var8) {
         Challenges.getInstance().getLogger().error("Failed to set size:", new Object[]{var8});
      }

   }
}
