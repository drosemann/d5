package net.codingarea.challenges.plugin.challenges.implementation.challenge.force;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.BiConsumer;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.challenges.type.abstraction.CompletableForceChallenge;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.challenges.annotations.ExcludeFromRandomChallenges;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.Material;
import org.bukkit.boss.BarColor;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.entity.EntityDeathEvent;
import org.jetbrains.annotations.NotNull;

@ExcludeFromRandomChallenges
public class ForceMobChallenge extends CompletableForceChallenge {
   private EntityType entity;

   public ForceMobChallenge() {
      super(MenuType.CHALLENGES, 2, 15);
      this.setCategory(SettingCategory.FORCE);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.DIAMOND_BOOTS, Message.forName("item-force-mob-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return ChallengeHelper.getTimeRangeSettingsDescription(this, 60, 30);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 30, this.getValue() * 60 + 30);
   }

   @Nonnull
   protected BiConsumer setupBossbar() {
      return (bossbar, player) -> {
         if (this.getState() == 0) {
            bossbar.setTitle(Message.forName("bossbar-force-mob-waiting").asString());
         } else {
            bossbar.setColor(BarColor.GREEN);
            bossbar.setProgress((double)this.getProgress());
            bossbar.setTitle(Message.forName("bossbar-force-mob-instruction").asComponent(this.entity, ChallengeAPI.formatTime((long)this.getSecondsLeftUntilNextActivation())));
         }
      };
   }

   protected void broadcastFailedMessage() {
      Message.forName("force-mob-fail").broadcast(Prefix.CHALLENGES, this.entity);
   }

   protected void broadcastSuccessMessage(@Nonnull Player player) {
      Message.forName("force-mob-success").broadcast(Prefix.CHALLENGES, NameHelper.getName(player), this.entity);
   }

   protected void chooseForcing() {
      List entities = new ArrayList(Arrays.asList(EntityType.values()));
      entities.removeIf((type) -> {
         return !type.isSpawnable();
      });
      entities.removeIf((type) -> {
         return !type.isAlive();
      });
      Utils.removeEnums(entities, "ENDER_DRAGON", "ILLUSIONER", "ARMOR_STAND", "ZOMBIE_HORSE", "SKELETON_HORSE", "SHULKER", "WITHER", "GIANT");
      this.entity = (EntityType)globalRandom.choose((List)entities);
   }

   protected int getForcingTime() {
      return globalRandom.range(300, 480);
   }

   protected int getSecondsUntilNextActivation() {
      return globalRandom.around(this.getValue() * 60, 30);
   }

   @EventHandler(
      priority = EventPriority.MONITOR,
      ignoreCancelled = true
   )
   public void onKill(@Nonnull EntityDeathEvent event) {
      LivingEntity entity = event.getEntity();
      if (entity.getType() == this.entity) {
         Player killer = entity.getKiller();
         if (killer != null) {
            this.completeForcing(killer);
         }
      }
   }

   public void loadGameState(@NotNull Document document) {
      super.loadGameState(document);
      if (document.contains("target")) {
         this.entity = (EntityType)document.getEnum("target", EntityType.class);
         this.setState(this.entity == null ? 0 : 1);
      }

   }

   public void writeGameState(@NotNull Document document) {
      super.writeGameState(document);
      document.set("target", this.entity);
   }
}
