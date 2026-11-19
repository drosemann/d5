package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.ListBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Chunk;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;

public class ChunkDeconstructionChallenge extends TimedChallenge {
   public ChunkDeconstructionChallenge() {
      super(MenuType.CHALLENGES, 1, 60, 20);
      this.setCategory(SettingCategory.WORLD);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DIAMOND_PICKAXE, Message.forName("item-chunk-deconstruction-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue());
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeSecondsValueChangeTitle(this, this.getValue());
   }

   protected int getSecondsUntilNextActivation() {
      return this.getValue();
   }

   protected void onTimeActivation() {
      if (!ChallengeAPI.isWorldInUse()) {
         Iterator var1 = this.getChunksToDeconstruct().iterator();

         while(var1.hasNext()) {
            Chunk chunk = (Chunk)var1.next();
            if (chunk.isLoaded()) {
               this.deconstructChunk(chunk);
            }
         }

         this.restartTimer();
      }
   }

   private void deconstructChunk(@Nonnull Chunk chunk) {
      for(int x = 0; x < 16; ++x) {
         Bukkit.getScheduler().runTask(plugin, () -> {
            for(int z = 0; z < 16; ++z) {
               this.deconstructAtLocation(chunk.getBlock(x, 0, z));
            }

         });
      }

   }

   private void deconstructAtLocation(@Nonnull Block block) {
      Block lowestBreakableBlock = this.getLowestBreakableBlock(block);
      if (lowestBreakableBlock != null) {
         lowestBreakableBlock.setType(Material.AIR, true);
      }
   }

   @Nullable
   private Block getLowestBreakableBlock(@Nonnull Block block) {
      Location location = block.getLocation();
      location.setY((double)block.getWorld().getMaxHeight());

      while(location.getY() >= (double)BukkitReflectionUtils.getMinHeight(block.getWorld()) && !this.isBreakable(location.getBlock())) {
         location.subtract(0.0D, 1.0D, 0.0D);
      }

      Block currentBlock = location.getBlock();
      return currentBlock.getType() != Material.BEDROCK && !currentBlock.isLiquid() ? location.getBlock() : null;
   }

   private boolean isBreakable(@Nonnull Block block) {
      return block.getType() != Material.BEDROCK && !BukkitReflectionUtils.isAir(block.getType()) && !block.isLiquid();
   }

   private List getChunksToDeconstruct() {
      return (new ListBuilder(new Chunk[0])).fill((builder) -> {
         Bukkit.getOnlinePlayers().forEach((player) -> {
            if (player.getGameMode() != GameMode.SPECTATOR && player.getGameMode() != GameMode.CREATIVE) {
               builder.addIfNotContains(player.getLocation().getChunk());
            }
         });
      }).build();
   }
}
