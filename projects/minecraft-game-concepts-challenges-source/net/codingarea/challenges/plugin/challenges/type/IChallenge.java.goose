// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/IChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/IChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/type/IChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.type;
//
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.management.challenges.entities.GamestateSaveable;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.menu.info.ChallengeMenuClickInfo;
// import org.bukkit.inventory.ItemStack;
//
// public interface IChallenge extends GamestateSaveable {
//    boolean isEnabled();
//
//    void restoreDefaults();
//
//    void handleShutdown();
//
//    @Nonnull
//    String getUniqueName();
//
//    @Nonnull
//    MenuType getType();
//
//    @Nullable
//    SettingCategory getCategory();
//
//    @Nonnull
//    ItemStack getDisplayItem();
//
//    @Nonnull
//    ItemStack getSettingsItem();
//
//    void handleClick(@Nonnull ChallengeMenuClickInfo var1);
//
//    void writeSettings(@Nonnull Document var1);
//
//    void loadSettings(@Nonnull Document var1);
// }
//
