package net.codingarea.challenges.plugin.challenges.implementation.setting;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.item.MaterialWrapper;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.document.GsonDocument;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Modifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.attribute.Attribute;
import org.bukkit.attribute.AttributeInstance;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerJoinEvent;
import org.jetbrains.annotations.NotNull;

public class MaxHealthSetting extends Modifier {
   private Document valueOffset = new GsonDocument();

   public MaxHealthSetting() {
      super(MenuType.SETTINGS, 1, 400, 20);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(MaterialWrapper.RED_DYE, Message.forName("item-max-health-setting"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      return DefaultItem.value(this.getValue(), "§e").appendName(" §7HP §8(§e" + (float)this.getValue() / 2.0F + " §c❤§8)");
   }

   public void writeGameState(@NotNull Document document) {
      super.writeGameState(document);
      document.set("offset", this.valueOffset);
   }

   public void loadGameState(@NotNull Document document) {
      super.loadGameState(document);
      this.valueOffset = (Document)(document.contains("offset") ? document.getDocument("offset") : new GsonDocument());
      this.onValueChange();
   }

   public void onValueChange() {
      broadcast(this::updateHealth);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
   }

   @EventHandler
   public void onJoin(@Nonnull PlayerJoinEvent event) {
      this.updateHealth(event.getPlayer());
   }

   private void updateHealth(Player player) {
      AttributeInstance attribute = player.getAttribute(Attribute.GENERIC_MAX_HEALTH);
      if (attribute != null) {
         int newMaxHealth = this.getMaxHealth(player);
         double oldMaxHealth = attribute.getBaseValue();
         if (newMaxHealth <= 0) {
            ChallengeHelper.kill(player);
            this.valueOffset.remove(player.getUniqueId().toString());
         } else {
            if (oldMaxHealth != (double)newMaxHealth) {
               attribute.setBaseValue((double)newMaxHealth);
               if (oldMaxHealth < (double)newMaxHealth) {
                  double oldHealth = player.getHealth();
                  double newHealth = oldHealth + ((double)newMaxHealth - oldMaxHealth);
                  player.setHealth(Math.min(Math.max(newHealth, 0.0D), (double)newMaxHealth));
               }

               if (MinecraftVersion.current().isNewerThan(MinecraftVersion.V1_19)) {
                  player.sendHealthUpdate();
               }
            }

         }
      }
   }

   public int getMaxHealth(Player player) {
      String key = player.getUniqueId().toString();
      return this.getValue() + this.valueOffset.getInt("all") + this.valueOffset.getInt(key);
   }

   public void addHealth(int health) {
      this.valueOffset.set("all", this.valueOffset.getInt("all") + health);
      this.onValueChange();
   }

   public void addHealth(Player player, int health) {
      String key = player.getUniqueId().toString();
      this.valueOffset.set(key, this.valueOffset.getInt(key) + health);
      this.updateHealth(player);
   }
}
