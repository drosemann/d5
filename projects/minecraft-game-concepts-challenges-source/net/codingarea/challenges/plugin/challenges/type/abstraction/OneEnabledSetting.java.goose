// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/OneEnabledSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/OneEnabledSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/abstraction/OneEnabledSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type.abstraction;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
//
// public abstract class OneEnabledSetting extends Setting {
//    private final String typeId;
//
//    public OneEnabledSetting(@Nonnull MenuType menu, @Nonnull String typeId) {
//       super(menu);
//       this.typeId = typeId;
//    }
//
//    public OneEnabledSetting(@Nonnull MenuType menu, boolean enabledByDefault, @Nonnull String typeId) {
//       super(menu, enabledByDefault);
//       this.typeId = typeId;
//    }
//
//    public void setEnabled(boolean enabled) {
//       super.setEnabled(enabled);
//       if (this.isEnabled()) {
//          this.disableOthers();
//       }
//
//    }
//
//    protected final void disableOthers() {
//       Challenges.getInstance().getChallengeManager().getChallenges().stream().filter((challenge) -> {
//          return challenge != this;
//       }).filter((challenge) -> {
//          return challenge instanceof OneEnabledSetting;
//       }).map((challenge) -> {
//          return (OneEnabledSetting)challenge;
//       }).filter((setting) -> {
//          return setting.typeId.equals(this.typeId);
//       }).forEach((setting) -> {
//          setting.setEnabled(false);
//       });
//    }
// }
//
