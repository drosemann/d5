package net.codingarea.challenges.plugin.utils.misc;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.bukkit.Chunk;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.block.BlockFace;

public final class BlockUtils {
   private static final BlockFace[] faces;

   private BlockUtils() {
   }

   public static boolean isSameBlockLocation(@Nullable Location loc1, @Nullable Location loc2) {
      if (loc1 != null && loc2 != null) {
         if (loc1.getWorld() != loc2.getWorld()) {
            return false;
         } else {
            return loc1.getBlockX() == loc2.getBlockX() && loc1.getBlockY() == loc2.getBlockY() && loc1.getBlockZ() == loc2.getBlockZ();
         }
      } else {
         return true;
      }
   }

   public static boolean isSameBlockLocationIgnoreHeight(@Nullable Location loc1, @Nullable Location loc2) {
      if (loc1 != null && loc2 != null) {
         if (loc1.getWorld() != loc2.getWorld()) {
            return false;
         } else {
            return loc1.getBlockX() == loc2.getBlockX() && loc1.getBlockZ() == loc2.getBlockZ();
         }
      } else {
         return false;
      }
   }

   public static boolean isSameLocation(@Nonnull Location loc1, @Nonnull Location loc2) {
      if (loc1.getWorld() != loc2.getWorld()) {
         return false;
      } else {
         return loc1.distance(loc2) < 0.1D;
      }
   }

   public static boolean isSameLocationIgnoreHeight(@Nonnull Location loc1, @Nonnull Location loc2) {
      if (loc1.getWorld() != loc2.getWorld()) {
         return false;
      } else {
         return loc1.getX() == loc2.getX() && loc1.getZ() == loc2.getZ();
      }
   }

   public static boolean isSameChunk(@Nonnull Chunk chunk1, @Nonnull Chunk chunk2) {
      if (chunk1.getWorld() != chunk2.getWorld()) {
         return false;
      } else {
         return chunk1.getX() == chunk2.getX() && chunk1.getZ() == chunk2.getZ();
      }
   }

   @Nonnull
   public static List getBlocksAroundBlock(@Nonnull Block block) {
      List list = new ArrayList();
      BlockFace[] var2 = faces;
      int var3 = var2.length;

      for(int var4 = 0; var4 < var3; ++var4) {
         BlockFace face = var2[var4];
         list.add(block.getRelative(face));
      }

      return list;
   }

   public static Material getTerracotta(int subId) {
      switch(subId) {
      case 2:
         return Material.ORANGE_TERRACOTTA;
      case 3:
         return Material.MAGENTA_TERRACOTTA;
      case 4:
         return Material.LIGHT_BLUE_TERRACOTTA;
      case 5:
         return Material.YELLOW_TERRACOTTA;
      case 6:
         return Material.LIME_TERRACOTTA;
      case 7:
         return Material.PINK_TERRACOTTA;
      case 8:
         return Material.GRAY_TERRACOTTA;
      case 9:
         return Material.LIGHT_GRAY_TERRACOTTA;
      case 10:
         return Material.CYAN_TERRACOTTA;
      case 11:
         return Material.PURPLE_TERRACOTTA;
      case 12:
         return Material.BLUE_TERRACOTTA;
      case 13:
         return Material.BROWN_TERRACOTTA;
      case 14:
         return Material.GREEN_TERRACOTTA;
      case 15:
         return Material.RED_TERRACOTTA;
      case 16:
         return Material.BLACK_TERRACOTTA;
      default:
         return Material.WHITE_TERRACOTTA;
      }
   }

   public static void createBlockPath(@Nullable Location from, @Nullable Location to, @Nonnull Material type) {
      createBlockPath(from, to, type, true);
   }

   public static void createBlockPath(@Nullable Location from, @Nullable Location to, @Nonnull Material type, boolean playSound) {
      if (from != null && to != null) {
         if (!isSameBlockLocationIgnoreHeight(from, to)) {
            setBlockNatural(getBlockBelow(to), type, playSound);
         }
      }
   }

   public static void setBlockNatural(@Nullable Block block, @Nonnull Material type, boolean blockUpdate) {
      setBlockNatural(block, type, blockUpdate, true);
   }

   public static void setBlockNatural(@Nullable Block block, @Nonnull Material type, boolean blockUpdate, boolean playSound) {
      if (block != null && block.getType().isSolid()) {
         Block upperBlock = block.getLocation().add(0.0D, 1.0D, 0.0D).getBlock();
         if (!upperBlock.getType().isSolid()) {
            upperBlock.breakNaturally();
            if (playSound) {
            }
         }

         block.setType(type, blockUpdate);
      }
   }

   @Nullable
   public static Block getBlockBelow(@Nonnull Location location) {
      return getBlockBelow(location, 0.1D);
   }

   @Nullable
   public static Block getBlockBelow(@Nonnull Location location, boolean ignoreNonSolid) {
      return getBlockBelow(location, 0.1D, ignoreNonSolid);
   }

   @Nullable
   public static Block getBlockBelow(@Nonnull Location location, double offset) {
      return getBlockBelow(location, offset, true);
   }

   @Nullable
   public static Block getBlockBelow(@Nonnull Location location, double offset, boolean ignoreNonSolid) {
      Block block;
      if (offset == -1.0D) {
         block = getBlockBelow(location, 0.1D, ignoreNonSolid);
         if (block == null) {
            block = getBlockBelow(location, 1.0D, ignoreNonSolid);
            if (block == null) {
               block = getBlockBelow(location, 1.5D, ignoreNonSolid);
            }
         }
      } else {
         block = location.clone().subtract(0.0D, offset, 0.0D).getBlock();
      }

      if (block == null) {
         return null;
      } else {
         return ignoreNonSolid && !block.getType().isSolid() ? null : block;
      }
   }

   public static boolean isEndItem(Material material) {
      String name = material.name();
      return material == Material.ELYTRA || name.contains("PURPUR") || name.contains("SHULKER") || name.contains("END");
   }

   public static boolean isTooHardToGet(Material material) {
      String name = material.name();
      return name.contains("EXPOSED") || name.contains("WEATHERED") || name.contains("OXIDIZED") || name.contains("BUD");
   }

   static {
      faces = new BlockFace[]{BlockFace.UP, BlockFace.DOWN, BlockFace.NORTH, BlockFace.EAST, BlockFace.SOUTH, BlockFace.WEST};
   }
}
