package net.codingarea.challenges.plugin.challenges.custom.settings.action;

import java.util.Map;
import java.util.function.Supplier;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Player;

public abstract class PlayerTargetAction extends EntityTargetAction {
   public PlayerTargetAction(String name, SubSettingsBuilder subSettingsBuilder) {
      super(name, subSettingsBuilder);
   }

   public PlayerTargetAction(String name) {
      super(name);
   }

   public PlayerTargetAction(String name, Supplier builderSupplier) {
      super(name, builderSupplier);
   }

   public void executeFor(Entity entity, Map subActions) {
      if (entity instanceof Player || entity == null) {
         this.executeForPlayer((Player)entity, subActions);
      }

   }

   public abstract void executeForPlayer(Player var1, Map var2);
}
