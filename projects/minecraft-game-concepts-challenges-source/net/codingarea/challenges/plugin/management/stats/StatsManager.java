package net.codingarea.challenges.plugin.management.stats;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import lombok.Generated;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.database.exceptions.DatabaseException;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.management.scheduler.policy.ChallengeStatusPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.spigot.listener.StatsListener;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;

public final class StatsManager implements Listener {
   private final boolean enabled = Challenges.getInstance().getConfigDocument().getBoolean("save-player-stats");
   private final boolean noStatsAfterCheating;
   private final Map cache = new ConcurrentHashMap();
   private List cachedLeaderboard;
   private long leaderboardCacheTimestamp;

   public StatsManager() {
      this.noStatsAfterCheating = this.enabled && Challenges.getInstance().getConfigDocument().getBoolean("no-stats-after-cheating");
   }

   @Nonnull
   public static Comparator getStatsComparator(@Nonnull Statistic statistic) {
      return Comparator.comparingDouble((value) -> {
         return value.getStatisticValue(statistic);
      }).reversed();
   }

   public void register() {
      if (this.enabled) {
         StatsListener listener = new StatsListener();
         ChallengeAPI.registerScheduler(this, listener);
         Challenges.getInstance().registerListener(new Listener[]{this, listener});
      }

   }

   @EventHandler(
      priority = EventPriority.MONITOR
   )
   public void onLeave(@Nonnull PlayerQuitEvent event) {
      PlayerStats cached = (PlayerStats)this.cache.remove(event.getPlayer().getUniqueId());
      if (cached != null) {
         this.store(event.getPlayer().getUniqueId(), cached);
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR
   )
   public void onJoin(@Nonnull PlayerJoinEvent event) {
      this.getStats(event.getPlayer());
   }

   @ScheduledTask(
      ticks = 600,
      challengePolicy = ChallengeStatusPolicy.ALWAYS
   )
   public void storeCached() {
      Iterator var1 = this.cache.entrySet().iterator();

      while(var1.hasNext()) {
         Entry entry = (Entry)var1.next();
         this.store((UUID)entry.getKey(), (PlayerStats)entry.getValue());
      }

   }

   private void store(@Nonnull UUID uuid, @Nonnull PlayerStats stats) {
      try {
         Challenges.getInstance().getDatabaseManager().getDatabase().insertOrUpdate("challenges").where("uuid", (Object)uuid).set("stats", stats.asDocument()).execute();
         Logger.debug("Saved stats for {}: {}", uuid, stats);
      } catch (DatabaseException var4) {
         Logger.error("Could not save player stats for {}", uuid, var4);
      }

   }

   @Nonnull
   public PlayerStats getStats(@Nonnull Player player) {
      return this.getStats(player.getUniqueId(), player.getName());
   }

   @Nonnull
   public PlayerStats getStats(@Nonnull UUID uuid, @Nonnull String name) {
      PlayerStats cached = (PlayerStats)this.cache.get(uuid);
      if (cached != null) {
         return cached;
      } else {
         try {
            PlayerStats stats = this.getStatsFromDatabase(uuid, name);
            if (Bukkit.getPlayer(uuid) != null) {
               this.cache.put(uuid, stats);
               Logger.debug("Loaded stats for uuid {}: {}", uuid, stats);
            }

            return stats;
         } catch (DatabaseException var5) {
            Logger.error("Could not get player stats for {}", uuid, var5);
            return new PlayerStats(uuid, name);
         }
      }
   }

   @Nonnull
   private PlayerStats getStatsFromDatabase(@Nonnull UUID uuid, @Nonnull String name) throws DatabaseException {
      return (PlayerStats)Challenges.getInstance().getDatabaseManager().getDatabase().query("challenges").select("stats", "name").where("uuid", (Object)uuid).execute().first().map((result) -> {
         return new PlayerStats(uuid, result.getString("name"), result.getDocument("stats"));
      }).orElse(new PlayerStats(uuid, name));
   }

   @Nonnull
   private List getAllStats() throws DatabaseException {
      if (this.cachedLeaderboard != null && System.currentTimeMillis() - this.leaderboardCacheTimestamp < 180000L) {
         return this.cachedLeaderboard;
      } else {
         this.leaderboardCacheTimestamp = System.currentTimeMillis();
         return this.cachedLeaderboard = this.getAllStats0();
      }
   }

   @Nonnull
   private List getAllStats0() throws DatabaseException {
      return (List)Challenges.getInstance().getDatabaseManager().getDatabase().query("challenges").select("uuid", "stats", "name").execute().all().filter((result) -> {
         return result.getUUID("uuid") != null;
      }).map((result) -> {
         return new PlayerStats(result.getUUID("uuid"), result.getString("name"), result.getDocument("stats"));
      }).collect(Collectors.toList());
   }

   @Nonnull
   public LeaderboardInfo getLeaderboardInfo(@Nonnull UUID uuid) {
      try {
         List stats = this.getAllStats();
         LeaderboardInfo info = new LeaderboardInfo();
         Statistic[] var4 = Statistic.values();
         int var5 = var4.length;

         for(int var6 = 0; var6 < var5; ++var6) {
            Statistic statistic = var4[var6];
            int place = this.determineIndex(new ArrayList(stats), PlayerStats::getPlayerUUID, uuid, getStatsComparator(statistic)) + 1;
            info.setPlace(statistic, place);
         }

         return info;
      } catch (DatabaseException var9) {
         Logger.error("Could not get player leaderboard information for {}", uuid, var9);
         return new LeaderboardInfo();
      }
   }

   @Nonnull
   public List getLeaderboard(@Nonnull Statistic statistic) {
      try {
         List stats = this.getAllStats();
         stats.sort(getStatsComparator(statistic));
         return stats;
      } catch (Exception var3) {
         Logger.error("Could not get leaderboard in {}", statistic, var3);
         return new ArrayList();
      }
   }

   private int determineIndex(@Nonnull List list, @Nonnull Function extractor, @Nonnull Object target, @Nonnull Comparator sort) {
      list.sort(sort);
      int index = 0;

      for(Iterator var6 = list.iterator(); var6.hasNext(); ++index) {
         Object t = var6.next();
         Object u = extractor.apply(t);
         if (target.equals(u)) {
            return index;
         }
      }

      return index;
   }

   public boolean hasDatabaseConnection() {
      return Challenges.getInstance().getDatabaseManager().getDatabase() != null && Challenges.getInstance().getDatabaseManager().isConnected();
   }

   @Generated
   public boolean isEnabled() {
      return this.enabled;
   }

   @Generated
   public boolean isNoStatsAfterCheating() {
      return this.noStatsAfterCheating;
   }
}
