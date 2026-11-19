package net.codingarea.challenges.plugin.challenges.type.helper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.function.ToIntBiFunction;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.NumberFormatter;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.IGoal;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.entity.Player;

public final class GoalHelper {
   public static final int LEADERBOARD_SIZE = 9;

   private GoalHelper() {
   }

   public static void handleSetEnabled(@Nonnull IGoal goal, boolean enabled) {
      if (Challenges.getInstance().getChallengeManager().getCurrentGoal() != goal && enabled) {
         Challenges.getInstance().getChallengeManager().setCurrentGoal(goal);
      } else if (Challenges.getInstance().getChallengeManager().getCurrentGoal() == goal && !enabled) {
         Challenges.getInstance().getChallengeManager().setCurrentGoal((IGoal)null);
      }

   }

   @Nonnull
   public static SortedMap createLeaderboardFromPoints(@Nonnull Map points) {
      SortedMap leaderboard = new TreeMap(Collections.reverseOrder());
      Iterator var2 = points.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         List players = (List)leaderboard.computeIfAbsent((Integer)entry.getValue(), (key) -> {
            return new ArrayList();
         });
         players.add((Player)entry.getKey());
      }

      return leaderboard;
   }

   @Nonnull
   public static Map createPointsFromValues(@Nonnull AtomicInteger mostPoints, @Nonnull Map map, @Nonnull ToIntBiFunction mapper, boolean zeros) {
      Map result = new HashMap();
      if (zeros) {
         ChallengeAPI.getIngamePlayers().forEach((playerx) -> {
            result.put(playerx, 0);
         });
      }

      Iterator var5 = map.entrySet().iterator();

      while(true) {
         Entry entry;
         Player player;
         do {
            do {
               if (!var5.hasNext()) {
                  return result;
               }

               entry = (Entry)var5.next();
               player = Bukkit.getPlayer((UUID)entry.getKey());
            } while(player == null);
         } while(AbstractChallenge.ignorePlayer(player) && (!ChallengeAPI.isPaused() || player.getGameMode() != GameMode.SPECTATOR));

         int points = mapper.applyAsInt((UUID)entry.getKey(), entry.getValue());
         if (points != 0) {
            result.put(player, points);
            if (points >= mostPoints.get()) {
               mostPoints.set(points);
            }
         }
      }
   }

   public static int determinePosition(@Nonnull SortedMap map, @Nonnull Object target) {
      int position = 1;

      for(Iterator var3 = map.entrySet().iterator(); var3.hasNext(); ++position) {
         Entry entry = (Entry)var3.next();
         if (((List)entry.getValue()).contains(target)) {
            break;
         }
      }

      return position;
   }

   @Nonnull
   public static BiConsumer createScoreboard(@Nonnull Supplier points) {
      return createScoreboard(points, (player) -> {
         return new LinkedList();
      });
   }

   @Nonnull
   public static BiConsumer createScoreboard(@Nonnull Supplier points, Function additionalLines) {
      return (scoreboard, player) -> {
         SortedMap leaderboard = createLeaderboardFromPoints((Map)points.get());
         int playerPlace = determinePosition(leaderboard, player);
         scoreboard.addLine("");
         scoreboard.addLine(Message.forName("your-place").asString(playerPlace));
         scoreboard.addLine("");
         int place = 1;
         int linesThatCanBeAdded = 0;

         for(Iterator var8 = leaderboard.entrySet().iterator(); var8.hasNext(); ++place) {
            Entry entry = (Entry)var8.next();
            List players = (List)entry.getValue();
            Iterator var11 = players.iterator();

            while(var11.hasNext()) {
               Player current = (Player)var11.next();
               ++linesThatCanBeAdded;
               if (linesThatCanBeAdded >= 9) {
                  break;
               }

               scoreboard.addLine(Message.forName("scoreboard-leaderboard").asString(place, NameHelper.getName(current), NumberFormatter.MIDDLE_NUMBER.format((Number)entry.getKey())));
            }

            if (linesThatCanBeAdded >= 9) {
               break;
            }
         }

         scoreboard.addLine("");
         List lines = (List)additionalLines.apply(player);
         if (!lines.isEmpty()) {
            linesThatCanBeAdded = 15 - scoreboard.getLines().size() - 1;

            for(int i = 0; i < lines.size() && linesThatCanBeAdded > 0; ++i) {
               --linesThatCanBeAdded;
               String line = (String)lines.get(i);
               scoreboard.addLine(line);
            }
         }

      };
   }

   public static void getWinnersOnEnd(@Nonnull List winners, @Nonnull Map points) {
      AtomicInteger mostPoints = new AtomicInteger();
      List currentWinners = new LinkedList();
      Iterator var4 = points.entrySet().iterator();

      while(var4.hasNext()) {
         Entry entry = (Entry)var4.next();
         if ((Integer)entry.getValue() > 0) {
            if ((Integer)entry.getValue() == mostPoints.get()) {
               currentWinners.add((Player)entry.getKey());
            } else if ((Integer)entry.getValue() > mostPoints.get()) {
               mostPoints.set((Integer)entry.getValue());
               currentWinners.clear();
               currentWinners.add((Player)entry.getKey());
            }
         }
      }

      winners.addAll(currentWinners);
   }
}
