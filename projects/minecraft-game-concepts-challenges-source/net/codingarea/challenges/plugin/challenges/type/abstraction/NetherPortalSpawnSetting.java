package net.codingarea.challenges.plugin.challenges.type.abstraction;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import org.bukkit.Chunk;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.StructureType;
import org.bukkit.World;
import org.bukkit.World.Environment;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerTeleportEvent;
import org.bukkit.event.player.PlayerTeleportEvent.TeleportCause;

public abstract class NetherPortalSpawnSetting extends OneEnabledSetting {
   private static final String id = "netherportal_handle";
   private final Map netherPortalsByOverworldPortals = new HashMap();
   private final StructureType structureType;
   private final Collection groundMaterial;
   private final String unableToFindMessage;

   public NetherPortalSpawnSetting(@Nonnull MenuType menu, @Nonnull StructureType structureType, @Nonnull String unableToFindMessage, @Nonnull Material... groundMaterial) {
      super(menu, "netherportal_handle");
      this.structureType = structureType;
      this.unableToFindMessage = unableToFindMessage;
      this.groundMaterial = Arrays.asList(groundMaterial);
   }

   public NetherPortalSpawnSetting(@Nonnull MenuType menu, @Nonnull StructureType structureType, @Nonnull String unableToFindMessage, @Nonnull Collection groundMaterial) {
      super(menu, "netherportal_handle");
      this.structureType = structureType;
      this.unableToFindMessage = unableToFindMessage;
      this.groundMaterial = groundMaterial;
   }

   @EventHandler
   public void onNetherPortal(@Nonnull PlayerTeleportEvent event) {
      if (this.isEnabled()) {
         if (event.getCause() == TeleportCause.NETHER_PORTAL) {
            if (event.getTo() != null) {
               if (event.getTo().getWorld() != null) {
                  if (event.getTo().getWorld().getEnvironment() == Environment.NETHER) {
                     World world = event.getTo().getWorld();
                     Location location = this.getNetherPortal(event.getFrom(), world);
                     if (location == null) {
                        Message.forName(this.unableToFindMessage).send(event.getPlayer(), Prefix.CHALLENGES);
                        return;
                     }

                     this.buildPortal(location);
                     event.setTo(location.clone().add(1.0D, 0.0D, 0.5D));
                  } else if (event.getTo().getWorld().getEnvironment() == Environment.NORMAL) {
                     Location location = this.getOverworldPortal(event.getFrom());
                     if (location == null) {
                        return;
                     }

                     event.setTo(location.clone().add(1.0D, 0.0D, 0.5D));
                  }

               }
            }
         }
      }
   }

   @Nullable
   private Location getNetherPortal(@Nonnull Location overworldPortal, @Nonnull World nether) {
      Iterator var3 = this.netherPortalsByOverworldPortals.entrySet().iterator();

      Entry entry;
      do {
         if (!var3.hasNext()) {
            Location structure = nether.locateNearestStructure(new Location(nether, 0.0D, 100.0D, 0.0D), this.structureType, 10000, false);
            if (structure == null) {
               return null;
            }

            Iterator var7 = this.netherPortalsByOverworldPortals.entrySet().iterator();

            Entry entry;
            do {
               if (!var7.hasNext()) {
                  Location target = this.findNearestStructurePart(structure.clone());
                  this.netherPortalsByOverworldPortals.put(overworldPortal, target);
                  return target;
               }

               entry = (Entry)var7.next();
            } while(!(structure.distance((Location)entry.getValue()) < 100.0D));

            return (Location)entry.getValue();
         }

         entry = (Entry)var3.next();
      } while(!(overworldPortal.distance((Location)entry.getKey()) < 10.0D));

      return (Location)entry.getValue();
   }

   @Nullable
   private Location getOverworldPortal(@Nonnull Location netherPortal) {
      Iterator var2 = this.netherPortalsByOverworldPortals.entrySet().iterator();

      Entry entry;
      do {
         if (!var2.hasNext()) {
            return null;
         }

         entry = (Entry)var2.next();
      } while(!(netherPortal.distance((Location)entry.getValue()) < 100.0D));

      return (Location)entry.getKey();
   }

   @Nullable
   private Location findNearestStructurePart(@Nonnull Location structure) {
      Chunk chunk = structure.getChunk();

      for(int x = 0; x < 16; ++x) {
         for(int z = 0; z < 16; ++z) {
            Location location = chunk.getBlock(x, 100, z).getLocation();

            while(location.getBlockY() > 30) {
               location.subtract(0.0D, 1.0D, 0.0D);
               if (this.groundMaterial.contains(location.getBlock().getType())) {
                  return location.add(0.0D, 1.0D, 0.0D);
               }
            }
         }
      }

      return null;
   }

   private void buildPortal(@Nonnull Location origin) {
      origin.clone().add(-1.0D, -1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(0.0D, -1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(1.0D, -1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(2.0D, -1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(-1.0D, 3.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(0.0D, 3.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(1.0D, 3.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(2.0D, 3.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(-1.0D, 0.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(-1.0D, 1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(-1.0D, 2.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(2.0D, 0.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(2.0D, 1.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(2.0D, 2.0D, 0.0D).getBlock().setType(Material.OBSIDIAN);
      origin.clone().add(0.0D, 0.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);
      origin.clone().add(1.0D, 0.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);
      origin.clone().add(0.0D, 1.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);
      origin.clone().add(1.0D, 1.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);
      origin.clone().add(0.0D, 2.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);
      origin.clone().add(1.0D, 2.0D, 0.0D).getBlock().setType(Material.NETHER_PORTAL);

      for(int x = -1; x <= 2; ++x) {
         for(int y = 0; y <= 3; ++y) {
            origin.clone().add((double)x, (double)y, 1.0D).getBlock().setType(Material.AIR);
            origin.clone().add((double)x, (double)y, 2.0D).getBlock().setType(Material.AIR);
            origin.clone().add((double)x, (double)y, -1.0D).getBlock().setType(Material.AIR);
            origin.clone().add((double)x, (double)y, -2.0D).getBlock().setType(Material.AIR);
         }
      }

   }

   public void loadGameState(@Nonnull Document document) {
      super.loadGameState(document);
      Document portals = document.getDocument("portals");
      Iterator var3 = portals.keys().iterator();

      while(var3.hasNext()) {
         String key = (String)var3.next();
         Document portal = portals.getDocument(key);
         Location from = (Location)portal.getSerializable("portal", Location.class);
         Location to = (Location)portal.getSerializable("target", Location.class);
         if (from != null && to != null) {
            this.netherPortalsByOverworldPortals.put(from, to);
         }
      }

   }

   public void writeGameState(@Nonnull Document document) {
      super.writeGameState(document);
      int index = 0;
      Document portals = document.getDocument("portals");
      Iterator var4 = this.netherPortalsByOverworldPortals.entrySet().iterator();

      while(var4.hasNext()) {
         Entry entry = (Entry)var4.next();
         Document portal = portals.getDocument(String.valueOf(index));
         portal.set("portal", entry.getKey());
         portal.set("target", entry.getValue());
      }

   }
}
