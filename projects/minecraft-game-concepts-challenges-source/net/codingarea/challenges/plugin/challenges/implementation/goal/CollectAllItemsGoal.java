package net.codingarea.challenges.plugin.challenges.implementation.goal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.annotations.Since;
import net.anweisen.utilities.common.collection.SeededRandomWrapper;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.item.ItemUtils;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.inventory.ItemStack;

@Since("2.0")
public class CollectAllItemsGoal extends SettingGoal implements SenderCommand {
   private final int totalItemsCount;
   private SeededRandomWrapper random = new SeededRandomWrapper();
   private List allItemsToFind;
   private List itemsToFind;
   private Material currentItem;

   public CollectAllItemsGoal() {
      this.reloadItemsToFind();
      this.totalItemsCount = this.itemsToFind.size();
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.GRASS_BLOCK, Message.forName("item-all-items-goal"));
   }

   private void reloadItemsToFind() {
      this.allItemsToFind = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
      this.allItemsToFind.removeIf((material) -> {
         return !material.isItem();
      });
      this.allItemsToFind.removeIf((material) -> {
         return !ItemUtils.isObtainableInSurvival(material);
      });
      Collections.shuffle(this.allItemsToFind, this.random);
      this.itemsToFind = new ArrayList(this.allItemsToFind);
      this.nextItem();
      if (this.isEnabled()) {
         this.bossbar.update();
      }

   }

   private void nextItem() {
      if (this.itemsToFind.isEmpty()) {
         ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
      } else {
         this.currentItem = (Material)this.itemsToFind.remove(0);
      }
   }

   protected void onEnable() {
      this.bossbar.setContent((bossbar, player) -> {
         if (this.currentItem == null) {
            bossbar.setTitle(Message.forName("bossbar-all-items-finished").asString());
         } else {
            bossbar.setTitle(Message.forName("bossbar-all-items-current-max").asComponent(this.currentItem, this.totalItemsCount - this.itemsToFind.size() + 1, this.totalItemsCount));
         }
      });
      this.bossbar.show();
   }

   protected void onDisable() {
      this.bossbar.hide();
   }

   public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
      if (!this.isEnabled()) {
         Message.forName("challenge-disabled").send(sender, Prefix.CHALLENGES);
         SoundSample.BASS_OFF.playIfPlayer(sender);
      } else if (this.currentItem == null) {
         Message.forName("all-items-already-finished").send(sender, Prefix.CHALLENGES);
         SoundSample.BASS_OFF.playIfPlayer(sender);
      } else {
         Message.forName("all-items-skipped").broadcast(Prefix.CHALLENGES, this.currentItem);
         SoundSample.PLING.broadcast();
         this.nextItem();
         this.bossbar.update();
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onClick(@Nonnull PlayerInventoryClickEvent event) {
      if (!event.isCancelled()) {
         ItemStack item = event.getCurrentItem();
         if (item != null) {
            this.handleNewItem(item.getType(), event.getPlayer());
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onPickUp(@Nonnull PlayerPickupItemEvent event) {
      Material material = event.getItem().getItemStack().getType();
      this.handleNewItem(material, event.getPlayer());
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onInteract(@Nonnull PlayerInteractEvent event) {
      Bukkit.getScheduler().runTaskLater(plugin, () -> {
         ItemStack item = event.getPlayer().getInventory().getItemInMainHand();
         Material material = item.getType();
         this.handleNewItem(material, event.getPlayer());
      }, 1L);
   }

   protected void handleNewItem(@Nullable Material material, @Nonnull Player player) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(player)) {
            if (this.currentItem == material) {
               Message.forName("all-items-found").broadcast(Prefix.CHALLENGES, this.currentItem, NameHelper.getName(player));
               SoundSample.PLING.broadcast();
               this.nextItem();
               this.bossbar.update();
            }
         }
      }
   }

   public void getWinnersOnEnd(@Nonnull List winners) {
   }

   public void loadGameState(@Nonnull Document document) {
      super.loadGameState(document);
      this.random = new SeededRandomWrapper(document.getLong("seed"));
      this.reloadItemsToFind();

      for(int i = 0; i < document.getInt("found"); ++i) {
         this.nextItem();
      }

   }

   public void writeGameState(@Nonnull Document document) {
      super.writeGameState(document);
      document.set("seed", this.random.getSeed());
      document.set("found", this.totalItemsCount - this.itemsToFind.size());
   }

   public Material getCurrentItem() {
      return this.currentItem;
   }

   public List getItemsToFind() {
      return this.itemsToFind;
   }

   public List getAllItemsToFind() {
      return this.allItemsToFind;
   }

   public int getTotalItemsCount() {
      return this.totalItemsCount;
   }
}
