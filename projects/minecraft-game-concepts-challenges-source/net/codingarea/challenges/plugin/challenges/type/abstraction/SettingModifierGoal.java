package net.codingarea.challenges.plugin.challenges.type.abstraction;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.IGoal;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;

public abstract class SettingModifierGoal extends SettingModifier implements IGoal {
   public SettingModifierGoal(@Nonnull MenuType menu) {
      super(menu);
   }

   public SettingModifierGoal(@Nonnull MenuType menu, int max) {
      super(menu, max);
   }

   public SettingModifierGoal(@Nonnull MenuType menu, int min, int max) {
      super(menu, min, max);
   }

   public SettingModifierGoal(@Nonnull MenuType menu, int min, int max, int defaultValue) {
      super(menu, min, max, defaultValue);
   }

   public final void setEnabled(boolean enabled) {
      if (this.isEnabled() != enabled) {
         GoalHelper.handleSetEnabled(this, enabled);
         super.setEnabled(enabled);
      }
   }

   @Nonnull
   public SoundSample getStartSound() {
      return SoundSample.DRAGON_BREATH;
   }

   @Nullable
   public SoundSample getWinSound() {
      return SoundSample.WIN;
   }

   public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
      if (info.isLowerItemClick() && this.isEnabled()) {
         ChallengeHelper.handleModifierClick(info, this);
      } else {
         this.setEnabled(!this.isEnabled());
         SoundSample.playStatusSound(info.getPlayer(), this.isEnabled());
         this.playStatusUpdateTitle();
      }

   }
}
