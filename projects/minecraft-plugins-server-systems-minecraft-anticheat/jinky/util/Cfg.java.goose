// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/Cfg.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/Cfg.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/Cfg.java), unveraendert, als Inline-Doku ----
// package me.jinky.util;
//
// import java.io.File;
// import java.io.IOException;
// import java.util.List;
// import me.jinky.BAC;
// import org.bukkit.configuration.ConfigurationSection;
// import org.bukkit.configuration.file.FileConfiguration;
// import org.bukkit.configuration.file.YamlConfiguration;
//
// public class Cfg {
//    private File file;
//    private FileConfiguration config;
//
//    public Cfg(String key, BAC plugin) {
//       this.file = new File(plugin.getDataFolder() + File.separator + key);
//       if (!this.file.exists()) {
//          try {
//             this.file.createNewFile();
//          } catch (IOException var4) {
//             var4.printStackTrace();
//          }
//       }
//
//       this.config = YamlConfiguration.loadConfiguration(this.file);
//    }
//
//    public void set(String path, Object value) {
//       this.config.set(path, value);
//    }
//
//    public boolean contains(String path) {
//       return this.config.contains(path);
//    }
//
//    public String getString(String path) {
//       return this.config.getString(path);
//    }
//
//    public Integer getInteger(String path) {
//       return this.config.getInt(path);
//    }
//
//    public List getStringList(String path) {
//       return this.config.getStringList(path);
//    }
//
//    public ConfigurationSection getConfigurationSection(String path) {
//       return this.config.getConfigurationSection(path);
//    }
//
//    public double getDouble(String path) {
//       return this.config.getDouble(path);
//    }
//
//    public void save() {
//       try {
//          this.config.save(this.file);
//       } catch (IOException var2) {
//          var2.printStackTrace();
//       }
//
//    }
// }
//
