package net.codingarea.challenges.plugin.spigot.command;

import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.command.CommandSender;

public class ResetCommand implements SenderCommand, Completer {
   private final boolean confirmReset;
   private final boolean seedResetCommand;

   public ResetCommand() {
      Document pluginConfig = Challenges.getInstance().getConfigDocument();
      this.confirmReset = pluginConfig.getBoolean("confirm-reset");
      Document seedResetConfig = pluginConfig.getDocument("custom-seed");
      this.seedResetCommand = seedResetConfig.getBoolean("command");
   }

   public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (this.confirmReset && (args.length < 1 || !args[0].equalsIgnoreCase("confirm")) || args.length > 0 && !args[0].equalsIgnoreCase("confirm")) {
         if (args.length > 0 && args[0].equalsIgnoreCase("settings")) {
            Challenges.getInstance().getChallengeManager().restoreDefaults();
            Message.forName("config-reset").broadcast(Prefix.CHALLENGES);
            return;
         }

         if (args.length > 0 && args[0].equalsIgnoreCase("customs")) {
            Challenges.getInstance().getCustomChallengesLoader().resetChallenges();
            Message.forName("custom_challenges-reset").broadcast(Prefix.CHALLENGES);
            return;
         }

         if (!Challenges.getInstance().getWorldManager().isEnableFreshReset() && ChallengeAPI.isFresh()) {
            Message.forName("no-fresh-reset").send(sender, Prefix.CHALLENGES);
            SoundSample.BASS_OFF.playIfPlayer(sender);
            return;
         }

         if (this.confirmReset) {
            Message.forName("confirm-reset").send(sender, Prefix.CHALLENGES, "reset confirm");
            return;
         }
      }

      if (!Challenges.getInstance().getWorldManager().isEnableFreshReset() && ChallengeAPI.isFresh()) {
         Message.forName("no-fresh-reset").send(sender, Prefix.CHALLENGES);
         SoundSample.BASS_OFF.playIfPlayer(sender);
      } else {
         Long seed = null;
         if (this.seedResetCommand) {
            int index = this.confirmReset ? 1 : 0;
            if (args.length > index) {
               String seedInput = args[index];

               try {
                  seed = Long.parseLong(seedInput);
               } catch (NumberFormatException var7) {
                  Challenges.getInstance().getLogger().error("", new Object[]{var7});
               }
            }
         }

         Challenges.getInstance().getWorldManager().prepareWorldReset(sender, seed);
      }
   }

   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (this.confirmReset && args.length == 1) {
         return Utils.filterRecommendations(args[0], "confirm", "settings", "customs");
      } else if (!this.seedResetCommand || (!this.confirmReset || args.length != 2) && args.length != 1) {
         return Lists.newLinkedList();
      } else {
         return (List)(args.length == 1 ? Utils.filterRecommendations(args[args.length - 1], "[seed]", "settings", "customs") : (args[0].equalsIgnoreCase("confirm") ? Collections.singletonList("[seed]") : Lists.newLinkedList()));
      }
   }
}
