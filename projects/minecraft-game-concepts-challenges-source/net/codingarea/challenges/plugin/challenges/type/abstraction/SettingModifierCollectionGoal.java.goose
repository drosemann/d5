// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/SettingModifierCollectionGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/SettingModifierCollectionGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/SettingModifierCollectionGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.inventory.ItemStack;
//
// public abstract class SettingModifierCollectionGoal extends ModifierCollectionGoal {
//    public SettingModifierCollectionGoal(int min, int max, @Nonnull Object... target) {
//       super(min, max, target);
//    }
//
//    public SettingModifierCollectionGoal(int min, int max, int defaultValue, @Nonnull Object... target) {
//       super(min, max, defaultValue, target);
//    }
//
//    public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//       if (!info.isUpperItemClick() && this.enabled) {
//          super.handleClick(info);
//       } else {
//          this.setEnabled(!this.enabled);
//          SoundSample.playStatusSound(info.getPlayer(), this.enabled);
//          this.playStatusUpdateTitle();
//       }
//
//    }
//
//    public void restoreDefaults() {
//       super.restoreDefaults();
//       this.setEnabled(false);
//    }
//
//    @Nonnull
//    public ItemStack getSettingsItem() {
//       return this.isEnabled() ? super.getSettingsItem() : DefaultItem.disabled().build();
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       return DefaultItem.enabled().amount(this.getValue());
//    }
//
//    public void handleShutdown() {
//       super.handleShutdown();
//       this.onDisable();
//    }
//
//    public boolean isEnabled() {
//       return this.enabled;
//    }
//
//    public void writeSettings(@Nonnull Document document) {
//       super.writeSettings(document);
//       document.set("enabled", this.enabled);
//    }
//
//    public void loadSettings(@Nonnull Document document) {
//       super.loadSettings(document);
//       this.setEnabled(document.getBoolean("enabled"));
//    }
// }
//
