package net.codingarea.challenges.plugin.challenges.implementation.goal;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.KillMobsGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Monster;
import org.jetbrains.annotations.NotNull;

@Since("2.1.3")
public class KillAllMonsterGoal extends KillMobsGoal {
   public KillAllMonsterGoal() {
      super(getAllMobsToKill());
      this.setCategory(SettingCategory.KILL_ENTITY);
   }

   static List getAllMobsToKill() {
      LinkedList list = new LinkedList(Arrays.asList(EntityType.values()));
      list.removeIf((type) -> {
         return !type.isAlive();
      });
      list.removeIf((type) -> {
         return !Monster.class.isAssignableFrom(type.getEntityClass());
      });
      list.add(EntityType.PHANTOM);
      list.add(EntityType.ENDER_DRAGON);
      list.add(EntityType.SHULKER);
      list.add(EntityType.GHAST);
      list.add(EntityType.MAGMA_CUBE);
      list.add(EntityType.SLIME);
      list.remove(EntityType.GIANT);
      list.remove(EntityType.ILLUSIONER);
      if (MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_16)) {
         list.add(EntityType.HOGLIN);
      }

      return list;
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.ARROW, Message.forName("item-all-monster-goal"));
   }

   public Message getBossbarMessage() {
      return Message.forName("bossbar-kill-all-monster");
   }
}
