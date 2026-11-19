package net.codingarea.challenges.plugin.spigot.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.misc.StringUtils;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class TimerCommand implements SenderCommand, Completer {
   public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (args.length == 0) {
         if (sender instanceof Player) {
            Player player = (Player)sender;
            Challenges.getInstance().getMenuManager().openMenu(player, MenuType.TIMER, 0);
            SoundSample.OPEN.play(player);
         }

      } else {
         String var3 = args[0].toLowerCase();
         byte var4 = -1;
         switch(var3.hashCode()) {
         case -934426579:
            if (var3.equals("resume")) {
               var4 = 1;
            }
            break;
         case 113762:
            if (var3.equals("set")) {
               var4 = 6;
            }
            break;
         case 3202370:
            if (var3.equals("hide")) {
               var4 = 8;
            }
            break;
         case 3357091:
            if (var3.equals("mode")) {
               var4 = 9;
            }
            break;
         case 3529469:
            if (var3.equals("show")) {
               var4 = 7;
            }
            break;
         case 3540994:
            if (var3.equals("stop")) {
               var4 = 3;
            }
            break;
         case 106440182:
            if (var3.equals("pause")) {
               var4 = 4;
            }
            break;
         case 108404047:
            if (var3.equals("reset")) {
               var4 = 5;
            }
            break;
         case 109757538:
            if (var3.equals("start")) {
               var4 = 2;
            }
         }

         switch(var4) {
         case 1:
         case 2:
            if (ChallengeAPI.isStarted()) {
               Message.forName("timer-already-started").send(sender, Prefix.TIMER);
               SoundSample.BASS_OFF.playIfPlayer(sender);
            } else {
               Challenges.getInstance().getChallengeTimer().resume();
            }
            break;
         case 3:
         case 4:
            if (ChallengeAPI.isPaused()) {
               Message.forName("timer-already-paused").send(sender, Prefix.TIMER);
               SoundSample.BASS_OFF.playIfPlayer(sender);
            } else {
               Challenges.getInstance().getChallengeTimer().pause(true);
            }
            break;
         case 5:
            Challenges.getInstance().getChallengeTimer().reset();
            break;
         case 6:
            long seconds = StringUtils.parseSeconds(String.join(" ", args));
            if (seconds >= 2147483647L || seconds < 0L) {
               seconds = 2147483647L;
            }

            Challenges.getInstance().getChallengeTimer().setSeconds(seconds);
            Message.forName("timer-was-set").send(sender, Prefix.TIMER, Challenges.getInstance().getChallengeTimer().getFormattedTime());
            break;
         case 7:
            Challenges.getInstance().getChallengeTimer().setHidden(false);
            break;
         case 8:
            Challenges.getInstance().getChallengeTimer().setHidden(true);
            break;
         case 9:
            if (args.length != 2) {
               Message.forName("syntax").send(sender, Prefix.TIMER, "timer mode <up/down>");
            } else {
               String var7 = args[1].toLowerCase();
               byte var8 = -1;
               switch(var7.hashCode()) {
               case -677145915:
                  if (var7.equals("forward")) {
                     var8 = 2;
                  }
                  break;
               case 3739:
                  if (var7.equals("up")) {
                     var8 = 1;
                  }
                  break;
               case 3015911:
                  if (var7.equals("back")) {
                     var8 = 4;
                  }
                  break;
               case 3089570:
                  if (var7.equals("down")) {
                     var8 = 3;
                  }
                  break;
               case 1356771568:
                  if (var7.equals("backwards")) {
                     var8 = 5;
                  }
               }

               switch(var8) {
               case 1:
               case 2:
                  Challenges.getInstance().getChallengeTimer().setCountingUp(true);
                  return;
               case 3:
               case 4:
               case 5:
                  Challenges.getInstance().getChallengeTimer().setCountingUp(false);
                  return;
               default:
                  Message.forName("syntax").send(sender, Prefix.TIMER, "timer mode <up/down>");
               }
            }
            break;
         default:
            Message.forName("syntax").send(sender, Prefix.TIMER, "timer <resume/pause/reset/set/mode>");
            return;
         }

      }
   }

   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
      if (args.length == 0) {
         return new ArrayList();
      } else {
         String last = args[args.length - 1];
         if (args.length == 1) {
            return Utils.filterRecommendations(args[0], "resume", "pause", "stop", "start", "reset", "show", "hide", "mode", "set");
         } else if (args.length == 2 && "mode".equalsIgnoreCase(args[0])) {
            return Utils.filterRecommendations(args[1], "up", "down");
         } else if ("set".equalsIgnoreCase(args[0])) {
            return StringUtils.isNumber(last) ? Utils.filterRecommendations(last, last + "m", last + "h", last + "d", last + "w") : (last.isEmpty() ? Arrays.asList("10", "30", "60", "120") : Collections.singletonList(last));
         } else {
            return new ArrayList();
         }
      }
   }
}
