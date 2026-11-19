package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;

import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.CraftPlayer;
import org.bukkit.entity.Player;

public class CraftPlayer_1_13 extends CraftPlayer {
   public CraftPlayer_1_13(Player player) throws ClassNotFoundException {
      super(ReflectionUtil.getBukkitClass("entity.CraftPlayer"), player);
   }

   public Object get(Player player) {
      Object craftPlayer;
      try {
         craftPlayer = ReflectionUtil.invokeMethod((Class)this.nmsClass, (Object)player, (String)"getHandle");
      } catch (Exception var4) {
         Challenges.getInstance().getLogger().error("Failed to create CraftPlayer:", new Object[]{var4});
         craftPlayer = null;
      }

      return craftPlayer;
   }

   public Object getPlayerConnectionObject() {
      try {
         return ReflectionUtil.getObject(this.nmsObject, "playerConnection");
      } catch (Exception var2) {
         Challenges.getInstance().getLogger().error("Failed to get the playerConnection object:", new Object[]{var2});
         return null;
      }
   }
}
