package net.codingarea.challenges.plugin.challenges.custom.settings.trigger;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.function.Supplier;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeSetting;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;

public abstract class ChallengeTrigger extends ChallengeSetting implements IChallengeTrigger {
   public ChallengeTrigger(String name, SubSettingsBuilder subSettingsBuilder) {
      super(name, subSettingsBuilder);
   }

   public ChallengeTrigger(String name) {
      super(name);
   }

   public ChallengeTrigger(String name, Supplier builderSupplier) {
      super(name, builderSupplier);
   }

   public static LinkedHashMap getMenuItems() {
      LinkedHashMap map = new LinkedHashMap();
      Iterator var1 = Challenges.getInstance().getCustomSettingsLoader().getTriggers().values().iterator();

      while(var1.hasNext()) {
         ChallengeTrigger value = (ChallengeTrigger)var1.next();
         map.put(value.getName(), (new ItemBuilder(value.getMaterial(), Message.forName(value.getMessage()))).hideAttributes().build());
      }

      return map;
   }

   public final String getMessage() {
      return "item-custom-trigger-" + this.getMessageSuffix();
   }
}
