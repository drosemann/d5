package net.codingarea.challenges.plugin.challenges.implementation.challenge;

import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.jetbrains.annotations.NotNull;

public class TimedItemChallenge extends MenuSetting {
   public TimedItemChallenge() {
      super(MenuType.CHALLENGES, Message.forName("menu-timed-items-challenge-settings"));
      this.setCategory(SettingCategory.INVENTORY);
      this.registerSetting("", new MenuSetting.NumberSubSetting(() -> {
         return new ItemBuilder(Material.CLOCK, Message.forName("timed-item-challenge-timer"));
      }));
      this.registerSetting("", new MenuSetting.BooleanSubSetting(() -> {
         return new ItemBuilder(Material.CRAFTING_TABLE, Message.forName("timed-item-challenge-crafting"));
      }));
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CLOCK, Message.forName("timed-item-challenge"));
   }
}
