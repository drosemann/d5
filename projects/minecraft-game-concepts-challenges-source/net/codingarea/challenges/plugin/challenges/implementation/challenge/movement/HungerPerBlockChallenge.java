package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerMoveEvent;

@Since("2.0")
public class HungerPerBlockChallenge extends SettingModifier {
   public HungerPerBlockChallenge() {
      super(MenuType.CHALLENGES, 1, 20, 2);
      this.setCategory(SettingCategory.MOVEMENT);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.ROTTEN_FLESH, Message.forName("item-hunger-block-challenge"));
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onPlayerMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (!BlockUtils.isSameBlockLocationIgnoreHeight(event.getFrom(), event.getTo())) {
               int newFoodLevel = event.getPlayer().getFoodLevel() - this.getValue();
               event.getPlayer().setFoodLevel(Math.max(newFoodLevel, 0));
            }
         }
      }
   }
}
