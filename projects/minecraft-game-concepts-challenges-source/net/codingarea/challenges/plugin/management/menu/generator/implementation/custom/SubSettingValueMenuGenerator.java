package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.ValueSetting;
import net.codingarea.challenges.plugin.management.menu.generator.ValueMenuGenerator;
import org.bukkit.entity.Player;

public class SubSettingValueMenuGenerator extends ValueMenuGenerator {
   private final IParentCustomGenerator parent;
   private final String title;

   public SubSettingValueMenuGenerator(IParentCustomGenerator parent, Map settings, String title) {
      super(settings);
      this.title = title;
      this.parent = parent;
   }

   public String[] getSubTitles(int page) {
      return new String[]{this.title};
   }

   public void onSaveItemClick(Player player) {
      Map map = new HashMap();
      Iterator var3 = this.getSettings().entrySet().iterator();

      while(var3.hasNext()) {
         Entry entry = (Entry)var3.next();
         map.put(((ValueSetting)entry.getKey()).getKey(), new String[]{(String)entry.getValue()});
      }

      this.parent.accept(player, (SettingType)null, map);
   }

   public void onBackToMenuItemClick(Player player) {
      this.parent.decline(player);
   }
}
