// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/Prefix.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/Prefix.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/Prefix.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.content;
//
// import java.util.Collection;
// import java.util.Collections;
// import java.util.HashMap;
// import java.util.Map;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class Prefix {
//    private static final Map values = new HashMap();
//    public static final Prefix CHALLENGES = forName("challenges", "§6Challenges");
//    public static final Prefix CUSTOM = forName("custom", "§bCustom");
//    public static final Prefix DAMAGE = forName("damage", "§cDamage");
//    public static final Prefix POSITION = forName("position", "§9Position");
//    public static final Prefix BACKPACK = forName("backpack", "§aBackpack");
//    public static final Prefix TIMER = forName("timer", "§5Timer");
//    private final String name;
//    private final String defaultValue;
//    private String value;
//
//    private Prefix(@Nonnull String name, @Nonnull String defaultValue) {
//       this.defaultValue = getDefaultValueFor(defaultValue);
//       this.name = name;
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public static Collection values() {
//       return Collections.unmodifiableCollection(values.values());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public static Prefix forName(@Nonnull String name, @Nonnull String defaultValue) {
//       return (Prefix)values.computeIfAbsent(name, (key) -> {
//          return new Prefix(name, defaultValue);
//       });
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public static Prefix forName(@Nonnull String name) {
//       return forName(name, name);
//    }
//
//    @Nonnull
//    public static String getDefaultValueFor(@Nonnull String value) {
//       return "§8§l┃ " + value + " §8┃ ";
//    }
//
//    public void setValue(@Nullable String value) {
//       this.value = value == null ? null : (value.endsWith(" ") ? value : value + " ");
//    }
//
//    @Nonnull
//    public String toString() {
//       return (this.value == null ? this.defaultValue : this.value) + "§7";
//    }
//
//    @Nonnull
//    public String getName() {
//       return this.name;
//    }
// }
//
