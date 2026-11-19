package net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle;

import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.annotations.Since;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.implementation.goal.forcebattle.targets.MobTarget;
import net.codingarea.challenges.plugin.challenges.type.abstraction.ForceBattleDisplayGoal;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDeathEvent;
import org.jetbrains.annotations.NotNull;

@Since("2.2.0")
public class ForceMobBattleGoal extends ForceBattleDisplayGoal {
   public ForceMobBattleGoal() {
      super(Message.forName("menu-force-mob-battle-goal-settings"));
   }

   protected MobTarget[] getTargetsPossibleToFind() {
      List entityTypes = MobTarget.getPossibleMobs();
      return (MobTarget[])entityTypes.stream().map(MobTarget::new).toArray((x$0) -> {
         return new MobTarget[x$0];
      });
   }

   protected Message getLeaderboardTitleMessage() {
      return Message.forName("force-mob-battle-leaderboard");
   }

   @NotNull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BOW, Message.forName("item-force-mob-battle-goal"));
   }

   public MobTarget getTargetFromDocument(Document document, String path) {
      return new MobTarget((EntityType)document.getEnum(path, EntityType.class));
   }

   public List getListFromDocument(Document document, String path) {
      return (List)document.getEnumList(path, EntityType.class).stream().map(MobTarget::new).collect(Collectors.toList());
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onKill(@Nonnull EntityDeathEvent event) {
      if (this.shouldExecuteEffect()) {
         LivingEntity entity = event.getEntity();
         Player killer = entity.getKiller();
         if (killer != null) {
            if (!ignorePlayer(killer)) {
               if (this.currentTarget.get(killer.getUniqueId()) != null) {
                  if (entity.getType() == ((MobTarget)this.currentTarget.get(killer.getUniqueId())).getTarget()) {
                     this.handleTargetFound(killer);
                  }

               }
            }
         }
      }
   }
}
