package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.DamageTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleGoal;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDamageEvent;
import org.jetbrains.annotations.NotNull;

public class ForceDamageBattleGoal extends ForceBattleGoal {
   public ForceDamageBattleGoal() {
      super(Message.forName("menu-force-damage-battle-goal-settings"));
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.TOTEM_OF_UNDYING, Message.forName("item-force-damage-battle-goal"));
   }

   protected DamageTarget[] getTargetsPossibleToFind() {
      return new DamageTarget[0];
   }

   protected DamageTarget getRandomTarget(Player player) {
      return new DamageTarget(globalRandom.range(1, 19));
   }

   public DamageTarget getTargetFromDocument(Document document, String path) {
      return new DamageTarget(document.getInt(path));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getIntegerList(path).stream().map(DamageTarget::new).collect(Collectors.toList());
   }

   protected Message getLeaderboardTitleMessage() {
      return Message.forName("force-damage-battle-leaderboard");
   }

   protected boolean shouldRegisterDupedTargetsSetting() {
      return false;
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onDamage(@Nonnull EntityDamageEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getEntity() instanceof Player) {
            Player player = (Player)event.getEntity();
            if (!ignorePlayer(player)) {
               if (this.currentTarget.get(player.getUniqueId()) != null) {
                  DamageTarget target = (DamageTarget)this.currentTarget.get(player.getUniqueId());
                  int damage = (int)ChallengeHelper.getFinalDamage(event);
                  if (damage == (Integer)target.getTarget()) {
                     this.handleTargetFound(player);
                  }
               }
            }
         }
      }
   }
}
