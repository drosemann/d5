package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import java.util.Iterator;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;

@Since("2.0")
public class WaterAllergyChallenge extends SettingModifier {
   public WaterAllergyChallenge() {
      super(MenuType.CHALLENGES, 1, 40);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @ScheduledTask(
      ticks = 5,
      async = false
   )
   public void onFifthTick() {
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(var1.hasNext()) {
         Player player = (Player)var1.next();
         if (ignorePlayer(player)) {
            return;
         }

         if (player.getLocation().getBlock().getType() == Material.WATER) {
            player.damage((double)this.getValue());
         }
      }

   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CYAN_GLAZED_TERRACOTTA, Message.forName("item-water-allergy-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
   }
}
