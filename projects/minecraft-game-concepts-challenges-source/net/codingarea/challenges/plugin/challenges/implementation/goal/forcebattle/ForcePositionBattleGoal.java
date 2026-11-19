package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.PositionTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleGoal;
import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

public class ForcePositionBattleGoal extends ForceBattleGoal {
   public ForcePositionBattleGoal() {
      super(Message.forName("menu-force-position-battle-goal-settings"));
      this.registerSetting("radius", new MenuSetting.NumberSubSetting(() -> {
         return new ItemBuilder(Material.DIAMOND_BOOTS, Message.forName("item-force-position-battle-radius"));
      }, (value) -> {
         return null;
      }, (value) -> {
         return "§e" + value * 100;
      }, 1, 100, 15));
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DIAMOND_BOOTS, Message.forName("item-force-position-battle-goal"));
   }

   protected PositionTarget[] getTargetsPossibleToFind() {
      return new PositionTarget[0];
   }

   protected PositionTarget getRandomTarget(Player player) {
      return new PositionTarget(player, this.getRadius());
   }

   public PositionTarget getTargetFromDocument(Document document, String path) {
      return new PositionTarget(document.getDocument(path).getDouble("x"), document.getDocument(path).getDouble("z"));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getDocumentList(path).stream().map((doc) -> {
         return new PositionTarget(doc.getDouble("x"), doc.getDouble("z"));
      }).collect(Collectors.toList());
   }

   protected Message getLeaderboardTitleMessage() {
      return Message.forName("force-position-battle-leaderboard");
   }

   protected boolean shouldRegisterDupedTargetsSetting() {
      return false;
   }

   @ScheduledTask(
      ticks = 5,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void checkPositions() {
      if (this.shouldExecuteEffect()) {
         broadcastFiltered((player) -> {
            PositionTarget target = (PositionTarget)this.currentTarget.get(player.getUniqueId());
            if (target != null && target.check(player)) {
               this.handleTargetFound(player);
            }

         });
      }
   }

   protected int getRadius() {
      return this.getSetting("radius").getAsInt() * 100;
   }
}
