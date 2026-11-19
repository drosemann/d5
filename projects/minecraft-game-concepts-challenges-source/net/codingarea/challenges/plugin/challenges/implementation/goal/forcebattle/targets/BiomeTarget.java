package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.ExtremeForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
import org.bukkit.block.Biome;
import org.bukkit.entity.Player;

public class BiomeTarget extends ForceTarget {
   public BiomeTarget(Biome target) {
      super(target);
   }

   public boolean check(Player player) {
      return player.getLocation().getBlock().getBiome() == this.target;
   }

   public static List getPossibleBiomes() {
      return (List)Arrays.stream(Biome.values()).filter((biome) -> {
         return !biome.name().contains("VOID");
      }).filter((biome) -> {
         return !biome.name().equals("CUSTOM");
      }).collect(Collectors.toList());
   }

   public Object toMessage() {
      return this.target;
   }

   public String getName() {
      return BukkitStringUtils.getBiomeName((Biome)this.target).toPlainText();
   }

   public Message getNewTargetMessage() {
      return Message.forName("extreme-force-battle-new-biome");
   }

   public Message getCompletedMessage() {
      return Message.forName("extreme-force-battle-found-biome");
   }

   public ExtremeForceBattleGoal.TargetType getType() {
      return ExtremeForceBattleGoal.TargetType.BIOME;
   }

   public Message getScoreboardDisplayMessage() {
      return Message.forName("force-battle-biome-target-display");
   }
}
