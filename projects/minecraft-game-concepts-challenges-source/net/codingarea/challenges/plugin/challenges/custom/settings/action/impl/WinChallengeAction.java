package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import com.google.common.collect.Lists;
import java.util.List;
import java.util.Map;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class WinChallengeAction extends PlayerTargetAction {
   private final List winner = Lists.newLinkedList();

   public WinChallengeAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true));
   }

   public Material getMaterial() {
      return Material.GOLDEN_HELMET;
   }

   public void execute(ChallengeExecutionData executionData, Map subActions) {
      super.execute(executionData, subActions);
      ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED, () -> {
         return this.winner;
      });
      this.winner.clear();
   }

   public void executeForPlayer(Player player, Map subActions) {
      this.winner.add(player);
   }
}
