package net.codingarea.challenges.plugin.management.challenges;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.CustomChallenge;
import net.codingarea.challenges.plugin.challenges.custom.settings.ChallengeExecutionData;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.IChallengeTrigger;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.ChallengeMenuGenerator;
import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
import net.codingarea.challenges.plugin.utils.misc.MapUtils;
import org.bukkit.Material;

public class CustomChallengesLoader extends ModuleChallengeLoader {
   private final Map customChallenges = new LinkedHashMap();
   private final int maxNameLength = Challenges.getInstance().getConfigDocument().getInt("custom-challenge-settings.max-name-length");

   public CustomChallengesLoader() {
      super(Challenges.getInstance());
   }

   public CustomChallenge registerCustomChallenge(@Nonnull UUID uuid, Material material, String name, ChallengeTrigger trigger, Map subTriggers, ChallengeAction action, Map subActions, boolean generate) {
      CustomChallenge challenge = (CustomChallenge)this.customChallenges.getOrDefault(uuid, new CustomChallenge(MenuType.CUSTOM, uuid, material, name, trigger, subTriggers, action, subActions));
      if (!this.customChallenges.containsKey(uuid)) {
         this.customChallenges.put(uuid, challenge);
         this.register(challenge);
      } else {
         challenge.applySettings(material, name, trigger, subTriggers, action, subActions);
      }

      this.generateCustomChallenge(challenge, false, generate);
      return challenge;
   }

   public void unregisterCustomChallenge(@Nonnull UUID uuid) {
      CustomChallenge challenge = (CustomChallenge)this.customChallenges.remove(uuid);
      if (challenge != null) {
         Challenges.getInstance().getChallengeLoader().unregister(challenge);
         this.generateCustomChallenge(challenge, true, true);
      }
   }

   public void loadCustomChallengesFrom(@Nonnull Document document) {
      this.customChallenges.clear();
      Challenges.getInstance().getChallengeManager().unregisterIf((iChallenge) -> {
         return iChallenge.getType() == MenuType.CUSTOM;
      });
      ((ChallengeMenuGenerator)MenuType.CUSTOM.getMenuGenerator()).resetChallengeCache();
      Iterator var2 = document.keys().iterator();

      while(var2.hasNext()) {
         String key = (String)var2.next();

         try {
            Document doc = document.getDocument(key);
            UUID uuid = UUID.fromString(key);
            String name = doc.getString("name");
            Material material = (Material)doc.getEnum("material", Material.class);
            ChallengeTrigger trigger = Challenges.getInstance().getCustomSettingsLoader().getTriggerByName(doc.getString("trigger"));
            Map subTriggers = MapUtils.createSubSettingsMapFromDocument(doc.getDocument("subTrigger"));
            ChallengeAction action = Challenges.getInstance().getCustomSettingsLoader().getActionByName(doc.getString("action"));
            Map subActions = MapUtils.createSubSettingsMapFromDocument(doc.getDocument("subActions"));
            CustomChallenge challenge = this.registerCustomChallenge(uuid, material, name, trigger, subTriggers, action, subActions, false);
            challenge.setEnabled(doc.getBoolean("enabled"));
         } catch (Exception var13) {
            Challenges.getInstance().getLogger().error("Something went wrong while initializing custom challenge {} :: {}", new Object[]{key, var13.getMessage()});
            Challenges.getInstance().getLogger().error("", new Object[]{var13});
         }
      }

      MenuType.CUSTOM.getMenuGenerator().generateInventories();
   }

   public void resetChallenges() {
      this.customChallenges.clear();
      Challenges.getInstance().getChallengeManager().unregisterIf((iChallenge) -> {
         return iChallenge.getType() == MenuType.CUSTOM;
      });
      ((ChallengeMenuGenerator)MenuType.CUSTOM.getMenuGenerator()).resetChallengeCache();
   }

   private void generateCustomChallenge(CustomChallenge challenge, boolean deleted, boolean generate) {
      MenuGenerator generator = challenge.getType().getMenuGenerator();
      if (generator instanceof ChallengeMenuGenerator) {
         ChallengeMenuGenerator menuGenerator = (ChallengeMenuGenerator)generator;
         if (deleted) {
            menuGenerator.removeChallengeFromCache(challenge);
            if (generate) {
               generator.generateInventories();
            }
         } else if (!menuGenerator.isInChallengeCache(challenge)) {
            menuGenerator.addChallengeToCache(challenge);
            if (generate) {
               generator.generateInventories();
            }
         } else {
            menuGenerator.updateItem(challenge);
         }
      }

   }

   public List getCustomChallengesByTrigger(@Nonnull IChallengeTrigger trigger) {
      List challenges = new LinkedList();
      Iterator var3 = this.customChallenges.values().iterator();

      while(var3.hasNext()) {
         CustomChallenge challenge = (CustomChallenge)var3.next();
         if (challenge.getTrigger() != null && challenge.getTrigger() == trigger) {
            challenges.add(challenge);
         }
      }

      return challenges;
   }

   public void executeTrigger(@Nonnull ChallengeExecutionData challengeExecutionData) {
      this.getCustomChallengesByTrigger(challengeExecutionData.getTrigger()).forEach((customChallenge) -> {
         customChallenge.onTriggerFulfilled(challengeExecutionData);
      });
   }

   public int getMaxNameLength() {
      return this.maxNameLength;
   }

   public Map getCustomChallenges() {
      return this.customChallenges;
   }
}
