package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import net.anweisen.utilities.common.annotations.Since;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.BlockTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleDisplayGoal;
import net.codingarea.challenges.plugin.challenges.type.abstraction.MenuSetting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.scheduler.policy.TimerPolicy;
import net.codingarea.challenges.plugin.management.scheduler.task.ScheduledTask;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

@Since("2.2.0")
public class ForceBlockBattleGoal extends ForceBattleDisplayGoal {
   public ForceBlockBattleGoal() {
      super(Message.forName("menu-force-block-battle-goal-settings"));
      this.registerSetting("give-block", new MenuSetting.BooleanSubSetting(() -> {
         return new ItemBuilder(Material.CHEST, Message.forName("item-force-block-battle-goal-give-block"));
      }, false));
   }

   protected BlockTarget[] getTargetsPossibleToFind() {
      List materials = BlockTarget.getPossibleBlocks();
      return (BlockTarget[])materials.stream().map(BlockTarget::new).toArray((x$0) -> {
         return new BlockTarget[x$0];
      });
   }

   public BlockTarget getTargetFromDocument(Document document, String path) {
      return new BlockTarget((Material)document.getEnum(path, Material.class));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getEnumList(path, Material.class).stream().map(BlockTarget::new).collect(Collectors.toList());
   }

   public Message getLeaderboardTitleMessage() {
      return Message.forName("force-block-battle-leaderboard");
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.GRASS_BLOCK, Message.forName("item-force-block-battle-goal"));
   }

   public void handleJokerUse(Player player) {
      super.handleJokerUse(player);
      if (this.giveBlockOnSkip()) {
         InventoryUtils.dropOrGiveItem(player.getInventory(), player.getLocation(), (Material)((Material)((BlockTarget)this.currentTarget.get(player.getUniqueId())).getTarget()));
      }

   }

   @ScheduledTask(
      ticks = 5,
      async = false,
      timerPolicy = TimerPolicy.STARTED
   )
   public void checkBlocks() {
      if (this.shouldExecuteEffect()) {
         broadcastFiltered((player) -> {
            BlockTarget target = (BlockTarget)this.currentTarget.get(player.getUniqueId());
            if (target != null && target.check(player)) {
               this.handleTargetFound(player);
            }

         });
      }
   }

   private boolean giveBlockOnSkip() {
      return this.getSetting("give-block").getAsBoolean();
   }
}
