// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ValueSubSettingsBuilder.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ValueSubSettingsBuilder.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ValueSubSettingsBuilder.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.sub.builder;
//
// import com.google.common.collect.Lists;
// import java.util.Iterator;
// import java.util.LinkedHashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.function.Consumer;
// import java.util.function.Function;
// import lombok.Generated;
// import net.anweisen.utilities.common.misc.StringUtils;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.ValueSetting;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.impl.BooleanSetting;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.impl.ModifierSetting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.impl.MessageManager;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.SubSettingValueMenuGenerator;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.entity.Player;
//
// public class ValueSubSettingsBuilder extends GeneratorSubSettingsBuilder {
//    private final LinkedHashMap defaultSettings = new LinkedHashMap();
//
//    public ValueSubSettingsBuilder() {
//       super("value");
//    }
//
//    public ValueSubSettingsBuilder(SubSettingsBuilder parent) {
//       super("value", parent);
//    }
//
//    public MenuGenerator getGenerator(Player player, IParentCustomGenerator parentGenerator, String title) {
//       return new SubSettingValueMenuGenerator(parentGenerator, new LinkedHashMap(this.getDefaultSettings()), title);
//    }
//
//    public List getDisplay(Map activated) {
//       List display = Lists.newLinkedList();
//       Iterator var3 = activated.entrySet().iterator();
//
//       while(var3.hasNext()) {
//          Entry entry = (Entry)var3.next();
//          Iterator var5 = this.defaultSettings.keySet().iterator();
//
//          while(var5.hasNext()) {
//             ValueSetting setting = (ValueSetting)var5.next();
//             if (((String)entry.getKey()).equals(setting.getKey())) {
//                ItemBuilder builder = setting.getSettingsItem(((String[])entry.getValue())[0]);
//                if (builder != null) {
//                   display.add("§7" + this.getKeyTranslation((String)entry.getKey()) + " " + builder.getName());
//                }
//             }
//          }
//       }
//
//       return display;
//    }
//
//    public String getKeyTranslation(String key) {
//       String messageName = "custom-subsetting-" + key;
//       return MessageManager.hasMessageInCache(messageName) ? Message.forName(messageName).asString() : StringUtils.getEnumName(key);
//    }
//
//    public ValueSubSettingsBuilder addBooleanSetting(String key, ItemBuilder displayItem, boolean defaultValue) {
//       this.defaultSettings.put(new BooleanSetting(key, displayItem), defaultValue ? "enabled" : "disabled");
//       return this;
//    }
//
//    public ValueSubSettingsBuilder addModifierSetting(String key, ItemBuilder displayItem, int defaultValue, int min, int max) {
//       this.defaultSettings.put(new ModifierSetting(key, min, max, displayItem), String.valueOf(defaultValue));
//       return this;
//    }
//
//    public ValueSubSettingsBuilder addModifierSetting(String key, ItemBuilder displayItem, int defaultValue, int min, int max, Function prefixGetter, Function suffixGetter) {
//       this.defaultSettings.put(new ModifierSetting(key, min, max, displayItem, prefixGetter, suffixGetter), String.valueOf(defaultValue));
//       return this;
//    }
//
//    public ValueSubSettingsBuilder addModifierSetting(String key, ItemBuilder displayItem, int defaultValue, int min, int max, Function settingsItemGetter) {
//       this.defaultSettings.put(new ModifierSetting(key, min, max, displayItem, settingsItemGetter), String.valueOf(defaultValue));
//       return this;
//    }
//
//    public ValueSubSettingsBuilder fill(Consumer actions) {
//       actions.accept(this);
//       return this;
//    }
//
//    public boolean hasSettings() {
//       return !this.defaultSettings.isEmpty();
//    }
//
//    @Generated
//    public LinkedHashMap getDefaultSettings() {
//       return this.defaultSettings;
//    }
// }
//
