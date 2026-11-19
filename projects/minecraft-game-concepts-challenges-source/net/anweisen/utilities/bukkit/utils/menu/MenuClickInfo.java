package net.anweisen.utilities.bukkit.utils.menu;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;

public class MenuClickInfo {
   protected final Player player;
   protected final Inventory inventory;
   protected final boolean shiftClick;
   protected final boolean rightClick;
   protected final int slot;

   public MenuClickInfo(@Nonnull Player player, @Nonnull Inventory inventory, boolean shiftClick, boolean rightClick, @Nonnegative int slot) {
      this.player = player;
      this.inventory = inventory;
      this.shiftClick = shiftClick;
      this.rightClick = rightClick;
      this.slot = slot;
   }

   @Nonnull
   public Player getPlayer() {
      return this.player;
   }

   @Nonnull
   public Inventory getInventory() {
      return this.inventory;
   }

   public boolean isRightClick() {
      return this.rightClick;
   }

   public boolean isLeftClick() {
      return !this.rightClick;
   }

   public boolean isShiftClick() {
      return this.shiftClick;
   }

   public int getSlot() {
      return this.slot;
   }

   @Nullable
   public ItemStack getClickedItem() {
      return this.inventory.getItem(this.slot);
   }

   @Nonnull
   public Material getClickedMaterial() {
      return this.getClickedItem() == null ? Material.AIR : this.getClickedItem().getType();
   }

   public String toString() {
      return "MenuClickInfo{player=" + this.player + ", inventory=" + this.inventory + ", shiftClick=" + this.shiftClick + ", rightClick=" + this.rightClick + ", slot=" + this.slot + '}';
   }
}
