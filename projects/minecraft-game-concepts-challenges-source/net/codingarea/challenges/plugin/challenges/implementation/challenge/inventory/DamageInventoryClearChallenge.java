package net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.entity.EntityDamageEvent;

public class DamageInventoryClearChallenge extends SettingModifier {
   public DamageInventoryClearChallenge() {
      super(MenuType.CHALLENGES, 1, 2);
      this.setCategory(SettingCategory.INVENTORY);
   }

   @EventHandler
   public void onDamage(@Nonnull EntityDamageEvent event) {
      if (event.getEntity() instanceof Player) {
         if (this.shouldExecuteEffect()) {
            if (!ChallengeHelper.finalDamageIsNull(event)) {
               if (this.getValue() == 1) {
                  Bukkit.getOnlinePlayers().forEach((playerx) -> {
                     playerx.getInventory().clear();
                  });
               } else {
                  Player player = (Player)event.getEntity();
                  player.getInventory().clear();
               }

            }
         }
      }
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CHEST, Message.forName("item-damage-inv-clear-challenge"));
   }

   @Nonnull
   public ItemBuilder createSettingsItem() {
      return this.getValue() == 1 ? DefaultItem.create(Material.ENDER_CHEST, Message.forName("everyone")) : DefaultItem.create(Material.PLAYER_HEAD, Message.forName("player"));
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() == 0 ? Message.forName("everyone").asString() : Message.forName("player").asString()));
   }
}
