package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;

import java.util.Arrays;
import java.util.Random;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.annotations.Since;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import org.bukkit.Material;

@Since("2.0")
public class LowDropRateChallenge extends SettingModifier {
   private final Random random = new Random();

   public LowDropRateChallenge() {
      super(MenuType.CHALLENGES, 9);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.WOODEN_AXE, Message.forName("item-low-drop-rate-challenge"));
   }

   @Nullable
   protected String[] getSettingsDescription() {
      return Message.forName("item-chance-description").asArray(this.getValue() * 10);
   }

   public void playValueChangeTitle() {
      ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() * 10 + "%"));
   }

   protected void onValueChange() {
      this.reloadChances();
   }

   protected void onEnable() {
      this.reloadChances();
   }

   protected void onDisable() {
      Challenges.getInstance().getBlockDropManager().resetDropChance((byte)-128);
   }

   protected void reloadChances() {
      Arrays.stream(ExperimentalUtils.getMaterials()).filter(Material::isBlock).forEach((block) -> {
         Challenges.getInstance().getBlockDropManager().setDropChance(block, (byte)-128, () -> {
            return this.random.nextInt(10) < this.getValue();
         });
      });
   }
}
