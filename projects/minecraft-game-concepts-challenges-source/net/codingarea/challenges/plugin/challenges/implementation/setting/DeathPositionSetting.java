package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.PlayerDeathEvent;

@Since("2.0")
public class DeathPositionSetting extends Setting {
   private static final String POSITION_PREFIX = "death-";

   public DeathPositionSetting() {
      super(MenuType.SETTINGS);
   }

   @EventHandler(
      priority = EventPriority.LOWEST
   )
   public void onDeath(@Nonnull PlayerDeathEvent event) {
      if (this.shouldExecuteEffect()) {
         int index;
         for(index = 1; ((PositionSetting)AbstractChallenge.getFirstInstance(PositionSetting.class)).containsPosition("death-" + index); ++index) {
         }

         Player player = event.getEntity();
         player.performCommand("pos death-" + index);
      }
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.MUSIC_DISC_11, Message.forName("item-death-position-setting"));
   }
}
