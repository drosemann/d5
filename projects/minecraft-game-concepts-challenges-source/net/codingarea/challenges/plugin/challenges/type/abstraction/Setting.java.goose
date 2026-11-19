// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/Setting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/Setting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/Setting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
//
// public abstract class Setting extends AbstractChallenge {
//    private final boolean enabledByDefault;
//    protected boolean enabled;
//
//    public Setting(@Nonnull MenuType menu) {
//       this(menu, false);
//    }
//
//    public Setting(@Nonnull MenuType menu, boolean enabledByDefault) {
//       super(menu);
//       this.enabledByDefault = enabledByDefault;
//       this.setEnabled(enabledByDefault);
//    }
//
//    public void handleClick(@Nonnull ChallengeMenuClickInfo info) {
//       this.setEnabled(!this.enabled);
//       SoundSample.playStatusSound(info.getPlayer(), this.enabled);
//       this.playStatusUpdateTitle();
//    }
//
//    public void restoreDefaults() {
//       this.setEnabled(this.enabledByDefault);
//    }
//
//    public void playStatusUpdateTitle() {
//       ChallengeHelper.playToggleChallengeTitle(this);
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       return DefaultItem.status(this.enabled);
//    }
//
//    protected void onEnable() {
//    }
//
//    protected void onDisable() {
//    }
//
//    public void handleShutdown() {
//       super.handleShutdown();
//       if (this.isEnabled()) {
//          this.onDisable();
//       }
//
//    }
//
//    public boolean isEnabled() {
//       return this.enabled;
//    }
//
//    public void setEnabled(boolean enabled) {
//       if (this.enabled != enabled) {
//          this.enabled = enabled;
//
//          try {
//             if (enabled) {
//                this.onEnable();
//             } else {
//                this.onDisable();
//             }
//          } catch (Exception var3) {
//             Challenges.getInstance().getLogger().error("Error while {} Setting {}", new Object[]{enabled ? "enabling" : "disabling", this.getClass().getSimpleName(), var3});
//          }
//
//          this.updateItems();
//       }
//    }
//
//    public void loadSettings(@Nonnull Document document) {
//       this.setEnabled(document.getBoolean("enabled", this.enabled));
//    }
//
//    public void writeSettings(@Nonnull Document document) {
//       document.set("enabled", this.enabled);
//    }
// }
//
