package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

import org.bukkit.World;

public abstract class WorldServer extends BukkitNMSClass {
   protected WorldServer(World object, Class nmsClass) {
      super(nmsClass, object);
   }

   public Object getWorldServerObject() {
      return this.nmsObject;
   }
}
