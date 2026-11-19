package net.codingarea.challenges.plugin.challenges.implementation.goal;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifierCollectionGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import net.codingarea.challenges.plugin.utils.misc.ListBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;

public class CollectWoodGoal extends SettingModifierCollectionGoal {
   private static final boolean newNether;
   private static final int OVERWORLD = 1;
   private static final int NETHER = 2;
   private static final int BOTH = 3;

   public CollectWoodGoal() {
      super(1, newNether ? 3 : 1);
      this.setCategory(SettingCategory.FASTEST_TIME);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.GOLDEN_AXE, Message.forName("item-collect-wood-goal"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      if (!newNether) {
         return DefaultItem.enabled();
      } else if (this.getValue() == 1) {
         return DefaultItem.create(Material.OAK_LOG, Message.forName("item-collect-wood-goal-overworld"));
      } else {
         return this.getValue() == 2 ? DefaultItem.create(Material.WARPED_STEM, Message.forName("item-collect-wood-goal-nether")) : DefaultItem.create(Material.CRYING_OBSIDIAN, Message.forName("item-collect-wood-goal-both"));
      }
   }

   public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
      if (!newNether && info.isLowerItemClick() && this.enabled) {
         this.setEnabled(false);
         SoundSample.playStatusSound(info.getPlayer(), this.enabled);
         this.playStatusUpdateTitle();
      } else {
         super.handleClick(info);
      }

   }

   protected void onEnable() {
      super.onEnable();
      this.setTarget(this.getWoodMaterials());
      this.checkCollects();
   }

   protected void onValueChange() {
      this.setTarget(this.getWoodMaterials());
      this.checkCollects();
   }

   @Nonnull
   private Object[] getWoodMaterials() {
      return (new ListBuilder(new Material[0])).fill((builder) -> {
         Material[] var2 = ExperimentalUtils.getMaterials();
         int var3 = var2.length;

         for(int var4 = 0; var4 < var3; ++var4) {
            Material material = var2[var4];
            if (this.isSearched(material)) {
               builder.add(material);
            }
         }

      }).build().toArray();
   }

   private boolean isLog(@Nonnull Material material) {
      return material.name().contains("LOG") && !material.name().contains("STRIPPED");
   }

   private boolean isNetherLog(@Nonnull Material material) {
      return material == Material.WARPED_STEM || material == Material.CRIMSON_STEM;
   }

   private boolean isSearched(@Nonnull Material material) {
      return this.getValue() == 1 && this.isLog(material) || this.getValue() == 2 && this.isNetherLog(material) || this.getValue() == 3 && (this.isLog(material) || this.isNetherLog(material));
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPickupItem(@Nonnull PlayerPickupItemEvent event) {
      if (this.shouldExecuteEffect()) {
         Material material = event.getItem().getItemStack().getType();
         Player player = event.getPlayer();
         this.handleCollect(player, material);
      }
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPlayerInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!event.isCancelled()) {
            if (event.getClickedInventory() != null) {
               if (event.getClickedInventory().getHolder() == event.getPlayer()) {
                  if (event.getCurrentItem() != null) {
                     Player player = event.getPlayer();
                     Material material = event.getCurrentItem().getType();
                     this.handleCollect(player, material);
                  }
               }
            }
         }
      }
   }

   private void handleCollect(@Nonnull Player player, @Nonnull Material material) {
      this.collect(player, material, () -> {
         Message.forName("item-collected").send(player, Prefix.CHALLENGES, material);
         SoundSample.PLING.play(player);
      });
   }

   static {
      newNether = MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_16);
   }
}
