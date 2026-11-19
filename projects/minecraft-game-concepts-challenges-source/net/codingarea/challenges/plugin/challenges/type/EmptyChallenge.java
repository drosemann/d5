package net.codingarea.challenges.plugin.challenges.type;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class EmptyChallenge implements IChallenge {
   private final MenuType menuType;

   public EmptyChallenge(@Nonnull MenuType menuType) {
      this.menuType = menuType;
   }

   public boolean isEnabled() {
      return false;
   }

   public void restoreDefaults() {
   }

   public void handleShutdown() {
   }

   @NotNull
   public String getUniqueGamestateName() {
      return this.getUniqueName();
   }

   @NotNull
   public String getUniqueName() {
      return "empty";
   }

   @NotNull
   public MenuType getType() {
      return this.menuType;
   }

   @Nullable
   public SettingCategory getCategory() {
      return null;
   }

   @NotNull
   public ItemStack getDisplayItem() {
      return (new ItemBuilder(Material.GRAY_STAINED_GLASS_PANE, "§0")).build();
   }

   @NotNull
   public ItemStack getSettingsItem() {
      return (new ItemBuilder(Material.GRAY_STAINED_GLASS_PANE, "§0")).build();
   }

   public void handleClick(@NotNull ChallengeMenuClickInfo info) {
      SoundSample.CLICK.play(info.getPlayer());
   }

   public void writeSettings(@NotNull Document document) {
   }

   public void loadSettings(@NotNull Document document) {
   }

   public void writeGameState(@NotNull Document document) {
   }

   public void loadGameState(@NotNull Document document) {
   }
}
