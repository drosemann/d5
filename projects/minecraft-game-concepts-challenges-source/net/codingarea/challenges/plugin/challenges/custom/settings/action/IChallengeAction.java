package net.codingarea.challenges.plugin.challenges.custom.settings.action;

import java.util.Map;
import net.anweisen.utilities.common.collection.IRandom;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;

public interface IChallengeAction {
   IRandom random = IRandom.create();

   void execute(ChallengeExecutionData var1, Map var2);
}
