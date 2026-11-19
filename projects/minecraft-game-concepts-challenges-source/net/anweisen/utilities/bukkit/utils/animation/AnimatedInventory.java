package net.anweisen.utilities.bukkit.utils.animation;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.core.BukkitModule;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.plugin.java.JavaPlugin;

public class AnimatedInventory {
   private final List frames;
   private final InventoryHolder holder;
   private final int size;
   private final String title;
   private SoundSample frameSound;
   private SoundSample endSound;
   private int frameDelay;

   public AnimatedInventory(@Nonnull String title, int size) {
      this(title, size, (InventoryHolder)null);
   }

   public AnimatedInventory(@Nonnull String title, int size, @Nullable InventoryHolder holder) {
      this.frames = new ArrayList();
      this.frameSound = SoundSample.CLICK;
      this.endSound = SoundSample.OPEN;
      this.frameDelay = 1;
      this.title = title;
      this.size = size;
      this.holder = holder;
   }

   public void open(@Nonnull Player player) {
      this.open(player, BukkitModule.getFirstInstance());
   }

   public void open(@Nonnull Player player, @Nonnull JavaPlugin plugin) {
      if (!Bukkit.isPrimaryThread()) {
         Bukkit.getScheduler().runTask(plugin, () -> {
            this.open(player, plugin);
         });
      } else {
         Inventory inventory = this.createInventory();
         this.applyFrame(inventory, 0, player);
         player.openInventory(inventory);
         AtomicInteger index = new AtomicInteger(1);
         Bukkit.getScheduler().runTaskTimer(plugin, (task) -> {
            boolean opened = inventory.getViewers().contains(player);
            if (index.get() < this.frames.size() && opened) {
               this.applyFrame(inventory, index.get(), player);
               index.incrementAndGet();
            } else {
               task.cancel();
            }
         }, (long)this.frameDelay, (long)this.frameDelay);
      }
   }

   public void openNotAnimated(@Nonnull Player player, boolean playSound) {
      this.openNotAnimated(player, playSound, BukkitModule.getFirstInstance());
   }

   public void openNotAnimated(@Nonnull Player player, boolean playSound, @Nonnull JavaPlugin plugin) {
      if (!Bukkit.isPrimaryThread()) {
         Bukkit.getScheduler().runTask(plugin, () -> {
            this.openNotAnimated(player, playSound, plugin);
         });
      } else {
         Inventory inventory = this.createInventory();
         if (!this.frames.isEmpty()) {
            AnimationFrame frame = this.getLastFrame();
            inventory.setContents(frame.getContent());
         }

         player.openInventory(inventory);
         if (playSound && this.endSound != null) {
            this.endSound.play(player);
         }

      }
   }

   private void applyFrame(@Nonnull Inventory inventory, int index, @Nonnull Player viewer) {
      AnimationFrame frame = (AnimationFrame)this.frames.get(index);
      inventory.setContents(frame.getContent());
      if (index == this.frames.size() - 1 && this.endSound != null) {
         this.endSound.play(viewer);
      } else if (this.frameSound != null && frame.shouldPlaySound()) {
         this.frameSound.play(viewer);
      }

   }

   @Nonnull
   public AnimatedInventory addFrame(@Nonnull AnimationFrame frame) {
      if (this.size != frame.getSize()) {
         throw new IllegalArgumentException("AnimationFrame must have the same size (Expected " + this.size + "; Got " + frame.getSize() + ")");
      } else {
         this.frames.add(frame);
         return this;
      }
   }

   @Nonnull
   public AnimationFrame createAndAdd() {
      AnimationFrame frame = new AnimationFrame(this.size);
      this.addFrame(frame);
      return frame;
   }

   @Nonnull
   public AnimationFrame getFrame(int index) {
      return (AnimationFrame)this.frames.get(index);
   }

   @Nonnull
   public AnimationFrame getOrCreateFrame(int index) {
      while(this.frames.size() <= index) {
         this.cloneLastAndAdd();
      }

      return this.getFrame(index);
   }

   @Nonnull
   public AnimationFrame cloneAndAdd(int index) {
      AnimationFrame frame = this.getFrame(index).clone();
      this.addFrame(frame);
      return frame;
   }

   @Nonnull
   public AnimationFrame getLastFrame() {
      if (this.frames.isEmpty()) {
         throw new IllegalStateException("Frames are empty");
      } else {
         return this.getFrame(this.frames.size() - 1);
      }
   }

   @Nonnull
   public AnimationFrame cloneLastAndAdd() {
      AnimationFrame frame = this.getLastFrame().clone();
      this.addFrame(frame);
      return frame;
   }

   @Nonnull
   public AnimatedInventory setEndSound(@Nullable SoundSample endSound) {
      this.endSound = endSound;
      return this;
   }

   @Nonnull
   public AnimatedInventory setFrameSound(@Nullable SoundSample frameSound) {
      this.frameSound = frameSound;
      return this;
   }

   @Nonnull
   public AnimatedInventory setFrameDelay(int delay) {
      if (delay < 1) {
         throw new IllegalArgumentException("Delay cannot be smaller than 1");
      } else {
         this.frameDelay = delay;
         return this;
      }
   }

   @Nonnull
   private Inventory createInventory() {
      return Bukkit.createInventory(this.holder, this.size, this.title);
   }
}
