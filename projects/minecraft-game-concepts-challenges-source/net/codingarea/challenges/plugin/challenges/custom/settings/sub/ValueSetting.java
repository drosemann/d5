package net.codingarea.challenges.plugin.challenges.custom.settings.sub;

import lombok.Generated;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;

public abstract class ValueSetting {
   private final String key;
   private final ItemBuilder itemBuilder;

   public ValueSetting(String key, ItemBuilder itemBuilder) {
      this.key = key;
      this.itemBuilder = itemBuilder;
   }

   public ItemBuilder createDisplayItem() {
      return this.itemBuilder;
   }

   public abstract String onClick(MenuClickInfo var1, String var2, int var3);

   public ItemBuilder getDisplayItem(String value) {
      return this.createDisplayItem().hideAttributes();
   }

   public abstract ItemBuilder getSettingsItem(String var1);

   @Generated
   public String getKey() {
      return this.key;
   }
}
