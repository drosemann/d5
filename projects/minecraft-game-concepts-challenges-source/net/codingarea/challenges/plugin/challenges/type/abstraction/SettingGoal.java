package net.codingarea.challenges.plugin.challenges.type.abstraction;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.IGoal;
import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
import net.codingarea.challenges.plugin.management.menu.MenuType;

public abstract class SettingGoal extends Setting implements IGoal {
   public SettingGoal() {
      super(MenuType.GOAL);
   }

   public SettingGoal(boolean enabledByDefault) {
      super(MenuType.GOAL, enabledByDefault);
   }

   @Nonnull
   public SoundSample getStartSound() {
      return SoundSample.DRAGON_BREATH;
   }

   @Nullable
   public SoundSample getWinSound() {
      return SoundSample.WIN;
   }

   public void setEnabled(boolean enabled) {
      if (this.isEnabled() != enabled) {
         GoalHelper.handleSetEnabled(this, enabled);
         super.setEnabled(enabled);
      }
   }
}
