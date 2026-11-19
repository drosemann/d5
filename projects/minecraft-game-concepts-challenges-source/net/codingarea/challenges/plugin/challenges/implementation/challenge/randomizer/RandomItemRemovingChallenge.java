package net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer;

import java.util.Iterator;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.entity.Player;

@Since("2.0")
public class RandomItemRemovingChallenge extends TimedChallenge {
   public RandomItemRemovingChallenge() {
      super(MenuType.CHALLENGES, 1, 30, 30);
      this.setCategory(SettingCategory.RANDOMIZER);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DROPPER, Message.forName("item-random-removing-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-time-seconds-description").asArray(this.getValue() * 10);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeSecondsValueChangeTitle(this, this.getValue() * 10);
   }

   protected int getSecondsUntilNextActivation() {
      return this.getValue();
   }

   protected void onTimeActivation() {
      this.restartTimer();
      Iterator var1 = Bukkit.getOnlinePlayers().iterator();

      while(var1.hasNext()) {
         Player player = (Player)var1.next();
         if (!ignorePlayer(player) && player.getInventory().getContents().length > 0) {
            Bukkit.getScheduler().runTask(plugin, () -> {
               InventoryUtils.removeRandomItem(player.getInventory());
            });
         }
      }

   }
}
