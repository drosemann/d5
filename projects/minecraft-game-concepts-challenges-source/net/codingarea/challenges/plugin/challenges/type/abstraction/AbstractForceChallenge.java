package net.codingarea.challenges.plugin.challenges.type.abstraction;

import java.util.function.BiConsumer;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import org.jetbrains.annotations.NotNull;

public abstract class AbstractForceChallenge extends TimedChallenge {
   public static final int WAITING = 0;
   public static final int COUNTDOWN = 1;
   private int state = 0;

   public AbstractForceChallenge(@Nonnull MenuType menu) {
      super(menu, false);
   }

   public AbstractForceChallenge(@Nonnull MenuType menu, int max) {
      super(menu, max, false);
   }

   public AbstractForceChallenge(@Nonnull MenuType menu, int min, int max) {
      super(menu, min, max, false);
   }

   public AbstractForceChallenge(@Nonnull MenuType menu, int min, int max, int defaultValue) {
      super(menu, min, max, defaultValue, false);
   }

   protected void onTimeActivation() {
      switch(this.state) {
      case 0:
         this.state = 1;
         this.chooseForcing();
         this.restartTimer(this.getForcingTime());
         SoundSample.BASS_ON.broadcast();
         this.bossbar.update();
         break;
      case 1:
         this.state = 0;
         this.restartTimer();
         this.handleCountdownEnd();
         this.bossbar.update();
      }

   }

   protected final void endForcing() {
      this.state = 0;
      this.restartTimer();
      this.bossbar.update();
   }

   protected abstract void handleCountdownEnd();

   protected void handleCountdown() {
      this.bossbar.update();
   }

   protected void onEnable() {
      this.bossbar.setContent(this.setupBossbar());
      this.bossbar.show();
   }

   protected void onDisable() {
      this.bossbar.hide();
   }

   public void loadGameState(@NotNull Document document) {
      super.loadGameState(document);
      if (document.isEmpty()) {
         this.state = 0;
      }

   }

   protected abstract void chooseForcing();

   protected abstract int getForcingTime();

   @Nonnull
   protected abstract BiConsumer setupBossbar();

   public final int getState() {
      return this.state;
   }

   public void setState(int state) {
      this.state = state;
   }
}
