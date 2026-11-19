package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld.JumpAndRunChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import org.bukkit.Material;

public class JumpAndRunAction extends ChallengeAction {
   public JumpAndRunAction(String name) {
      super(name);
   }

   public Material getMaterial() {
      return Material.ACACIA_STAIRS;
   }

   public void execute(ChallengeExecutionData executionData, Map subActions) {
      ((JumpAndRunChallenge)AbstractChallenge.getFirstInstance(JumpAndRunChallenge.class)).startWorldChallenge();
   }
}
