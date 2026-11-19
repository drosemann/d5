package net.codingarea.challenges.plugin.spigot.generator;

import java.util.Random;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.block.BlockFace;
import org.bukkit.block.data.Directional;
import org.bukkit.generator.ChunkGenerator;
import org.bukkit.generator.ChunkGenerator.BiomeGrid;
import org.bukkit.generator.ChunkGenerator.ChunkData;

public class VoidMapGenerator extends ChunkGenerator {
   private static final boolean generateEndPortal = MinecraftVersion.current().getMinor() == 18;

   @Nonnull
   public ChunkData generateChunkData(@Nonnull World world, @Nonnull Random random, int x, int z, @Nonnull BiomeGrid biome) {
      ChunkData chunkData = this.createChunkData(world);
      if (x == 0 && z == 0) {
         chunkData.setBlock(0, 59, 0, Material.BEDROCK);
      }

      if (generateEndPortal && x == -7 && z == -105) {
         this.generateEndPortal(chunkData);
      }

      return chunkData;
   }

   public void generateEndPortal(@Nonnull ChunkData data) {
      int x = 6;
      int y = 29;
      int z = 6;

      for(int x1 = 0; x1 < 5; ++x1) {
         for(int z1 = 0; z1 < 5; ++z1) {
            if ((x1 != 0 || z1 != 0) && (x1 != 4 || z1 != 4) && (x1 != 0 || z1 != 4) && (x1 != 4 || z1 != 0) && (x1 <= 0 || z1 <= 0 || x1 >= 4 || z1 >= 4)) {
               Directional blockData = (Directional)Bukkit.createBlockData(Material.END_PORTAL_FRAME);
               if (x1 == 0) {
                  blockData.setFacing(BlockFace.EAST);
               } else if (x1 == 4) {
                  blockData.setFacing(BlockFace.WEST);
               } else if (z1 == 0) {
                  blockData.setFacing(BlockFace.SOUTH);
               } else {
                  blockData.setFacing(BlockFace.NORTH);
               }

               data.setBlock(x + x1, y, z + z1, blockData);
            }
         }
      }

   }
}
