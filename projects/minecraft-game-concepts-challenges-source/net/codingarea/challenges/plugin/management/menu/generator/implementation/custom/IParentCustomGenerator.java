package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
import org.bukkit.entity.Player;

public interface IParentCustomGenerator {
   void accept(Player var1, SettingType var2, Map var3);

   void decline(Player var1);
}
