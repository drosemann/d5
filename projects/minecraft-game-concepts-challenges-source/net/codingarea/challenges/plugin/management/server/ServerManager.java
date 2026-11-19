package net.codingarea.challenges.plugin.management.server;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Supplier;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.misc.StringUtils;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.IGoal;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.World.Environment;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

public final class ServerManager {
   private final boolean setSpectatorOnWin;
   private final boolean dropItemsOnEnd;
   private final boolean winSounds;
   private boolean isFresh;
   private boolean hasCheated = false;

   public ServerManager() {
      Document sessionConfig = Challenges.getInstance().getConfigManager().getSessionConfig();
      this.hasCheated = sessionConfig.getBoolean("cheated");
      this.isFresh = sessionConfig.getBoolean("fresh", true);
      Document pluginConfig = Challenges.getInstance().getConfigDocument();
      this.setSpectatorOnWin = pluginConfig.getBoolean("set-spectator-on-win");
      this.dropItemsOnEnd = pluginConfig.getBoolean("drop-items-on-end");
      this.winSounds = pluginConfig.getBoolean("enabled-win-sounds");
   }

   public void setNotFresh() {
      this.isFresh = false;
      Challenges.getInstance().getConfigManager().getSessionConfig().set("fresh", false);
   }

   public void setHasCheated() {
      this.hasCheated = true;
      Challenges.getInstance().getConfigManager().getSessionConfig().set("cheated", true);
   }

   public boolean isFresh() {
      return this.isFresh;
   }

   public boolean hasCheated() {
      return this.hasCheated;
   }

   public void endChallenge(@Nonnull ChallengeEndCause endCause, Supplier winnerGetter) {
      if (ChallengeAPI.isPaused()) {
         Logger.warn("Tried to end challenge while timer was paused");
      } else {
         IGoal currentGoal = Challenges.getInstance().getChallengeManager().getCurrentGoal();
         List winners = new LinkedList();
         if (winnerGetter != null) {
            winners = (List)winnerGetter.get();
         } else if (currentGoal != null && endCause.isWinnable()) {
            currentGoal.getWinnersOnEnd((List)winners);
         }

         if (endCause != ChallengeEndCause.GOAL_REACHED || this.setSpectatorOnWin) {
            this.setSpectator();
         }

         if (endCause == ChallengeEndCause.GOAL_REACHED && this.winSounds && currentGoal != null && currentGoal.getWinSound() != null) {
            currentGoal.getWinSound().broadcast();
         }

         if (this.dropItemsOnEnd) {
            Iterator var5 = Bukkit.getOnlinePlayers().iterator();

            while(var5.hasNext()) {
               Player player = (Player)var5.next();
               if (!((List)winners).isEmpty() && !((List)winners).contains(player)) {
                  this.dropItems(player);
               }
            }
         }

         Challenges.getInstance().getChallengeTimer().pause(false);
         String winnerString = StringUtils.getIterableAsString((Iterable)winners, "§7, ", (playerx) -> {
            return "§e§l" + NameHelper.getName(playerx);
         });
         String time = Challenges.getInstance().getChallengeTimer().getFormattedTime();
         String seed = Bukkit.getWorlds().isEmpty() ? "?" : String.valueOf(ChallengeAPI.getGameWorld(Environment.NORMAL).getSeed());
         endCause.getMessage(!((List)winners).isEmpty()).broadcast(Prefix.CHALLENGES, time, winnerString, seed);
      }
   }

   private void setSpectator() {
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(var1.hasNext()) {
         Player player = (Player)var1.next();
         player.setGameMode(GameMode.SPECTATOR);
         SoundSample.BLAST.play(player);

         try {
            player.getWorld().spawnEntity(player.getLocation(), MinecraftNameWrapper.FIREWORK);
         } catch (IllegalArgumentException var4) {
         }
      }

   }

   private void dropItems(@Nonnull Player player) {
      this.dropItems(player.getLocation(), player.getInventory().getContents());
      player.getInventory().clear();
   }

   private void dropItems(@Nonnull Location location, @Nonnull ItemStack[] items) {
      ItemStack[] var3 = items;
      int var4 = items.length;

      for(int var5 = 0; var5 < var4; ++var5) {
         ItemStack item = var3[var5];
         if (item != null && !BukkitReflectionUtils.isAir(item.getType())) {
            if (location.getWorld() == null) {
               return;
            }

            location.getWorld().dropItem(location, item);
         }
      }

   }
}
