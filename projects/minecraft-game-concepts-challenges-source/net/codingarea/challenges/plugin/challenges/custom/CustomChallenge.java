package net.codingarea.challenges.plugin.challenges.custom;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import lombok.Generated;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.InfoMenuGenerator;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;

public class CustomChallenge extends Setting {
   private final UUID uuid;
   private Material material;
   private String name;
   private ChallengeTrigger trigger;
   private Map subTriggers;
   private ChallengeAction action;
   private Map subActions;

   public CustomChallenge(MenuType menuType, UUID uuid, Material displayItem, String displayName, ChallengeTrigger trigger, Map subTriggers, ChallengeAction action, Map subActions) {
      super(menuType);
      this.uuid = uuid;
      this.material = displayItem;
      this.name = displayName;
      this.trigger = trigger;
      this.subTriggers = subTriggers;
      this.action = action;
      this.subActions = subActions;
   }

   @NotNull
   public ItemStack getDisplayItem() {
      String name = this.name;
      if (name == null) {
         name = "NULL";
      }

      Material material = this.material;
      if (material == null) {
         material = Material.BARRIER;
      }

      ItemBuilder builder = new ItemBuilder(material, Message.forName("item-prefix").asString() + "§7" + name);
      List actionDisplay;
      String actionName;
      if (this.getTrigger() != null) {
         builder.appendLore(" ");
         actionDisplay = InfoMenuGenerator.getSubSettingsDisplay(this.getTrigger().getSubSettingsBuilder(), this.getSubTriggers());
         actionName = Message.forName(this.getTrigger().getMessage()).asItemDescription().getName();
         builder.appendLore(Message.forName("custom-info-trigger").asString() + " " + actionName);
         builder.appendLore((Collection)actionDisplay);
      }

      if (this.getAction() != null) {
         builder.appendLore(" ");
         actionDisplay = InfoMenuGenerator.getSubSettingsDisplay(this.getAction().getSubSettingsBuilder(), this.getSubActions());
         actionName = Message.forName(this.getAction().getMessage()).asItemDescription().getName();
         builder.appendLore(Message.forName("custom-info-action").asString() + " " + actionName);
         builder.appendLore((Collection)actionDisplay);
      }

      return builder.build();
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BARRIER);
   }

   public void playStatusUpdateTitle() {
      Challenges.getInstance().getTitleManager().sendChallengeStatusTitle(this.enabled ? Message.forName("title-challenge-enabled") : Message.forName("title-challenge-disabled"), this.getDisplayName());
   }

   public void writeSettings(@Nonnull Document document) {
      super.writeSettings(document);
      document.set("material", this.material == null ? null : this.material.name());
      document.set("name", this.name);
      document.set("trigger", this.trigger == null ? null : this.trigger.getName());
      document.set("subTrigger", this.subTriggers);
      document.set("action", this.action == null ? null : this.action.getName());
      document.set("subActions", this.subActions);
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return super.getSettingsDescription();
   }

   public final void onTriggerFulfilled(ChallengeExecutionData challengeExecutionData) {
      if (this.isEnabled()) {
         boolean triggerMet = this.isTriggerMet(challengeExecutionData.getTriggerData());
         if (triggerMet) {
            this.executeAction(challengeExecutionData);
         }
      }

   }

   public boolean isTriggerMet(Map data) {
      if (!this.subTriggers.isEmpty()) {
         Iterator var2 = this.subTriggers.entrySet().iterator();

         while(var2.hasNext()) {
            Entry entry = (Entry)var2.next();
            if (!data.containsKey(entry.getKey())) {
               return false;
            }

            List list = (List)data.get(entry.getKey());
            boolean match = false;
            String[] var6 = (String[])entry.getValue();
            int var7 = var6.length;

            for(int var8 = 0; var8 < var7; ++var8) {
               String value = var6[var8];
               if (list.contains(value)) {
                  match = true;
                  break;
               }
            }

            if (!match) {
               return false;
            }
         }
      }

      return true;
   }

   public void executeAction(ChallengeExecutionData challengeExecutionData) {
      if (!Bukkit.isPrimaryThread()) {
         Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
            this.action.execute(challengeExecutionData, this.subActions);
         });
      } else {
         this.action.execute(challengeExecutionData, this.subActions);
      }
   }

   public void applySettings(@Nonnull Material material, @Nonnull String name, @Nonnull ChallengeTrigger trigger, Map subTriggers, ChallengeAction action, Map subActions) {
      this.material = material;
      this.name = name;
      this.trigger = trigger;
      this.subTriggers = subTriggers;
      this.action = action;
      this.subActions = subActions;
   }

   public UUID getUniqueId() {
      return this.uuid;
   }

   @Nonnull
   public String getDisplayName() {
      return this.name;
   }

   @NotNull
   public String getUniqueName() {
      return this.uuid.toString();
   }

   @Generated
   public UUID getUuid() {
      return this.uuid;
   }

   @Generated
   public Material getMaterial() {
      return this.material;
   }

   @Generated
   public String getName() {
      return this.name;
   }

   @Generated
   public ChallengeTrigger getTrigger() {
      return this.trigger;
   }

   @Generated
   public Map getSubTriggers() {
      return this.subTriggers;
   }

   @Generated
   public ChallengeAction getAction() {
      return this.action;
   }

   @Generated
   public Map getSubActions() {
      return this.subActions;
   }

   @Generated
   public String toString() {
      return "CustomChallenge(uuid=" + this.getUuid() + ", material=" + this.getMaterial() + ", name=" + this.getName() + ", trigger=" + this.getTrigger() + ", subTriggers=" + this.getSubTriggers() + ", action=" + this.getAction() + ", subActions=" + this.getSubActions() + ")";
   }
}
