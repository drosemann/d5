package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
import net.codingarea.challenges.plugin.utils.misc.EntityUtils;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.Material;
import org.bukkit.entity.ArmorStand;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;

public class MobTarget extends ForceTarget {
   public MobTarget(EntityType target) {
      super(target);
   }

   public boolean check(Player player) {
      return false;
   }

   public static List getPossibleMobs() {
      List entityTypes = new ArrayList(Arrays.asList(EntityType.values()));
      entityTypes.removeIf((entityType) -> {
         return !entityType.isSpawnable();
      });
      entityTypes.removeIf((entityType) -> {
         return !entityType.isAlive();
      });
      Utils.removeEnums(entityTypes, "ILLUSIONER", "ARMOR_STAND", "ZOMBIE_HORSE", "GIANT");
      return entityTypes;
   }

   public Object toMessage() {
      return this.target;
   }

   public String getName() {
      return BukkitStringUtils.getEntityName((EntityType)this.target).toPlainText();
   }

   public Message getNewTargetMessage() {
      return Message.forName("force-mob-battle-new-mob");
   }

   public Message getCompletedMessage() {
      return Message.forName("force-mob-battle-killed");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.MOB;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-mob-target-display");
   }

   public void updateDisplayStand(@NotNull ArmorStand armorStand) {
      Material spawnEgg = EntityUtils.getSpawnEgg((EntityType)this.target);
      if (spawnEgg == null) {
         armorStand.getEquipment().setHelmet((ItemStack)null);
      } else {
         armorStand.getEquipment().setHelmet(new ItemStack(spawnEgg));
      }

   }
}
