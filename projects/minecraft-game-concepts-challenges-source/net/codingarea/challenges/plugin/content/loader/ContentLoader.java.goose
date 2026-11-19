// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/ContentLoader.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/ContentLoader.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/ContentLoader.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.content.loader;
//
// import java.io.File;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
//
// public abstract class ContentLoader {
//    @Nonnull
//    protected final File getMessagesFolder() {
//       return Challenges.getInstance().getDataFile("messages");
//    }
//
//    @Nonnull
//    protected final File getMessageFile(@Nonnull String name, @Nonnull String extension) {
//       return new File(this.getMessagesFolder(), name + "." + extension);
//    }
//
//    @Nonnull
//    protected final String getGitHubUrl(@Nonnull String path) {
//       return "https://raw.githubusercontent.com/anweisen/Challenges/" + (Challenges.getInstance().isDevMode() ? "development" : "master") + "/" + path;
//    }
//
//    protected abstract void load();
// }
//
