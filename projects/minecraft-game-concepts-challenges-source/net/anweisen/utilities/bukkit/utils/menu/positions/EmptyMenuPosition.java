package net.anweisen.utilities.bukkit.utils.menu.positions;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;

public class EmptyMenuPosition implements MenuPosition {
   public void handleClick(@Nonnull MenuClickInfo info) {
      SoundSample.CLICK.play(info.getPlayer());
   }
}
