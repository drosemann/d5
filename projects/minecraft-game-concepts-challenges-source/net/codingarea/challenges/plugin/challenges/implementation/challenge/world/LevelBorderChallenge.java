package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.common.annotations.Since;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.document.GsonDocument;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.challenges.annotations.ExcludeFromRandomChallenges;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSProvider;
import net.codingarea.challenges.plugin.utils.bukkit.nms.type.PacketBorder;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.WorldBorder;
import org.bukkit.World.Environment;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.entity.PlayerDeathEvent;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerLevelChangeEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.event.player.PlayerRespawnEvent;
import org.bukkit.event.player.PlayerTeleportEvent;
import org.bukkit.event.player.PlayerTeleportEvent.TeleportCause;
import org.jetbrains.annotations.NotNull;

@Since("2.2.3")
@ExcludeFromRandomChallenges
public class LevelBorderChallenge extends Setting {
   private final Map worldCenters = new HashMap();
   private final Map playerWorldBorders = new HashMap();
   private final Map packetBorders = new HashMap();
   private final boolean useAPI;
   private UUID bestPlayerUUID;
   private int bestPlayerLevel;

   public LevelBorderChallenge() {
      super(MenuType.CHALLENGES);
      this.useAPI = MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_19);
      this.bestPlayerUUID = null;
      this.bestPlayerLevel = 0;
      this.setCategory(SettingCategory.WORLD);
   }

   protected void onEnable() {
      Iterator var1 = ChallengeAPI.getGameWorlds().iterator();

      while(var1.hasNext()) {
         World world = (World)var1.next();
         if (this.useAPI) {
            this.playerWorldBorders.put(world, Bukkit.createWorldBorder());
         } else {
            this.packetBorders.put(world, NMSProvider.createPacketBorder(world));
         }
      }

      this.bossbar.setContent((bar, player) -> {
         bar.setTitle(Message.forName("bossbar-level-border").asString(this.bestPlayerLevel));
      });
      this.bossbar.show();
      this.updateBorderSize(false);
      this.worldCenters.put(ChallengeAPI.getGameWorld(Environment.NORMAL), this.getDefaultWorldSpawn());
   }

   protected void onDisable() {
      this.borderReset();
      this.bossbar.hide();
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.ENCHANTING_TABLE, Message.forName("item-level-border-challenges"));
   }

   public void checkBorderSize(boolean animate) {
      Player currentBestPlayer = this.bestPlayerUUID != null ? Bukkit.getPlayer(this.bestPlayerUUID) : null;
      Iterator var3 = ChallengeAPI.getIngamePlayers().iterator();

      while(true) {
         while(true) {
            while(var3.hasNext()) {
               Player player = (Player)var3.next();
               int level = player.getLevel();
               if (this.bestPlayerUUID != null && currentBestPlayer != null) {
                  if (level <= this.bestPlayerLevel && level <= currentBestPlayer.getLevel()) {
                     if (player.getUniqueId().equals(this.bestPlayerUUID)) {
                        this.bestPlayerLevel = level;
                     }
                  } else {
                     this.bestPlayerLevel = level;
                     this.bestPlayerUUID = player.getUniqueId();
                  }
               } else {
                  this.bestPlayerLevel = level;
                  this.bestPlayerUUID = player.getUniqueId();
               }
            }

            this.updateBorderSize(animate);
            this.bossbar.update();
            return;
         }
      }
   }

   @ScheduledTask(
      ticks = 100,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void checkBorderSize() {
      this.checkBorderSize(true);
   }

   @ScheduledTask(
      ticks = 20,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void playerSpawnTeleport() {
      broadcastFiltered((player) -> {
         if (!player.isDead()) {
            World world = player.getWorld();
            if (this.isOutsideBorder(player.getLocation())) {
               this.teleportInsideBorder(world, player);
            }

         }
      });
   }

   public boolean isOutsideBorder(Location location) {
      double size = (double)(this.bestPlayerLevel + 1);
      Location center = (Location)this.worldCenters.get(location.getWorld());
      if (center == null) {
         return false;
      } else {
         double x = Math.abs(location.getX()) - Math.abs(center.getX());
         double z = Math.abs(location.getZ()) - Math.abs(center.getZ());
         return Math.abs(x) > size || Math.abs(z) > size;
      }
   }

   private Location getCenter(World world) {
      Location center;
      if (this.useAPI) {
         center = ((WorldBorder)this.playerWorldBorders.get(world)).getCenter().subtract(0.5D, 0.0D, 0.5D);
         center.setY((double)world.getHighestBlockYAt((int)center.getX(), (int)center.getZ()));
      } else {
         PacketBorder packetBorder = (PacketBorder)this.packetBorders.get(world);
         double centerX = packetBorder.getCenterX();
         double centerZ = packetBorder.getCenterZ();
         center = new Location(world, centerX, (double)world.getHighestBlockYAt((int)centerX, (int)centerZ), centerZ);
      }

      return center;
   }

   public void teleportInsideBorder(@NotNull World world, Player player) {
      Location center = this.getCenter(world).clone();
      center.setWorld(world);
      if (world.getEnvironment() != Environment.NORMAL) {
         player.teleport(center);
      } else {
         player.teleport(center.add(0.5D, 1.0D, 0.5D));
      }

   }

   private Location getDefaultWorldSpawn() {
      World world = ChallengeAPI.getGameWorld(Environment.NORMAL);
      if (this.worldCenters.containsKey(world)) {
         return (Location)this.worldCenters.get(world);
      } else {
         Location location = world.getSpawnLocation();
         location.setX((double)location.getBlockX() + 0.5D);
         location.setZ((double)location.getBlockZ() + 0.5D);
         return location;
      }
   }

   private void updateBorderSize(boolean animate) {
      Iterator var2 = ChallengeAPI.getGameWorlds().iterator();

      while(var2.hasNext()) {
         World world = (World)var2.next();
         if (!world.getPlayers().isEmpty()) {
            this.updateBorderSize(world, animate);
         }
      }

   }

   private void updateBorderSize(@Nonnull World world, boolean animate) {
      Location location = (Location)this.worldCenters.get(world);
      if (location != null) {
         int newSize = this.bestPlayerLevel + 1;
         this.updateBorder(world, location, newSize == 0 ? 1 : newSize, animate);
         Iterator var5 = world.getPlayers().iterator();

         while(var5.hasNext()) {
            Player player = (Player)var5.next();
            this.sendBorder(player);
         }

      }
   }

   public void borderReset() {
      if (this.useAPI) {
         this.playerWorldBorders.values().forEach(WorldBorder::reset);
      } else {
         broadcast((player) -> {
            ((PacketBorder)this.packetBorders.get(player.getWorld())).reset(player);
         });
      }

   }

   @TimerTask(
      status = {TimerStatus.RUNNING},
      async = false
   )
   public void onTimerStart() {
      if (this.isEnabled()) {
         this.checkBorderSize(false);
         this.playerSpawnTeleport();
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onLevelChange(@Nonnull PlayerLevelChangeEvent event) {
      if (this.shouldExecuteEffect()) {
         this.checkBorderSize(true);
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onPlayerJoin(@Nonnull PlayerJoinEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            Bukkit.getScheduler().runTaskLater(plugin, () -> {
               this.checkBorderSize(false);
            }, 1L);
            this.playerSpawnTeleport();
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onPlayerLeave(@Nonnull PlayerQuitEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            Bukkit.getScheduler().runTaskLater(plugin, () -> {
               this.checkBorderSize(false);
            }, 1L);
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onRespawn(@Nonnull PlayerRespawnEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            Bukkit.getScheduler().runTaskLater(plugin, () -> {
               this.checkBorderSize(false);
               this.playerSpawnTeleport();
            }, 1L);
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onDeath(@Nonnull PlayerDeathEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getEntity())) {
            PlayerLevelChangeEvent lvlEvent = new PlayerLevelChangeEvent(event.getEntity(), event.getEntity().getLevel(), 0);
            event.getEntity().setLevel(0);
            this.onLevelChange(lvlEvent);
         }
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH
   )
   public void onEntityDamageByEntity(EntityDamageByEntityEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getDamager().getType() == EntityType.PLAYER) {
            if (event.isCancelled()) {
               if (this.isOutsideBorder(event.getEntity().getLocation()) && !this.isOutsideBorder(event.getDamager().getLocation())) {
                  event.setCancelled(false);
               }

            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onTeleport(@Nonnull PlayerTeleportEvent event) {
      if (event.getTo() != null) {
         if (this.shouldExecuteEffect()) {
            if (!ignorePlayer(event.getPlayer())) {
               if (event.getCause() == TeleportCause.NETHER_PORTAL || event.getCause() == TeleportCause.END_PORTAL) {
                  World world = event.getTo().getWorld();
                  if (world != null) {
                     if (world != Challenges.getInstance().getWorldManager().getExtraWorld()) {
                        Location location = event.getTo().getBlock().getLocation().add(0.5D, 0.0D, 0.5D);
                        if (!this.worldCenters.containsKey(world)) {
                           this.worldCenters.put(world, location);
                        }

                        this.updateBorderSize(world, false);
                     }
                  }
               }
            }
         }
      }
   }

   public void loadGameState(@NotNull Document document) {
      this.bestPlayerLevel = document.getInt("level");
      String uuid = document.getString("uuid");
      if (uuid != null) {
         this.bestPlayerUUID = UUID.fromString(uuid);
      }

      this.worldCenters.clear();
      Document worlds = document.getDocument("worlds");
      Iterator var4 = worlds.keys().iterator();

      while(var4.hasNext()) {
         String worldName = (String)var4.next();
         World world = Bukkit.getWorld(worldName);
         if (world != null) {
            this.worldCenters.put(world, (Location)worlds.getInstance(worldName, Location.class));
         }
      }

      if (this.isEnabled()) {
         this.checkBorderSize(false);
      }

   }

   public void writeGameState(@NotNull Document document) {
      document.set("level", this.bestPlayerLevel);
      GsonDocument doc = new GsonDocument();
      this.worldCenters.forEach((world, location) -> {
         doc.set(world.getName(), location);
      });
      document.set("worlds", doc);
      document.set("uuid", this.bestPlayerUUID);
   }

   private void updateBorder(World world, Location center, int size, boolean animate) {
      if (this.useAPI) {
         WorldBorder border = (WorldBorder)this.playerWorldBorders.get(world);
         border.setCenter(center);
         double x = center.getX();
         double z = center.getZ();
         if (world.getEnvironment() == Environment.NETHER) {
            x *= 8.0D;
            z *= 8.0D;
         }

         border.setCenter(x, z);
         if (animate) {
            border.setSize((double)size, 1L);
         } else {
            border.setSize((double)size);
         }

         border.setWarningDistance(0);
         border.setWarningTime(0);
      } else {
         PacketBorder border = (PacketBorder)this.packetBorders.get(world);
         border.setCenter(center.getX(), center.getZ());
         if (animate) {
            border.setSize((double)size, 1L);
         } else {
            border.setSize((double)size);
         }

         border.setWarningDistance(0);
         border.setWarningTime(0);
      }

   }

   private void sendBorder(@Nonnull Player player) {
      if (this.useAPI) {
         WorldBorder border = (WorldBorder)this.playerWorldBorders.get(player.getWorld());
         player.setWorldBorder(border);
      } else {
         ((PacketBorder)this.packetBorders.get(player.getWorld())).send(player, PacketBorder.UpdateType.values());
      }

   }
}
