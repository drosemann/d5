package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.policy.PlayerCountPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.attribute.Attribute;
import org.bukkit.block.Block;
import org.bukkit.block.BlockFace;
import org.bukkit.entity.Arrow;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.entity.Projectile;
import org.bukkit.entity.AbstractArrow.PickupStatus;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.event.block.BlockPlaceEvent;
import org.bukkit.event.entity.EntityDamageEvent;
import org.bukkit.event.entity.ProjectileLaunchEvent;
import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
import org.bukkit.event.entity.EntityDamageEvent.DamageModifier;
import org.bukkit.event.player.PlayerDropItemEvent;
import org.bukkit.event.player.PlayerToggleSneakEvent;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.Damageable;
import org.bukkit.projectiles.ProjectileSource;
import org.bukkit.util.RayTraceResult;
import org.bukkit.util.Vector;

@Since("2.0.2")
public class LoopChallenge extends Setting {
   private static final Map loops = new HashMap();

   public LoopChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.WORLD);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.LEAD, Message.forName("item-loop-challenge"));
   }

   @ScheduledTask(
      ticks = 1,
      async = false
   )
   public void onTick() {
      long currentTimeMillis = System.currentTimeMillis();
      Iterator var3 = (new ArrayList(loops.entrySet())).iterator();

      while(var3.hasNext()) {
         Entry entry = (Entry)var3.next();
         if ((Long)entry.getValue() + 1000L <= currentTimeMillis) {
            ((LoopChallenge.Loop)entry.getKey()).execute();
            loops.put((LoopChallenge.Loop)entry.getKey(), currentTimeMillis);
         }
      }

   }

   @TimerTask(
      status = {TimerStatus.PAUSED},
      async = false,
      playerPolicy = PlayerCountPolicy.ALWAYS
   )
   public void onPause() {
      this.clearLoops();
   }

   private void clearLoops() {
      if (!loops.isEmpty()) {
         broadcast((player) -> {
            (new SoundSample()).addSound(Sound.ENTITY_ITEM_BREAK, 0.5F).play(player);
         });
         Message.forName("loops-cleared").broadcast(Prefix.CHALLENGES, loops.size());
         loops.clear();
      }
   }

   private void createLoop(@Nonnull LoopChallenge.Loop loop) {
      loops.put(loop, System.currentTimeMillis());
   }

   @EventHandler(
      priority = EventPriority.MONITOR
   )
   public void onSneak(@Nonnull PlayerToggleSneakEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            if (event.isSneaking()) {
               this.clearLoops();
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onProjectileLaunch(@Nonnull ProjectileLaunchEvent event) {
      if (this.shouldExecuteEffect()) {
         ProjectileSource shooter = event.getEntity().getShooter();
         if (shooter != null) {
            if (!(shooter instanceof Player) || !ignorePlayer((Player)shooter)) {
               this.createLoop(new LoopChallenge.ProjectileLaunchLoop(event));
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onDamage(@Nonnull EntityDamageEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getEntity() instanceof LivingEntity) {
            double damage = event.getFinalDamage() + event.getDamage(DamageModifier.ABSORPTION);
            if (damage != 0.0D) {
               this.createLoop(new LoopChallenge.EntityDamageLoop((LivingEntity)event.getEntity(), event.getCause(), damage));
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBlockPlace(@Nonnull BlockPlaceEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            this.createLoop(new LoopChallenge.BlockPlaceLoop(event.getBlock().getType(), event.getPlayer(), event.getBlockAgainst().getFace(event.getBlock()), event.getBlock()));
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBlockBreak(@Nonnull BlockBreakEvent event) {
      if (this.shouldExecuteEffect()) {
         Player player = event.getPlayer();
         if (!ignorePlayer(player)) {
            RayTraceResult result = player.getWorld().rayTraceBlocks(player.getEyeLocation(), player.getLocation().getDirection(), 5.0D);
            if (result != null) {
               if (result.getHitBlockFace() != null) {
                  this.createLoop(new LoopChallenge.BlockBreakLoop(player.getInventory().getItemInMainHand(), player, result.getHitBlockFace().getOppositeFace(), event.getBlock()));
               }
            }
         }
      }
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onBlockPlace(@Nonnull PlayerDropItemEvent event) {
      if (this.shouldExecuteEffect()) {
         if (!ignorePlayer(event.getPlayer())) {
            this.createLoop(new LoopChallenge.DropLoop(event.getItemDrop().getItemStack(), event.getPlayer()));
         }
      }
   }

   private interface Loop {
      void execute();

      default void cancel() {
         LoopChallenge.loops.remove(this);
      }
   }

   private static class ProjectileLaunchLoop implements LoopChallenge.Loop {
      private final Vector launchVelocity;
      private final Location launchLocation;
      private final EntityType entityType;

      public ProjectileLaunchLoop(ProjectileLaunchEvent event) {
         this.launchVelocity = event.getEntity().getVelocity();
         this.launchLocation = event.getLocation();
         this.entityType = event.getEntityType();
      }

      public void execute() {
         if (this.launchLocation.getWorld() != null) {
            Projectile projectile = (Projectile)this.launchLocation.getWorld().spawnEntity(this.launchLocation, this.entityType);
            projectile.setVelocity(this.launchVelocity);
            if (projectile instanceof Arrow) {
               ((Arrow)projectile).setPickupStatus(PickupStatus.DISALLOWED);
            }

         }
      }
   }

   private static class EntityDamageLoop implements LoopChallenge.Loop {
      private final LivingEntity entity;
      private final DamageCause damageCause;
      private final double damage;

      public EntityDamageLoop(LivingEntity entity, DamageCause cause, double damage) {
         this.entity = entity;
         this.damageCause = cause;
         this.damage = damage;
      }

      public void execute() {
         if (this.entity.isDead()) {
            this.cancel();
         } else if (!(this.entity instanceof Player) || !AbstractChallenge.ignorePlayer((Player)this.entity)) {
            this.entity.damage(this.damage);
         }
      }
   }

   private static class BlockPlaceLoop implements LoopChallenge.Loop {
      private final Material material;
      private final Player player;
      private final BlockFace blockFace;
      private Block currentBlock;

      public BlockPlaceLoop(Material material, Player player, BlockFace blockFace, Block currentBlock) {
         this.material = material;
         this.player = player;
         this.blockFace = blockFace;
         this.currentBlock = currentBlock;
      }

      public void execute() {
         if (!AbstractChallenge.ignorePlayer(this.player)) {
            this.currentBlock = this.currentBlock.getRelative(this.blockFace);
            if (this.currentBlock.getY() <= this.currentBlock.getWorld().getMaxHeight() && this.currentBlock.getY() >= BukkitReflectionUtils.getMinHeight(this.currentBlock.getWorld())) {
               if (BukkitReflectionUtils.isAir(this.currentBlock.getType()) || !this.currentBlock.getType().isSolid()) {
                  if (!this.decreaseMaterial()) {
                     this.cancel();
                  } else {
                     this.currentBlock.setType(this.material);
                  }
               }
            } else {
               this.cancel();
            }
         }
      }

      private boolean decreaseMaterial() {
         ItemStack item = (ItemStack)Arrays.stream(this.player.getInventory().getContents()).filter(Objects::nonNull).filter((itemStack) -> {
            return itemStack.getType() == this.material;
         }).findFirst().orElse((Object)null);
         if (item == null) {
            return false;
         } else {
            item.setAmount(item.getAmount() - 1);
            return true;
         }
      }
   }

   private static class BlockBreakLoop implements LoopChallenge.Loop {
      private final Player player;
      private final BlockFace blockFace;
      private ItemStack itemStack;
      private Block currentBlock;

      public BlockBreakLoop(ItemStack itemStack, Player player, BlockFace blockFace, Block currentBlock) {
         this.itemStack = itemStack;
         this.player = player;
         this.blockFace = blockFace;
         this.currentBlock = currentBlock;
      }

      public void execute() {
         if (!AbstractChallenge.ignorePlayer(this.player)) {
            this.currentBlock = this.currentBlock.getRelative(this.blockFace);
            if (this.currentBlock.getY() <= this.currentBlock.getWorld().getMaxHeight() && this.currentBlock.getY() >= BukkitReflectionUtils.getMinHeight(this.currentBlock.getWorld())) {
               if (!BukkitReflectionUtils.isAir(this.currentBlock.getType())) {
                  if (!this.decreaseDurability()) {
                     this.cancel();
                  } else if (this.currentBlock.getType() != Material.BEDROCK) {
                     if (this.cantBeBroken(this.currentBlock, this.itemStack)) {
                        this.currentBlock.setType(Material.AIR);
                     } else {
                        ChallengeHelper.breakBlock(this.currentBlock, this.itemStack, this.player.getInventory());
                     }
                  }
               }
            } else {
               this.cancel();
            }
         }
      }

      private boolean decreaseDurability() {
         if (this.itemStack.getType() == Material.AIR) {
            return true;
         } else if (!this.isTool(this.itemStack)) {
            return true;
         } else {
            this.itemStack = (ItemStack)Arrays.stream(this.player.getInventory().getContents()).filter(Objects::nonNull).filter((itemStack) -> {
               return itemStack.isSimilar(this.itemStack);
            }).findFirst().orElse((Object)null);
            if (this.itemStack == null) {
               return false;
            } else if (this.itemStack.getItemMeta() == null) {
               return true;
            } else {
               Damageable damageable = (Damageable)this.itemStack.getItemMeta();
               if (damageable == null) {
                  return false;
               } else {
                  damageable.setDamage(damageable.getDamage() + 1);
                  this.itemStack.setItemMeta(damageable);

                  for(int slot = 0; slot < this.player.getInventory().getSize(); ++slot) {
                     ItemStack item = this.player.getInventory().getItem(slot);
                     if (item != null && this.isTool(item) && item.getItemMeta() != null && ((Damageable)item.getItemMeta()).getDamage() >= item.getType().getMaxDurability()) {
                        this.player.getInventory().setItem(slot, (ItemStack)null);
                     }
                  }

                  return true;
               }
            }
         }
      }

      private boolean isTool(@Nonnull ItemStack itemStack) {
         if (itemStack.getItemMeta() == null) {
            return true;
         } else {
            try {
               Collection attributeModifiers = itemStack.getItemMeta().getAttributeModifiers(Attribute.GENERIC_ATTACK_DAMAGE);
               return attributeModifiers == null || !attributeModifiers.isEmpty();
            } catch (NullPointerException var3) {
               return false;
            }
         }
      }

      private boolean cantBeBroken(@Nonnull Block block, @Nonnull ItemStack tool) {
         return block.getDrops(tool).isEmpty();
      }
   }

   private static class DropLoop implements LoopChallenge.Loop {
      private final ItemStack itemStack;
      private final Player player;

      public DropLoop(ItemStack itemStack, Player player) {
         itemStack = itemStack.clone();
         itemStack.setAmount(1);
         this.itemStack = itemStack;
         this.player = player;
      }

      public void execute() {
         if (!AbstractChallenge.ignorePlayer(this.player)) {
            if (!this.decreaseItem()) {
               this.cancel();
            } else {
               InventoryUtils.dropItemByPlayer(this.player.getLocation(), this.itemStack);
            }
         }
      }

      private boolean decreaseItem() {
         ItemStack item = (ItemStack)Arrays.stream(this.player.getInventory().getContents()).filter(Objects::nonNull).filter((itemStack) -> {
            return itemStack.isSimilar(this.itemStack);
         }).findFirst().orElse((Object)null);
         if (item == null) {
            return false;
         } else {
            item.setAmount(item.getAmount() - 1);
            return true;
         }
      }
   }
}
