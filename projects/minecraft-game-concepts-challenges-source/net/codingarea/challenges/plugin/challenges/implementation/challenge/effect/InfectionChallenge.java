package net.codingarea.challenges.plugin.challenges.implementation.challenge.effect;

import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;

public class InfectionChallenge extends Setting {
   public InfectionChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.EFFECT);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.SLIME_BALL, Message.forName("item-infection-challenge"));
   }

   protected void onDisable() {
      Bukkit.getOnlinePlayers().forEach(this::removeEffects);
   }

   @ScheduledTask(
      ticks = 10,
      async = false
   )
   public void onHalfSecond() {
      if (!this.shouldExecuteEffect()) {
         Bukkit.getOnlinePlayers().forEach(this::removeEffects);
      } else {
         Bukkit.getOnlinePlayers().forEach(this::updateSickness);
      }
   }

   private void updateSickness(@Nonnull Player player) {
      if (ignorePlayer(player)) {
         this.removeEffects(player);
      } else {
         List entities = this.getNearbyTargets(player, 2.0D);
         if (entities.isEmpty()) {
            player.removePotionEffect(MinecraftNameWrapper.NAUSEA);
         } else {
            byte value = 1;
            Iterator var4 = entities.iterator();

            while(var4.hasNext()) {
               Entity currentEntity = (Entity)var4.next();
               if (player.getLocation().distance(currentEntity.getLocation()) <= 1.5D) {
                  value = 2;
               }
            }

            player.addPotionEffect(new PotionEffect(MinecraftNameWrapper.NAUSEA, Integer.MAX_VALUE, 15));
            if (value == 1) {
               if (!player.hasPotionEffect(PotionEffectType.WITHER)) {
                  player.addPotionEffect(new PotionEffect(PotionEffectType.POISON, 100, 2));
               }
            } else {
               player.removePotionEffect(PotionEffectType.POISON);
               player.addPotionEffect(new PotionEffect(PotionEffectType.WITHER, 100, 4));
            }

         }
      }
   }

   private void removeEffects(@Nonnull Player player) {
      player.removePotionEffect(MinecraftNameWrapper.NAUSEA);
      player.removePotionEffect(PotionEffectType.POISON);
      player.removePotionEffect(PotionEffectType.WITHER);
   }

   private List getNearbyTargets(@Nonnull Player player, double range) {
      return (List)player.getNearbyEntities(range, range, range).stream().filter((entity) -> {
         return entity != player;
      }).filter((entity) -> {
         return entity instanceof LivingEntity;
      }).filter((entity) -> {
         return !(entity instanceof Player) || ((Player)entity).getGameMode() != GameMode.CREATIVE && ((Player)entity).getGameMode() != GameMode.SPECTATOR;
      }).collect(Collectors.toList());
   }
}
