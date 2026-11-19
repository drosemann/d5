package net.codingarea.challenges.plugin.management.menu.info;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import lombok.Generated;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;

public class ChallengeMenuClickInfo extends MenuClickInfo {
   protected final boolean upperItem;

   public ChallengeMenuClickInfo(@Nonnull MenuClickInfo parent, boolean upperItem) {
      this(parent.getPlayer(), parent.getInventory(), parent.isShiftClick(), parent.isRightClick(), parent.getSlot(), upperItem);
   }

   public ChallengeMenuClickInfo(@Nonnull Player player, @Nonnull Inventory inventory, boolean shiftClick, boolean rightClick, @Nonnegative int slot, boolean upperItem) {
      super(player, inventory, shiftClick, rightClick, slot);
      this.upperItem = upperItem;
   }

   public boolean isUpperItemClick() {
      return this.upperItem;
   }

   public boolean isLowerItemClick() {
      return !this.upperItem;
   }

   @Nonnull
   public Player getPlayer() {
      return this.player;
   }

   @Nonnull
   public Inventory getInventory() {
      return this.inventory;
   }

   @Generated
   public String toString() {
      return "ChallengeMenuClickInfo(upperItem=" + this.upperItem + ")";
   }
}
