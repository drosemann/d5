package net.codingarea.challenges.plugin.challenges.implementation.goal;

import java.util.Arrays;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.challenges.type.abstraction.KillMobsGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.EntityType;

@Since("2.0")
public class KillAllBossesGoal extends KillMobsGoal {
   public KillAllBossesGoal() {
      super(Arrays.asList(EntityType.ENDER_DRAGON, EntityType.WITHER, EntityType.ELDER_GUARDIAN));
      this.setCategory(SettingCategory.KILL_ENTITY);
   }

   public Message getBossbarMessage() {
      return Message.forName("bossbar-kill-all-bosses");
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DIAMOND_SWORD, Message.forName("item-all-bosses-goal"));
   }
}
