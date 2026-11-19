package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.WorldServer;
import org.bukkit.World;

public class WorldServer_1_13 extends WorldServer {
   public WorldServer_1_13(World object) throws ClassNotFoundException {
      super(object, ReflectionUtil.getBukkitClass("CraftWorld"));
   }

   public Object get(World world) {
      Object worldServer;
      try {
         worldServer = ReflectionUtil.invokeMethod((Class)this.nmsClass, (Object)world, (String)"getHandle");
      } catch (Exception var4) {
         Challenges.getInstance().getLogger().error("Failed to get WorldServer:", new Object[]{var4});
         worldServer = null;
      }

      return worldServer;
   }
}
