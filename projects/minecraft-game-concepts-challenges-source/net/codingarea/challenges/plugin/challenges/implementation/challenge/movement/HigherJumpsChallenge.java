package net.codingarea.challenges.plugin.challenges.implementation.challenge.movement;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.spigot.events.PlayerJumpEvent;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.util.Vector;

public class HigherJumpsChallenge extends Setting {
   public HigherJumpsChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.MOVEMENT);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.RABBIT_FOOT, Message.forName("item-higher-jumps-challenge"));
   }

   @EventHandler(
      priority = EventPriority.NORMAL
   )
   public void onJump(@Nonnull PlayerJumpEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            int jumps = this.getPlayerData(event.getPlayer()).getInt("jumps") + 1;
            this.getPlayerData(event.getPlayer()).set("jumps", jumps);
            float y = (float)jumps / 7.0F;
            event.getPlayer().setVelocity((new Vector()).setY(y));
         }
      }
   }
}
