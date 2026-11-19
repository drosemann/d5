package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerMoveEvent;

public class FloorIsLavaChallenge extends SettingModifier {
   public FloorIsLavaChallenge() {
      super(MenuType.CHALLENGES, 1, 60, 30);
      this.setCategory(SettingCategory.WORLD);
   }

   @EventHandler
   public void onMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getPlayer().getGameMode() != GameMode.CREATIVE && event.getPlayer().getGameMode() != GameMode.SPECTATOR) {
            if (event.getTo() != null) {
               if (BlockUtils.isSameBlockLocationIgnoreHeight(event.getFrom(), event.getTo())) {
                  Bukkit.getScheduler().runTaskLater(plugin, () -> {
                     this.createMagmaFloor(event.getTo());
                  }, (long)this.getValue() * 20L);
               }
            }
         }
      }
   }

   private void createMagmaFloor(@Nonnull Location to) {
      BlockUtils.setBlockNatural(BlockUtils.getBlockBelow(to, 0.6D), Material.MAGMA_BLOCK, true);
      Bukkit.getScheduler().runTaskLater(plugin, () -> {
         this.createLavaFloor(to);
      }, (long)this.getValue() * 20L);
   }

   private void createLavaFloor(@Nonnull Location to) {
      BlockUtils.setBlockNatural(BlockUtils.getBlockBelow(to), Material.LAVA, true);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.MAGMA_BLOCK, Message.forName("item-floor-lava-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue());
   }
}
