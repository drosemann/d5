package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import org.bukkit.entity.Player;

public class DamageTarget extends ForceTarget {
   public DamageTarget(Integer target) {
      super(target);
   }

   public boolean check(Player player) {
      return false;
   }

   public Object toMessage() {
      return (double)(Integer)this.target / 2.0D;
   }

   public String getName() {
      return String.valueOf((double)(Integer)this.target / 2.0D);
   }

   public Message getNewTargetMessage() {
      return Message.forName("extreme-force-battle-new-damage");
   }

   public Message getCompletedMessage() {
      return Message.forName("extreme-force-battle-took-damage");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.DAMAGE;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-damage-target-display");
   }
}
