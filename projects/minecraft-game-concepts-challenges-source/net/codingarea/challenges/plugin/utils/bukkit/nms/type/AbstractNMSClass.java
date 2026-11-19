package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

public abstract class AbstractNMSClass {
   protected final Class nmsClass;

   public AbstractNMSClass(Class nmsClass) {
      this.nmsClass = nmsClass;
   }

   public Class getNMSClass() {
      return this.nmsClass;
   }
}
