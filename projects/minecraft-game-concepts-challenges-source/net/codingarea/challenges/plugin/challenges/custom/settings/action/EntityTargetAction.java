package net.codingarea.challenges.plugin.challenges.custom.settings.action;

import java.util.function.Supplier;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;

public abstract class EntityTargetAction extends ChallengeAction implements IEntityTargetAction {
   public EntityTargetAction(String name, SubSettingsBuilder subSettingsBuilder) {
      super(name, subSettingsBuilder);
   }

   public EntityTargetAction(String name) {
      super(name);
   }

   public EntityTargetAction(String name, Supplier builderSupplier) {
      super(name, builderSupplier);
   }
}
