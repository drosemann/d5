package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import org.bukkit.GameMode;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.potion.PotionEffect;

public class SoupSetting extends Setting {
   public SoupSetting() {
      super(MenuType.SETTINGS);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.MUSHROOM_STEW, Message.forName("item-soup-setting"));
   }

   @EventHandler
   public void onInteract(PlayerInteractEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getAction() == Action.RIGHT_CLICK_AIR || event.getAction() == Action.RIGHT_CLICK_BLOCK) {
            if (event.getItem() != null) {
               if (event.getItem().getType() == Material.MUSHROOM_STEW) {
                  Player player = event.getPlayer();
                  if (player.getGameMode() != GameMode.CREATIVE) {
                     if (player.getHealth() != player.getMaxHealth()) {
                        player.addPotionEffect(new PotionEffect(MinecraftNameWrapper.INSTANT_HEALTH, 1, 1));
                        player.getInventory().setItemInMainHand((new ItemBuilder(Material.BOWL)).build());
                        player.updateInventory();
                        SoundSample.EAT.play(player);
                     }
                  }
               }
            }
         }
      }
   }
}
