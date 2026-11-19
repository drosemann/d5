// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/YamlDocument.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/YamlDocument.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/config/document/YamlDocument.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.config.document;
//
// import java.awt.Color;
// import java.io.File;
// import java.io.IOException;
// import java.io.Writer;
// import java.text.DateFormat;
// import java.time.OffsetDateTime;
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Date;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.UUID;
// import java.util.function.BiConsumer;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.config.Document;
// import org.bukkit.configuration.ConfigurationSection;
// import org.bukkit.configuration.file.YamlConfiguration;
// import org.bukkit.configuration.file.YamlConstructor;
// import org.bukkit.configuration.file.YamlRepresenter;
// import org.yaml.snakeyaml.DumperOptions;
// import org.yaml.snakeyaml.LoaderOptions;
// import org.yaml.snakeyaml.Yaml;
// import org.yaml.snakeyaml.DumperOptions.FlowStyle;
// import org.yaml.snakeyaml.representer.Representer;
//
// public class YamlDocument extends AbstractDocument {
//    protected final ConfigurationSection config;
//
//    public YamlDocument() {
//       this.config = new YamlConfiguration();
//    }
//
//    public YamlDocument(@Nonnull ConfigurationSection config) {
//       this.config = config;
//    }
//
//    public YamlDocument(@Nonnull ConfigurationSection config, @Nonnull Document root, @Nullable Document parent) {
//       super(root, parent);
//       this.config = config;
//    }
//
//    public YamlDocument(@Nonnull File file) {
//       this((ConfigurationSection)YamlConfiguration.loadConfiguration(file));
//    }
//
//    @Nullable
//    public String getString(@Nonnull String path) {
//       return this.config.getString(path);
//    }
//
//    @Nonnull
//    public String getString(@Nonnull String path, @Nonnull String def) {
//       String string = this.config.getString(path, def);
//       return string == null ? def : string;
//    }
//
//    @Nullable
//    public Object getObject(@Nonnull String path) {
//       return this.config.get(path);
//    }
//
//    @Nonnull
//    public Object getObject(@Nonnull String path, @Nonnull Object def) {
//       Object value = this.config.get(path, def);
//       return value == null ? def : value;
//    }
//
//    public Object getInstance(@Nonnull String path, @Nonnull Class classOfT) {
//       return this.copyJson().getInstance(path, classOfT);
//    }
//
//    public Object toInstanceOf(@Nonnull Class classOfT) {
//       return this.copyJson().toInstanceOf(classOfT);
//    }
//
//    @Nonnull
//    public Document getDocument0(@Nonnull String path, @Nonnull Document root, @Nullable Document parent) {
//       ConfigurationSection section = this.config.getConfigurationSection(path);
//       if (section == null) {
//          section = this.config.createSection(path);
//       }
//
//       return new YamlDocument(section, root, parent);
//    }
//
//    @Nonnull
//    public List getDocumentList(@Nonnull String path) {
//       List maps = this.config.getMapList(path);
//       List documents = new ArrayList(maps.size());
//       Iterator var4 = maps.iterator();
//
//       while(var4.hasNext()) {
//          Map map = (Map)var4.next();
//          documents.add(new MapDocument(map, this.root, this));
//       }
//
//       return documents;
//    }
//
//    public long getLong(@Nonnull String path) {
//       return this.config.getLong(path);
//    }
//
//    public long getLong(@Nonnull String path, long def) {
//       return this.config.getLong(path, def);
//    }
//
//    public int getInt(@Nonnull String path) {
//       return this.config.getInt(path);
//    }
//
//    public int getInt(@Nonnull String path, int def) {
//       return this.config.getInt(path, def);
//    }
//
//    public short getShort(@Nonnull String path) {
//       return (short)this.config.getInt(path);
//    }
//
//    public short getShort(@Nonnull String path, short def) {
//       return (short)this.config.getInt(path, def);
//    }
//
//    public byte getByte(@Nonnull String path) {
//       return (byte)this.config.getInt(path);
//    }
//
//    public byte getByte(@Nonnull String path, byte def) {
//       return (byte)this.config.getInt(path, def);
//    }
//
//    public char getChar(@Nonnull String path) {
//       return this.getChar(path, '\u0000');
//    }
//
//    public char getChar(@Nonnull String path, char def) {
//       try {
//          return this.getString(path).charAt(0);
//       } catch (StringIndexOutOfBoundsException | NullPointerException var4) {
//          return def;
//       }
//    }
//
//    public double getDouble(@Nonnull String path) {
//       return this.config.getDouble(path);
//    }
//
//    public double getDouble(@Nonnull String path, double def) {
//       return this.config.getDouble(path, def);
//    }
//
//    public float getFloat(@Nonnull String path) {
//       return (float)this.config.getDouble(path);
//    }
//
//    public float getFloat(@Nonnull String path, float def) {
//       return (float)this.config.getDouble(path, (double)def);
//    }
//
//    public boolean getBoolean(@Nonnull String path) {
//       return this.config.getBoolean(path);
//    }
//
//    public boolean getBoolean(@Nonnull String path, boolean def) {
//       return this.config.getBoolean(path, def);
//    }
//
//    @Nonnull
//    public List getStringList(@Nonnull String path) {
//       return this.config.getStringList(path);
//    }
//
//    @Nullable
//    public UUID getUUID(@Nonnull String path) {
//       try {
//          return UUID.fromString(this.getString(path));
//       } catch (Exception var3) {
//          return null;
//       }
//    }
//
//    @Nullable
//    public Date getDate(@Nonnull String path) {
//       try {
//          return DateFormat.getDateTimeInstance().parse(path);
//       } catch (Exception var3) {
//          return null;
//       }
//    }
//
//    @Nullable
//    public OffsetDateTime getDateTime(@Nonnull String path) {
//       try {
//          return OffsetDateTime.parse(this.getString(path));
//       } catch (Exception var3) {
//          return null;
//       }
//    }
//
//    @Nullable
//    public Color getColor(@Nonnull String path) {
//       try {
//          return Color.decode(this.getString(path));
//       } catch (Exception var3) {
//          return null;
//       }
//    }
//
//    @Nullable
//    public Enum getEnum(@Nonnull String path, @Nonnull Class classOfEnum) {
//       try {
//          String name = this.getString(path);
//          return name == null ? null : Enum.valueOf(classOfEnum, name);
//       } catch (Throwable var4) {
//          return null;
//       }
//    }
//
//    public boolean isList(@Nonnull String path) {
//       return this.config.isList(path);
//    }
//
//    public boolean isObject(@Nonnull String path) {
//       return !this.isDocument(path) && !this.isList(path);
//    }
//
//    public boolean isDocument(@Nonnull String path) {
//       return this.config.get(path) instanceof ConfigurationSection;
//    }
//
//    public boolean contains(@Nonnull String path) {
//       return this.config.contains(path, true);
//    }
//
//    public int size() {
//       return this.config.getValues(false).size();
//    }
//
//    public void set0(@Nonnull String path, @Nullable Object value) {
//       if (value instanceof Enum) {
//          Enum enun = (Enum)value;
//          value = enun.name();
//       }
//
//       this.config.set(path, value);
//    }
//
//    public void remove0(@Nonnull String path) {
//       this.config.set(path, (Object)null);
//    }
//
//    public void clear0() {
//       Iterator var1 = this.config.getKeys(true).iterator();
//
//       while(var1.hasNext()) {
//          String key = (String)var1.next();
//          this.config.set(key, (Object)null);
//       }
//
//    }
//
//    @Nonnull
//    public Map values() {
//       return this.config.getValues(true);
//    }
//
//    @Nonnull
//    public Collection keys() {
//       return this.config.getKeys(false);
//    }
//
//    public void forEach(@Nonnull BiConsumer action) {
//       this.values().forEach(action);
//    }
//
//    public String toString() {
//       DumperOptions yamlOptions = new DumperOptions();
//       LoaderOptions loaderOptions = new LoaderOptions();
//       Representer yamlRepresenter = new YamlRepresenter();
//       Yaml yaml = new Yaml(new YamlConstructor(), yamlRepresenter, yamlOptions, loaderOptions);
//       yamlOptions.setIndent(2);
//       yamlOptions.setDefaultFlowStyle(FlowStyle.BLOCK);
//       yamlRepresenter.setDefaultFlowStyle(FlowStyle.BLOCK);
//       String dump = yaml.dump(this.config.getValues(false));
//       if (dump.equals("{}\n")) {
//          dump = "";
//       }
//
//       return dump;
//    }
//
//    public void write(@Nonnull Writer writer) throws IOException {
//       writer.write(this.toString());
//    }
//
//    @Nonnull
//    public Document copyJson() {
//       return new GsonDocument(this.values());
//    }
//
//    @Nonnull
//    public String toJson() {
//       return this.copyJson().toJson();
//    }
//
//    @Nonnull
//    public String toPrettyJson() {
//       return this.copyJson().toPrettyJson();
//    }
//
//    public boolean isReadonly() {
//       return false;
//    }
// }
//
