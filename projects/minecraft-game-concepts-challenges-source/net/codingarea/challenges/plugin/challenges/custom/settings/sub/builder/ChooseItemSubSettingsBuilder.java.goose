// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseItemSubSettingsBuilder.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseItemSubSettingsBuilder.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseItemSubSettingsBuilder.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.sub.builder;
//
// import com.google.common.collect.Lists;
// import java.util.Iterator;
// import java.util.LinkedHashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.function.Consumer;
// import lombok.Generated;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.SubSettingChooseMenuGenerator;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
//
// public class ChooseItemSubSettingsBuilder extends GeneratorSubSettingsBuilder {
//    protected final LinkedHashMap settings = new LinkedHashMap();
//
//    public ChooseItemSubSettingsBuilder(String key) {
//       super(key);
//    }
//
//    public ChooseItemSubSettingsBuilder(String key, SubSettingsBuilder parent) {
//       super(key, parent);
//    }
//
//    public MenuGenerator getGenerator(Player player, IParentCustomGenerator parentGenerator, String title) {
//       return new SubSettingChooseMenuGenerator(this.getKey(), parentGenerator, this.getSettings(), title);
//    }
//
//    public List getDisplay(Map activated) {
//       List display = Lists.newLinkedList();
//       Iterator var3 = activated.entrySet().iterator();
//
//       while(true) {
//          Entry entry;
//          do {
//             if (!var3.hasNext()) {
//                return display;
//             }
//
//             entry = (Entry)var3.next();
//          } while(!((String)entry.getKey()).equals(this.getKey()));
//
//          String[] var5 = (String[])entry.getValue();
//          int var6 = var5.length;
//
//          for(int var7 = 0; var7 < var6; ++var7) {
//             String value = var5[var7];
//             ItemStack itemStack = (ItemStack)this.getSettings().get(value);
//             if (itemStack != null && itemStack.getItemMeta() != null) {
//                display.add("§7" + this.getKeyTranslation() + " " + itemStack.getItemMeta().getDisplayName());
//             }
//          }
//       }
//    }
//
//    public ChooseItemSubSettingsBuilder addSetting(String key, ItemStack value) {
//       this.settings.put(key, value);
//       return this;
//    }
//
//    public ChooseItemSubSettingsBuilder addSetting(String key, ItemBuilder value) {
//       this.settings.put(key, value.hideAttributes().build());
//       return this;
//    }
//
//    public ChooseItemSubSettingsBuilder fill(Consumer actions) {
//       actions.accept(this);
//       return this;
//    }
//
//    public boolean hasSettings() {
//       return !this.settings.isEmpty();
//    }
//
//    @Generated
//    public LinkedHashMap getSettings() {
//       return this.settings;
//    }
// }
//
