package net.codingarea.challenges.plugin.challenges.implementation.goal;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.codingarea.challenges.plugin.challenges.type.abstraction.KillEntityGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.World.Environment;
import org.bukkit.entity.EntityType;

public class KillEnderDragonGoal extends KillEntityGoal {
   public KillEnderDragonGoal() {
      super(EntityType.ENDER_DRAGON, Environment.THE_END, true);
      this.setCategory(SettingCategory.KILL_ENTITY);
      this.setOneWinner(false);
   }

   @Nullable
   public SoundSample getWinSound() {
      return null;
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DRAGON_EGG, Message.forName("item-dragon-goal"));
   }
}
