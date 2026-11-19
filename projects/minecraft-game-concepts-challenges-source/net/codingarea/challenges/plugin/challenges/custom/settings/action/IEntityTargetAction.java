package net.codingarea.challenges.plugin.challenges.custom.settings.action;

import com.google.common.collect.Lists;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;

public interface IEntityTargetAction extends IChallengeAction {
   static List getTargets(Entity triggerTarget, Map subActions) {
      return getTargets(triggerTarget, subActions, "target_entity");
   }

   static List getTargets(Entity triggerTarget, Map subActions, String key) {
      if (!subActions.containsKey(key)) {
         return Lists.newLinkedList();
      } else {
         String targetEntity = ((String[])subActions.get(key))[0];
         byte var5 = -1;
         switch(targetEntity.hashCode()) {
         case -1844412283:
            if (targetEntity.equals("every_player")) {
               var5 = 1;
            }
            break;
         case -1707361457:
            if (targetEntity.equals("every_mob_except_players")) {
               var5 = 5;
            }
            break;
         case -1531809689:
            if (targetEntity.equals("current_player")) {
               var5 = 2;
            }
            break;
         case -86853866:
            if (targetEntity.equals("every_mob_except_current")) {
               var5 = 4;
            }
            break;
         case 150881244:
            if (targetEntity.equals("every_mob")) {
               var5 = 3;
            }
            break;
         case 951510359:
            if (targetEntity.equals("console")) {
               var5 = 6;
            }
            break;
         case 1926783453:
            if (targetEntity.equals("random_player")) {
               var5 = 0;
            }
         }

         switch(var5) {
         case 0:
            List players = ChallengeAPI.getIngamePlayers();
            if (players.isEmpty()) {
               return new LinkedList();
            }

            return Collections.singletonList((Entity)players.get(random.nextInt(players.size())));
         case 1:
            return Lists.newLinkedList(ChallengeAPI.getIngamePlayers());
         case 2:
            return (List)(triggerTarget instanceof Player ? Lists.newArrayList(new Entity[]{triggerTarget}) : Lists.newLinkedList());
         case 3:
            List everyList = Lists.newLinkedList();
            Iterator var14 = ChallengeAPI.getGameWorlds().iterator();

            while(var14.hasNext()) {
               World world = (World)var14.next();
               everyList.addAll(world.getLivingEntities());
            }

            return everyList;
         case 4:
            List exceptList = Lists.newLinkedList();
            Iterator var15 = ChallengeAPI.getGameWorlds().iterator();

            while(var15.hasNext()) {
               World world = (World)var15.next();
               exceptList.addAll(world.getLivingEntities());
            }

            exceptList.remove(triggerTarget);
            return exceptList;
         case 5:
            List noPlayers = Lists.newLinkedList();
            Iterator var10 = ChallengeAPI.getGameWorlds().iterator();

            while(var10.hasNext()) {
               World world = (World)var10.next();
               Iterator var12 = world.getLivingEntities().iterator();

               while(var12.hasNext()) {
                  LivingEntity entity = (LivingEntity)var12.next();
                  if (entity.getType() != EntityType.PLAYER) {
                     noPlayers.add(entity);
                  }
               }
            }

            return noPlayers;
         case 6:
            return Collections.singletonList((Object)null);
         default:
            if (triggerTarget == null) {
               return Lists.newLinkedList();
            } else {
               return Lists.newArrayList(new Entity[]{triggerTarget});
            }
         }
      }
   }

   default void execute(ChallengeExecutionData executionData, Map subActions) {
      Iterator var3 = getTargets(executionData.getEntity(), subActions).iterator();

      while(var3.hasNext()) {
         Entity target = (Entity)var3.next();
         this.executeFor(target, subActions);
      }

   }

   void executeFor(Entity var1, Map var2);
}
