package net.codingarea.challenges.plugin.challenges.type;

import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;

public interface IGoal extends IChallenge {
   void setEnabled(boolean var1);

   @Nonnull
   SoundSample getStartSound();

   @Nullable
   SoundSample getWinSound();

   void getWinnersOnEnd(@Nonnull List var1);
}
