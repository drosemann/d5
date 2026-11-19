// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/PrefixLoader.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/PrefixLoader.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/PrefixLoader.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.content.loader;
//
// import java.io.File;
// import java.util.Iterator;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.config.FileDocument;
// import net.anweisen.utilities.common.misc.FileUtils;
// import net.codingarea.challenges.plugin.content.Prefix;
//
// public final class PrefixLoader extends ContentLoader {
//    protected void load() {
//       try {
//          File file = this.getMessageFile("prefix", "properties");
//          FileUtils.createFilesIfNecessary(file);
//          FileDocument document = FileDocument.readPropertiesFile(file);
//          boolean changed = false;
//          Iterator var4 = Prefix.values().iterator();
//
//          while(var4.hasNext()) {
//             Prefix prefix = (Prefix)var4.next();
//             if (!document.contains(prefix.getName())) {
//                document.set(prefix.getName(), prefix.toString());
//                changed = true;
//             } else {
//                prefix.setValue(document.getString(prefix.getName()));
//             }
//          }
//
//          if (changed) {
//             document.save();
//          }
//
//          Logger.info("Successfully loaded {} prefixes from config file", Prefix.values().size());
//       } catch (Exception var6) {
//          Logger.error("Could not load prefixes", var6);
//       }
//
//    }
// }
//
