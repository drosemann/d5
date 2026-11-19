// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/ChallengeSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/ChallengeSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/ChallengeSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings;
//
// import java.util.function.Supplier;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
//
// public abstract class ChallengeSetting implements IChallengeSetting {
//    private final String name;
//    private final SubSettingsBuilder subSettingsBuilder;
//
//    public ChallengeSetting(String name, SubSettingsBuilder subSettingsBuilder) {
//       this.name = name;
//       this.subSettingsBuilder = subSettingsBuilder.build();
//    }
//
//    public ChallengeSetting(String name) {
//       this(name, (SubSettingsBuilder)SubSettingsBuilder.createEmpty());
//    }
//
//    public ChallengeSetting(String name, Supplier builderSupplier) {
//       this(name, (SubSettingsBuilder)builderSupplier.get());
//    }
//
//    public String getMessageSuffix() {
//       return this.name.toLowerCase();
//    }
//
//    public SubSettingsBuilder getSubSettingsBuilder() {
//       return this.subSettingsBuilder;
//    }
//
//    public String getName() {
//       return this.name;
//    }
// }
//
