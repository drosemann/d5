package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.BiomeTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.block.Biome;
import org.jetbrains.annotations.NotNull;

public class ForceBiomeBattleGoal extends ForceBattleGoal {
   public ForceBiomeBattleGoal() {
      super(Message.forName("menu-force-biome-battle-goal-settings"));
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.FILLED_MAP, Message.forName("item-force-biome-battle-goal"));
   }

   protected BiomeTarget[] getTargetsPossibleToFind() {
      List biomes = BiomeTarget.getPossibleBiomes();
      return (BiomeTarget[])biomes.stream().map(BiomeTarget::new).toArray((x$0) -> {
         return new BiomeTarget[x$0];
      });
   }

   public BiomeTarget getTargetFromDocument(Document document, String path) {
      return new BiomeTarget((Biome)document.getEnum(path, Biome.class));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getEnumList(path, Biome.class).stream().map(BiomeTarget::new).collect(Collectors.toList());
   }

   protected Message getLeaderboardTitleMessage() {
      return Message.forName("force-biome-battle-leaderboard");
   }

   @ScheduledTask(
      ticks = 5,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void checkBiomes() {
      if (this.shouldExecuteEffect()) {
         broadcastFiltered((player) -> {
            BiomeTarget target = (BiomeTarget)this.currentTarget.get(player.getUniqueId());
            if (target != null && target.check(player)) {
               this.handleTargetFound(player);
            }

         });
      }
   }
}
