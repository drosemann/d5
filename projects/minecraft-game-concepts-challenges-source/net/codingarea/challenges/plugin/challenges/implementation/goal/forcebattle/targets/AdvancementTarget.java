package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import java.util.ArrayList;
import java.util.List;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
import org.bukkit.Bukkit;
import org.bukkit.advancement.Advancement;
import org.bukkit.entity.Player;

public class AdvancementTarget extends ForceTarget {
   public AdvancementTarget(Advancement target) {
      super(target);
   }

   public boolean check(Player player) {
      return player.getAdvancementProgress((Advancement)this.target).isDone();
   }

   public static List getPossibleAdvancements() {
      List advancements = new ArrayList();
      Bukkit.getServer().advancementIterator().forEachRemaining((advancement) -> {
         String string = advancement.getKey().toString();
         if (!string.contains(":recipes/") && !string.endsWith("root")) {
            advancements.add(advancement);
         }

      });
      return advancements;
   }

   public Object toMessage() {
      return this.target;
   }

   public String getName() {
      return BukkitStringUtils.getAdvancementTitle((Advancement)this.target).toPlainText();
   }

   public Message getNewTargetMessage() {
      return Message.forName("force-advancement-battle-new-advancement");
   }

   public Message getCompletedMessage() {
      return Message.forName("force-advancement-battle-completed");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.ADVANCEMENT;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-advancement-target-display");
   }

   public Object getTargetSaveObject() {
      return ((Advancement)this.target).getKey().toString();
   }
}
