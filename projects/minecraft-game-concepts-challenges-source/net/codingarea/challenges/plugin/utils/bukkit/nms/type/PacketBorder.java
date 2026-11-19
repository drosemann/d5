package net.codingarea.challenges.plugin.utils.bukkit.nms.type;

import java.util.Objects;
import java.util.function.Function;
import lombok.Generated;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSProvider;
import org.bukkit.World;
import org.bukkit.WorldBorder;
import org.bukkit.entity.Player;

public abstract class PacketBorder extends AbstractNMSClass {
   protected Object worldBorder;
   protected final World world;
   protected double size = 0.0D;
   protected double centerX = 0.0D;
   protected double centerZ = 0.0D;
   protected int warningTime = 0;
   protected int warningDistance = 0;

   public PacketBorder(Class nmsClass, World world) {
      super(nmsClass);
      this.world = world;
      this.worldBorder = this.createWorldBorder();
      this.setWorld(world);
   }

   protected abstract Object createWorldBorder();

   protected abstract void setWorld(World var1);

   public void setSize(double size) {
      this.size = size;
      this.setSizeField(size);
   }

   public void setSize(double size, long animationTime) {
      animationTime *= 1000L;
      this.transitionSizeBetween(this.size, size, animationTime);
      this.size = size;
   }

   protected abstract void setSizeField(double var1);

   protected abstract void transitionSizeBetween(double var1, double var3, long var5);

   public void setCenter(double x, double z) {
      this.centerX = x;
      this.centerZ = z;
      this.setCenterField(x, z);
   }

   protected abstract void setCenterField(double var1, double var3);

   public void setWarningTime(int warningTime) {
      this.warningTime = warningTime;
      this.setWarningTimeField(warningTime);
   }

   protected abstract void setWarningTimeField(int var1);

   public void setWarningDistance(int warningDistance) {
      this.warningDistance = warningDistance;
      this.setWarningDistanceField(warningDistance);
   }

   protected abstract void setWarningDistanceField(int var1);

   protected Object getWorldServer(World world) {
      return NMSProvider.createWorldServer(world).getWorldServerObject();
   }

   public void reset(Player player) {
      WorldBorder border = player.getWorld().getWorldBorder();
      this.setSize(border.getSize());
      this.setCenter(border.getCenter().getX(), border.getCenter().getZ());
      this.setWarningTime(border.getWarningTime());
      this.setWarningDistance(border.getWarningDistance());
      this.send(player, PacketBorder.UpdateType.values());
   }

   public void send(Player player) {
      this.send(player, PacketBorder.UpdateType.values());
   }

   public void send(Player player, PacketBorder.UpdateType... updateTypes) {
      PacketBorder.UpdateType[] var3 = updateTypes;
      int var4 = updateTypes.length;

      for(int var5 = 0; var5 < var4; ++var5) {
         PacketBorder.UpdateType updateType = var3[var5];
         this.send(player, updateType);
      }

   }

   public abstract void send(Player var1, PacketBorder.UpdateType var2);

   public Object getWorldBorderObject() {
      return this.worldBorder;
   }

   @Generated
   public double getSize() {
      return this.size;
   }

   @Generated
   public double getCenterX() {
      return this.centerX;
   }

   @Generated
   public double getCenterZ() {
      return this.centerZ;
   }

   @Generated
   public int getWarningTime() {
      return this.warningTime;
   }

   @Generated
   public int getWarningDistance() {
      return this.warningDistance;
   }

   public static enum UpdateType {
      CENTER,
      SIZE,
      WARNING_DELAY,
      WARNING_DISTANCE;

      private final Function packetFactory;

      private UpdateType(Function packetFactory) {
         this.packetFactory = packetFactory;
      }

      public Object createPacket(PacketBorder border) {
         return this.packetFactory.apply(border);
      }

      // $FF: synthetic method
      private static PacketBorder.UpdateType[] $values() {
         return new PacketBorder.UpdateType[]{CENTER, SIZE, WARNING_DELAY, WARNING_DISTANCE};
      }

      static {
         BorderPacketFactory var10004 = NMSProvider.getBorderPacketFactory();
         Objects.requireNonNull(var10004);
         CENTER = new PacketBorder.UpdateType("CENTER", 0, var10004::center);
         var10004 = NMSProvider.getBorderPacketFactory();
         Objects.requireNonNull(var10004);
         SIZE = new PacketBorder.UpdateType("SIZE", 1, var10004::size);
         var10004 = NMSProvider.getBorderPacketFactory();
         Objects.requireNonNull(var10004);
         WARNING_DELAY = new PacketBorder.UpdateType("WARNING_DELAY", 2, var10004::warningDelay);
         var10004 = NMSProvider.getBorderPacketFactory();
         Objects.requireNonNull(var10004);
         WARNING_DISTANCE = new PacketBorder.UpdateType("WARNING_DISTANCE", 3, var10004::warningDistance);
      }
   }
}
