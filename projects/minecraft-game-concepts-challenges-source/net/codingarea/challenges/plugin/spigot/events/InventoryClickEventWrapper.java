package net.codingarea.challenges.plugin.spigot.events;

import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.bukkit.entity.HumanEntity;
import org.bukkit.event.Event;
import org.bukkit.event.Event.Result;
import org.bukkit.event.inventory.ClickType;
import org.bukkit.event.inventory.InventoryAction;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.event.inventory.InventoryType.SlotType;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryView;
import org.bukkit.inventory.ItemStack;

public abstract class InventoryClickEventWrapper extends Event {
   private final InventoryClickEvent event;

   public InventoryClickEventWrapper(@Nonnull InventoryClickEvent event) {
      this.event = event;
   }

   @Nullable
   public Inventory getClickedInventory() {
      return this.event.getClickedInventory();
   }

   @Nonnull
   public Inventory getInventory() {
      return this.event.getInventory();
   }

   @Nonnull
   public InventoryView getView() {
      return this.event.getView();
   }

   @Nonnull
   public ClickType getClick() {
      return this.event.getClick();
   }

   @Nonnull
   public HumanEntity getWhoClicked() {
      return this.event.getWhoClicked();
   }

   public int getSlot() {
      return this.event.getSlot();
   }

   public int getRawSlot() {
      return this.event.getRawSlot();
   }

   @Nonnull
   public InventoryAction getAction() {
      return this.event.getAction();
   }

   @Nullable
   public ItemStack getCursor() {
      return this.event.getCursor();
   }

   public int getHotbarButton() {
      return this.event.getHotbarButton();
   }

   @Nonnull
   public SlotType getSlotType() {
      return this.event.getSlotType();
   }

   @Nonnull
   public Result getResult() {
      return this.event.getResult();
   }

   public void setResult(@Nonnull Result result) {
      this.event.setResult(result);
   }

   @Nullable
   public ItemStack getCurrentItem() {
      return this.event.getCurrentItem();
   }

   public void setCurrentItem(@Nullable ItemStack item) {
      this.event.setCurrentItem(item);
   }

   @Nonnull
   public List getViewers() {
      return this.event.getViewers();
   }

   @Nonnull
   public InventoryClickEvent getEvent() {
      return this.event;
   }

   public boolean isCancelled() {
      return this.event.isCancelled();
   }

   public void setCancelled(boolean cancel) {
      this.event.setCancelled(cancel);
   }

   public boolean isRightClick() {
      return this.event.isRightClick();
   }

   public boolean isLeftClick() {
      return this.event.isLeftClick();
   }

   public boolean isShiftClick() {
      return this.event.isShiftClick();
   }
}
