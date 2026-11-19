package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.block.BlockBreakEvent;

public class BlockBreakDamageChallenge extends SettingModifier {
   public BlockBreakDamageChallenge() {
      super(MenuType.CHALLENGES, 1, 60);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @EventHandler
   public void onBreak(BlockBreakEvent event) {
      if (this.shouldExecuteEffect()) {
         event.getPlayer().setNoDamageTicks(0);
         event.getPlayer().damage((double)this.getValue());
      }
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.GOLDEN_PICKAXE, Message.forName("item-block-break-damage-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
   }
}
