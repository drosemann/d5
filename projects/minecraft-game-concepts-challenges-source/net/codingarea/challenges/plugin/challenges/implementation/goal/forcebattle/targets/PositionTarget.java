package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import net.anweisen.utilities.common.collection.IRandom;
import net.anweisen.utilities.common.collection.pair.Tuple;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import org.bukkit.Location;
import org.bukkit.entity.Player;

public class PositionTarget extends ForceTarget {
   public PositionTarget(double x, double z) {
      super(Tuple.of(x, z));
   }

   public PositionTarget(Player player, int radius) {
      super(Tuple.of((double)player.getLocation().getBlockX() + (double)IRandom.singleton().range(-radius, radius), (double)player.getLocation().getBlockZ() + (double)IRandom.singleton().range(-radius, radius)));
   }

   public PositionTarget(Player player) {
      this(player, 1500);
   }

   public boolean check(Player player) {
      Location playerLocation = player.getLocation().clone();
      playerLocation.setY(0.0D);
      Location targetLocation = new Location(playerLocation.getWorld(), (Double)((Tuple)this.target).getFirst(), 0.0D, (Double)((Tuple)this.target).getSecond());
      return playerLocation.distance(targetLocation) < 5.0D;
   }

   public Object toMessage() {
      return this.getName();
   }

   public String getName() {
      return Message.forName("extreme-force-battle-position").asString(((Tuple)this.target).getFirst(), ((Tuple)this.target).getSecond());
   }

   public Message getNewTargetMessage() {
      return Message.forName("extreme-force-battle-new-position");
   }

   public Message getCompletedMessage() {
      return Message.forName("extreme-force-battle-reached-position");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.POSITION;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-position-target-display");
   }

   public Object getTargetSaveObject() {
      return Document.create().set("x", ((Tuple)this.target).getFirst()).set("z", ((Tuple)this.target).getSecond());
   }
}
