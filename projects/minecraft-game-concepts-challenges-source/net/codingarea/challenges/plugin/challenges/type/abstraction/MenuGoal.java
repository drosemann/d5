package net.codingarea.challenges.plugin.challenges.type.abstraction;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.IGoal;
import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import org.jetbrains.annotations.NotNull;

public abstract class MenuGoal extends MenuSetting implements IGoal {
   public MenuGoal(@NotNull MenuType menu, @NotNull Message title) {
      super(menu, title);
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
}
