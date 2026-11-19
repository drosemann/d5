package net.codingarea.challenges.plugin.challenges.implementation.challenge.damage;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.spigot.events.PlayerJumpEvent;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import org.bukkit.Color;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;

@Since("2.0")
public class JumpDamageChallenge extends SettingModifier {
   public JumpDamageChallenge() {
      super(MenuType.CHALLENGES, 1, 60);
      this.setCategory(SettingCategory.DAMAGE);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return (new ItemBuilder.LeatherArmorBuilder(Material.LEATHER_BOOTS, Message.forName("item-jump-damage-challenge"))).setColor(Color.ORANGE);
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-heart-damage-description").asArray((float)this.getValue() / 2.0F);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeHeartsValueChangeTitle(this, this.getValue() / 2);
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onSneak(@Nonnull PlayerJumpEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            Message.forName("jump-damage-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()));
            event.getPlayer().setNoDamageTicks(0);
            event.getPlayer().damage((double)this.getValue());
            event.getPlayer().setNoDamageTicks(0);
         }
      }
   }
}
