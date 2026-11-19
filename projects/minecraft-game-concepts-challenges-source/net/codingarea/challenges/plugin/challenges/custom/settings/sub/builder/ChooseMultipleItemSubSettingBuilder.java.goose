// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseMultipleItemSubSettingBuilder.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseMultipleItemSubSettingBuilder.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/sub/builder/ChooseMultipleItemSubSettingBuilder.java), unveraendert, als Inline-Doku ----
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
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.SubSettingChooseMultipleMenuGenerator;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
//
// public class ChooseMultipleItemSubSettingBuilder extends GeneratorSubSettingsBuilder {
//    protected final LinkedHashMap settings = new LinkedHashMap();
//
//    public ChooseMultipleItemSubSettingBuilder(String key) {
//       super(key);
//    }
//
//    public ChooseMultipleItemSubSettingBuilder(String key, SubSettingsBuilder parent) {
//       super(key, parent);
//    }
//
//    public MenuGenerator getGenerator(Player player, IParentCustomGenerator parentGenerator, String title) {
//       return new SubSettingChooseMultipleMenuGenerator(this.getKey(), parentGenerator, this.getSettings(), title);
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
//          int count = 0;
//          String firstDisplay = null;
//          String[] var7 = (String[])entry.getValue();
//          int var8 = var7.length;
//
//          for(int var9 = 0; var9 < var8; ++var9) {
//             String value = var7[var9];
//             ItemStack itemStack = (ItemStack)this.getSettings().get(value);
//             if (itemStack != null) {
//                if (firstDisplay == null) {
//                   if (itemStack.getItemMeta() != null) {
//                      firstDisplay = "§7" + this.getKeyTranslation() + " " + itemStack.getItemMeta().getDisplayName();
//                   }
//                } else {
//                   ++count;
//                }
//             }
//          }
//
//          if (firstDisplay != null) {
//             String suffix = count == 0 ? "" : " §7+" + count;
//             display.add(firstDisplay + suffix);
//          } else {
//             display.add("§7" + this.getKeyTranslation() + " " + DefaultItem.getItemPrefix() + Message.forName("none").asString());
//          }
//       }
//    }
//
//    public ChooseMultipleItemSubSettingBuilder addSetting(String key, ItemStack value) {
//       this.settings.put(key, value);
//       return this;
//    }
//
//    public ChooseMultipleItemSubSettingBuilder addSetting(String key, ItemBuilder value) {
//       this.settings.put(key, value.hideAttributes().build());
//       return this;
//    }
//
//    public ChooseMultipleItemSubSettingBuilder fill(Consumer actions) {
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
