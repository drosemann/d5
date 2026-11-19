package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.HeightTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

public class ForceHeightBattleGoal extends ForceBattleGoal {
   public ForceHeightBattleGoal() {
      super(Message.forName("menu-force-height-battle-goal-settings"));
   }

   protected HeightTarget[] getTargetsPossibleToFind() {
      return new HeightTarget[0];
   }

   protected HeightTarget getRandomTarget(Player player) {
      World world = player.getWorld();
      return new HeightTarget(globalRandom.range(BukkitReflectionUtils.getMinHeight(world), world.getMaxHeight()));
   }

   public HeightTarget getTargetFromDocument(Document document, String path) {
      return new HeightTarget(document.getInt(path));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getIntegerList(path).stream().map(HeightTarget::new).collect(Collectors.toList());
   }

   protected Message getLeaderboardTitleMessage() {
      return Message.forName("force-height-battle-leaderboard");
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.RABBIT_FOOT, Message.forName("item-force-height-battle-goal"));
   }

   protected boolean shouldRegisterDupedTargetsSetting() {
      return false;
   }

   @ScheduledTask(
      ticks = 5,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void checkHeights() {
      if (this.shouldExecuteEffect()) {
         broadcastFiltered((player) -> {
            HeightTarget target = (HeightTarget)this.currentTarget.get(player.getUniqueId());
            if (target != null && target.check(player)) {
               this.handleTargetFound(player);
            }

         });
      }
   }
}
