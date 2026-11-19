package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
import net.codingarea.challenges.plugin.utils.item.ItemUtils;
import net.codingarea.challenges.plugin.utils.misc.EntityUtils;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import org.bukkit.Material;
import org.bukkit.entity.Player;

public class BlockTarget extends ForceTarget {
   public BlockTarget(Material target) {
      super(target);
   }

   public boolean check(Player player) {
      return EntityUtils.isStandingOnBlock(player, (Material)this.target);
   }

   public static List getPossibleBlocks() {
      List materials = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
      materials.removeIf((material) -> {
         return !ItemUtils.blockIsAvailableInSurvival(material);
      });
      return materials;
   }

   public Object toMessage() {
      return this.target;
   }

   public String getName() {
      return BukkitStringUtils.getItemName((Material)this.target).toPlainText();
   }

   public Message getNewTargetMessage() {
      return Message.forName("force-block-battle-new-block");
   }

   public Message getCompletedMessage() {
      return Message.forName("force-block-battle-found");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.BLOCK;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-block-target-display");
   }

   public String toString() {
      return ((Material)this.target).name();
   }
}
