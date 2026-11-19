package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Map;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.implementation.challenge.extraworld.WaterMLGChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import org.bukkit.Material;

public class WaterMLGAction extends ChallengeAction {
   public WaterMLGAction(String name) {
      super(name);
   }

   public Material getMaterial() {
      return Material.WATER_BUCKET;
   }

   public void execute(ChallengeExecutionData executionData, Map subActions) {
      ((WaterMLGChallenge)AbstractChallenge.getFirstInstance(WaterMLGChallenge.class)).startWorldChallenge();
   }
}
