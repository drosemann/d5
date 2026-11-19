package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

public abstract class BukkitNMSClass extends AbstractNMSClass {
   public Object nmsObject;

   public BukkitNMSClass(Class nmsClass, Object bukkitObject) {
      super(nmsClass);
      this.nmsObject = this.get(bukkitObject);
   }

   public abstract Object get(Object var1);
}
