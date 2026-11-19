package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

public abstract class PlayerConnection extends AbstractNMSClass {
   protected final Object connection;

   public PlayerConnection(Class nmsClass, Object connection) {
      super(nmsClass);
      this.connection = connection;
   }

   public abstract void sendPacket(Object var1);
}
