package net.codingarea.challenges.plugin.challenges.custom.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.Generated;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.impl.CancelEventAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.IChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.Cancellable;

public class ChallengeExecutionData {
   private final IChallengeTrigger trigger;
   private final Map triggerData;
   private Entity entity;
   private Runnable cancelAction;
   private int timesExecuting;

   public ChallengeExecutionData(IChallengeTrigger trigger) {
      this.trigger = trigger;
      this.triggerData = new HashMap();
   }

   public ChallengeExecutionData data(String key, String data) {
      this.triggerData.put(key, Collections.singletonList(data));
      return this;
   }

   public ChallengeExecutionData data(String key, List data) {
      this.triggerData.put(key, data);
      return this;
   }

   public ChallengeExecutionData data(String key, String... data) {
      this.triggerData.put(key, Arrays.asList(data));
      return this;
   }

   public ChallengeExecutionData block(Material material) {
      return this.data("block", "any", material.name());
   }

   public ChallengeExecutionData entityType(EntityType type) {
      return this.data("entity_type", "any", type.name());
   }

   public ChallengeExecutionData entity(Entity entity) {
      this.entity = entity;
      return this;
   }

   public ChallengeExecutionData cancelAction(Runnable cancelAction) {
      this.cancelAction = cancelAction;
      return this;
   }

   public ChallengeExecutionData event(Cancellable event) {
      this.cancelAction = () -> {
         event.setCancelled(true);
      };
      return this;
   }

   public ChallengeExecutionData times(int timesExecuting) {
      this.timesExecuting = timesExecuting;
      return this;
   }

   public void execute() {
      if (ChallengeAPI.isStarted() && !ChallengeAPI.isWorldInUse()) {
         if (this.entity instanceof Player && AbstractChallenge.ignorePlayer((Player)this.entity)) {
            return;
         }

         if (this.cancelAction != null) {
            CancelEventAction.onPreTrigger();
         }

         Challenges.getInstance().getCustomChallengesLoader().executeTrigger(this);
         if (this.cancelAction != null && CancelEventAction.shouldCancel()) {
            this.cancelAction.run();
         }
      }

   }

   @Generated
   public IChallengeTrigger getTrigger() {
      return this.trigger;
   }

   @Generated
   public Map getTriggerData() {
      return this.triggerData;
   }

   @Generated
   public Entity getEntity() {
      return this.entity;
   }

   @Generated
   public int getTimesExecuting() {
      return this.timesExecuting;
   }
}
