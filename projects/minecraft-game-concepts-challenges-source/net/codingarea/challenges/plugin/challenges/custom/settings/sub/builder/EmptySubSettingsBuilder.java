package net.codingarea.challenges.plugin.challenges.custom.settings.sub.builder;

import com.google.common.collect.Lists;
import java.util.List;
import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
import org.bukkit.entity.Player;

public class EmptySubSettingsBuilder extends SubSettingsBuilder {
   public EmptySubSettingsBuilder() {
      super("none");
   }

   public List getDisplay(Map activated) {
      return Lists.newLinkedList();
   }

   public boolean hasSettings() {
      return false;
   }

   public boolean open(Player player, IParentCustomGenerator parentGenerator, String title) {
      return false;
   }
}
