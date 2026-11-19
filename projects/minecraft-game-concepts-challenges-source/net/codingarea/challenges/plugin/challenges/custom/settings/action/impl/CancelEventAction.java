package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import org.bukkit.Material;

public class CancelEventAction extends ChallengeAction {
   public static boolean inCanceling;

   public CancelEventAction(String name) {
      super(name);
   }

   public static void onPreTrigger() {
      inCanceling = false;
   }

   public static boolean shouldCancel() {
      if (inCanceling) {
         inCanceling = false;
         return true;
      } else {
         return false;
      }
   }

   public Material getMaterial() {
      return Material.BARRIER;
   }

   public void execute(ChallengeExecutionData executionData, Map subActions) {
      inCanceling = true;
   }
}
