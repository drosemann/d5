package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.util.Iterator;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.GameRule;
import org.bukkit.Material;
import org.bukkit.World;

public class MobGriefingSetting extends Setting {
   public MobGriefingSetting() {
      super(MenuType.SETTINGS);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CREEPER_HEAD, Message.forName("item-mob-griefing-setting"));
   }

   protected void onEnable() {
      Iterator var1 = Bukkit.getWorlds().iterator();

      while(var1.hasNext()) {
         World world = (World)var1.next();
         world.setGameRule(GameRule.MOB_GRIEFING, false);
      }

   }

   protected void onDisable() {
      Iterator var1 = Bukkit.getWorlds().iterator();

      while(var1.hasNext()) {
         World world = (World)var1.next();
         world.setGameRule(GameRule.MOB_GRIEFING, true);
      }

   }
}
