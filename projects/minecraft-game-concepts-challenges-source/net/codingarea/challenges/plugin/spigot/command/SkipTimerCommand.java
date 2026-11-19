package net.codingarea.challenges.plugin.spigot.command;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.IChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
import org.bukkit.command.CommandSender;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class SkipTimerCommand implements SenderCommand, Completer {
   public void onCommand(@NotNull CommandSender sender, @NotNull String[] args) throws Exception {
      Iterator var3 = Challenges.getInstance().getChallengeManager().getChallenges().iterator();

      while(var3.hasNext()) {
         IChallenge challenge = (IChallenge)var3.next();
         if (challenge.isEnabled() && challenge instanceof TimedChallenge) {
            TimedChallenge timedChallenge = (TimedChallenge)challenge;
            timedChallenge.setSecondsUntilActivation(0);
         }
      }

   }

   @Nullable
   public List onTabComplete(@NotNull CommandSender sender, @NotNull String[] args) {
      return Collections.emptyList();
   }
}
