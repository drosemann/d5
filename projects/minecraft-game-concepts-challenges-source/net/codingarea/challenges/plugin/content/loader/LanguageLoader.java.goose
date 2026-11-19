// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/LanguageLoader.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/LanguageLoader.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/content/loader/LanguageLoader.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.content.loader;
//
// import com.google.gson.JsonArray;
// import com.google.gson.JsonElement;
// import com.google.gson.JsonObject;
// import com.google.gson.JsonParser;
// import java.io.File;
// import java.io.IOException;
// import java.util.Iterator;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.collection.IOUtils;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.misc.FileUtils;
// import net.anweisen.utilities.common.misc.GsonUtils;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.utils.logging.ConsolePrint;
//
// public final class LanguageLoader extends ContentLoader {
//    public static final String DEFAULT_LANGUAGE = "en";
//    public static final String DIRECT_FILE_PATH = "direct-language-file";
//    private static final JsonParser parser = new JsonParser();
//    private static volatile boolean loaded = false;
//    private String language;
//    private boolean smallCapsFont;
//
//    public static boolean isLoaded() {
//       return loaded;
//    }
//
//    protected void load() {
//       Document config = Challenges.getInstance().getConfigDocument();
//       this.smallCapsFont = config.getBoolean("small-caps", false);
//       if (config.contains("direct-language-file")) {
//          this.language = Challenges.getInstance().getConfigDocument().getString("language", "en");
//          String path = config.getString("direct-language-file");
//          if (path != null) {
//             Logger.info("Using direct language file '{}'", path);
//             this.readLanguage(new File(path));
//          }
//       } else {
//          this.loadDefault();
//       }
//    }
//
//    private void loadDefault() {
//       this.download();
//       this.init();
//       this.read();
//    }
//
//    private void init() {
//       this.language = Challenges.getInstance().getConfigDocument().getString("language", "en");
//       File file = this.getMessageFile(this.language, "json");
//       if (!file.exists()) {
//          if (this.language.equalsIgnoreCase("en")) {
//             return;
//          }
//
//          ConsolePrint.unknownLanguage(this.language);
//          this.language = "en";
//       }
//
//       Logger.debug("Language '{}' is currently selected", this.language);
//    }
//
//    private void download() {
//       try {
//          JsonArray languages = parser.parse(IOUtils.toString(this.getGitHubUrl("language/languages.json"))).getAsJsonArray();
//          Logger.debug("Fetched languages {}", languages);
//          Iterator var2 = languages.iterator();
//
//          while(var2.hasNext()) {
//             JsonElement element = (JsonElement)var2.next();
//
//             try {
//                String name = element.getAsString();
//                String url = this.getGitHubUrl("language/files/" + name + ".json");
//                Document language = Document.parseJson(IOUtils.toString(url));
//                File file = this.getMessageFile(name, "json");
//                Logger.debug("Writing language {} to {}", name, file);
//                this.verifyLanguage(language, file, name);
//             } catch (Exception var8) {
//                Challenges.getInstance().getLogger().error("", new Object[]{var8});
//                Logger.error("Could not download language for {}. {}: {}", element, var8.getClass().getSimpleName(), var8.getMessage());
//             }
//          }
//       } catch (Exception var9) {
//          Logger.error("Could not download languages", var9);
//       }
//
//    }
//
//    private void verifyLanguage(@Nonnull Document download, @Nonnull File file, @Nonnull String name) throws IOException {
//       Document existing = Document.readJsonFile(file);
//       FileUtils.createFilesIfNecessary(file);
//       download.forEach((key, value) -> {
//          if (!existing.contains(key)) {
//             Logger.debug("Overwriting message {} in {} with {}", key, name, String.valueOf(value).replace("\"", "§r\""));
//             existing.set(key, value);
//          }
//
//       });
//       existing.saveToFile(file);
//    }
//
//    private void read() {
//       this.readLanguage(this.getMessageFile(this.language, "json"));
//    }
//
//    private void readLanguage(@Nonnull File file) {
//       try {
//          if (!file.exists()) {
//             ConsolePrint.unableToGetLanguages();
//             return;
//          }
//
//          int messages = 0;
//          JsonObject read = parser.parse(FileUtils.newBufferedReader(file)).getAsJsonObject();
//          Iterator var4 = read.entrySet().iterator();
//
//          while(var4.hasNext()) {
//             Entry entry = (Entry)var4.next();
//             Message message = Message.forName((String)entry.getKey());
//             JsonElement element = (JsonElement)entry.getValue();
//             if (element.isJsonPrimitive()) {
//                message.setValue(new String[]{element.getAsString()});
//                ++messages;
//             } else if (element.isJsonArray()) {
//                message.setValue(GsonUtils.convertJsonArrayToStringArray(element.getAsJsonArray()));
//                ++messages;
//             } else {
//                Logger.warn("Illegal type '{}' for {}", element.getClass().getName(), message.getName());
//             }
//          }
//
//          loaded = true;
//          Logger.info("Successfully loaded language '{}' from config file: {} message(s)", this.language, messages);
//       } catch (Exception var8) {
//          Logger.error("Could not read languages", var8);
//       }
//
//    }
//
//    public String getLanguage() {
//       return this.language;
//    }
//
//    public boolean isSmallCapsFont() {
//       return this.smallCapsFont;
//    }
// }
//
