package net.anweisen.utilities.bukkit.utils.menu.positions;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Consumer;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;

public class SlottedMenuPosition implements MenuPosition {
   protected final Map actions = new HashMap();
   protected boolean emptySound = true;

   public void handleClick(@Nonnull MenuClickInfo info) {
      Consumer action = (Consumer)this.actions.get(info.getSlot());
      if (action == null) {
         if (this.emptySound) {
            SoundSample.CLICK.play(info.getPlayer());
         }

      } else {
         action.accept(info);
      }
   }

   @Nonnull
   public SlottedMenuPosition setAction(int slot, @Nonnull Consumer action) {
      this.actions.put(slot, action);
      return this;
   }

   @Nonnull
   public SlottedMenuPosition setPlayerAction(int slot, @Nonnull Consumer action) {
      return this.setAction(slot, (info) -> {
         action.accept(info.getPlayer());
      });
   }

   @Nonnull
   public SlottedMenuPosition setAction(int slot, @Nonnull Runnable action) {
      return this.setAction(slot, (info) -> {
         action.run();
      });
   }

   public SlottedMenuPosition setEmptySound(boolean playSound) {
      this.emptySound = playSound;
      return this;
   }
}
