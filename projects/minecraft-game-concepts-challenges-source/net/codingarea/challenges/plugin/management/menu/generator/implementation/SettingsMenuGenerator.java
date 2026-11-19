package net.codingarea.challenges.plugin.management.menu.generator.implementation;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
import net.codingarea.challenges.plugin.challenges.type.IChallenge;
import net.codingarea.challenges.plugin.management.menu.generator.ChallengeMenuGenerator;
import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;

public class SettingsMenuGenerator extends ChallengeMenuGenerator {
   public static final int[] SLOTS = new int[]{10, 11, 12, 13, 14, 15, 16};
   public static final int[] NAVIGATION_SLOTS = new int[]{27, 35};
   public static final int SIZE = 36;

   public int[] getSlots() {
      return SLOTS;
   }

   public int getSize() {
      return 36;
   }

   public int[] getNavigationSlots(int page) {
      return NAVIGATION_SLOTS;
   }

   public void executeClickAction(@Nonnull IChallenge challenge, @Nonnull MenuClickInfo info, int itemIndex) {
      if (itemIndex <= 1) {
         challenge.handleClick(new ChallengeMenuClickInfo(info, itemIndex == 0));
      }

   }
}
