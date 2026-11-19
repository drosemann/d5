package net.codingarea.challenges.plugin.challenges.type.abstraction;

import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.management.menu.MenuType;

public abstract class OneEnabledSetting extends Setting {
   private final String typeId;

   public OneEnabledSetting(@Nonnull MenuType menu, @Nonnull String typeId) {
      super(menu);
      this.typeId = typeId;
   }

   public OneEnabledSetting(@Nonnull MenuType menu, boolean enabledByDefault, @Nonnull String typeId) {
      super(menu, enabledByDefault);
      this.typeId = typeId;
   }

   public void setEnabled(boolean enabled) {
      super.setEnabled(enabled);
      if (this.isEnabled()) {
         this.disableOthers();
      }

   }

   protected final void disableOthers() {
      Challenges.getInstance().getChallengeManager().getChallenges().stream().filter((challenge) -> {
         return challenge != this;
      }).filter((challenge) -> {
         return challenge instanceof OneEnabledSetting;
      }).map((challenge) -> {
         return (OneEnabledSetting)challenge;
      }).filter((setting) -> {
         return setting.typeId.equals(this.typeId);
      }).forEach((setting) -> {
         setting.setEnabled(false);
      });
   }
}
