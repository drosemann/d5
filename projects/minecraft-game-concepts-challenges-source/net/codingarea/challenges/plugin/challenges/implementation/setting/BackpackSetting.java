package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeConfigHelper;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
import net.codingarea.challenges.plugin.utils.bukkit.container.BukkitSerialization;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.inventory.ItemStack;

public class BackpackSetting extends SettingModifier implements PlayerCommand {
   public static final int SHARED = 1;
   public static final int PLAYER = 2;
   private final int size = Math.max(Math.min(ChallengeConfigHelper.getSettingsDocument().getInt("backpack-size") * 9, 54), 9);
   private final Map backpacks = new HashMap();
   private final Inventory sharedBackpack = this.createInventory("§5Team Backpack");

   public BackpackSetting() {
      super(MenuType.SETTINGS, 1, 2, 1);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CHEST, Message.forName("item-backpack-setting"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      return this.getValue() == 1 ? DefaultItem.create(Material.ENDER_CHEST, Message.forName("item-backpack-setting-team")) : DefaultItem.create(Material.PLAYER_HEAD, Message.forName("item-backpack-setting-player"));
   }

   public void playValueChangeTitle() {
      switch(this.getValue()) {
      case 1:
         ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("item-backpack-setting-team"));
         break;
      case 2:
         ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("item-backpack-setting-player"));
         break;
      default:
         ChallengeHelper.playToggleChallengeTitle(this, false);
      }

   }

   public void onCommand(@Nonnull Player player, @Nonnull String[] args) {
      if (ChallengeAPI.isPaused()) {
         Message.forName("timer-not-started").send(player, Prefix.BACKPACK);
         SoundSample.BASS_OFF.play(player);
      } else if (!this.isEnabled()) {
         Message.forName("backpacks-disabled").send(player, Prefix.BACKPACK);
         SoundSample.BASS_OFF.play(player);
      } else {
         if (this.getValue() != 1 && this.getValue() != 2) {
            Message.forName("backpacks-disabled").send(player, Prefix.BACKPACK);
            SoundSample.BASS_OFF.play(player);
         } else {
            Message.forName("backpack-opened").send(player, Prefix.BACKPACK, this.getValue() == 1 ? "§5Team Backpack" : "§6Player Backpack");
            player.openInventory(this.getCurrentBackpack(player));
            SoundSample.OPEN.play(player);
         }

      }
   }

   public void loadGameState(@Nonnull Document document) {
      super.loadGameState(document);
      this.loadChecked(document, "shared", this.sharedBackpack);
      Document players = document.getDocument("players");
      Iterator var3 = players.keys().iterator();

      while(var3.hasNext()) {
         String key = (String)var3.next();
         this.loadChecked(players, key, (Inventory)this.backpacks.computeIfAbsent(UUID.fromString(key), (k) -> {
            return this.createInventory("§6Backpack");
         }));
      }

   }

   protected void loadChecked(@Nonnull Document document, @Nonnull String key, @Nonnull Inventory inventory) {
      if (document.isDocument(key)) {
         this.loadLegacy(document.getDocument(key), inventory);
      } else {
         try {
            String value = document.getString(key);
            if (value == null) {
               return;
            }

            BukkitSerialization.fromBase64(inventory, value);
         } catch (IOException var5) {
            Challenges.getInstance().getLogger().error("", new Object[]{var5});
         }
      }

   }

   protected void loadLegacy(@Nonnull Document document, @Nonnull Inventory inventory) {
      Iterator var3 = document.keys().iterator();

      while(var3.hasNext()) {
         String key = (String)var3.next();

         try {
            int index = Integer.parseInt(key);
            ItemStack item = (ItemStack)document.getSerializable(key, ItemStack.class);
            inventory.setItem(index, item);
         } catch (Exception var7) {
         }
      }

   }

   public void writeGameState(@Nonnull Document document) {
      super.writeGameState(document);
      this.write(document, "shared", this.sharedBackpack);
      Document players = document.getDocument("players");
      this.backpacks.forEach((uuid, inventory) -> {
         this.write(players, uuid.toString(), inventory);
      });
   }

   protected void write(@Nonnull Document document, @Nonnull String key, @Nonnull Inventory inventory) {
      document.set(key, BukkitSerialization.toBase64(inventory));
   }

   @Nonnull
   protected Inventory createInventory(@Nonnull String title) {
      return Bukkit.createInventory((InventoryHolder)null, this.size, InventoryTitleManager.getTitle(title));
   }

   @Nonnull
   protected Inventory getCurrentBackpack(@Nonnull Player player) {
      return this.getValue() == 1 ? this.sharedBackpack : (Inventory)this.backpacks.computeIfAbsent(player.getUniqueId(), (key) -> {
         return this.createInventory("§6Backpack");
      });
   }
}
