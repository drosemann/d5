// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/CustomMainSettingsMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/CustomMainSettingsMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/CustomMainSettingsMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;
//
// import java.util.HashMap;
// import java.util.LinkedHashMap;
// import java.util.Map;
// import java.util.function.Function;
// import lombok.Generated;
// import net.codingarea.challenges.plugin.challenges.custom.settings.IChallengeSetting;
// import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.management.menu.generator.ChooseItemGenerator;
// import net.codingarea.challenges.plugin.utils.misc.MapUtils;
// import org.bukkit.entity.Player;
//
// public class CustomMainSettingsMenuGenerator extends ChooseItemGenerator implements IParentCustomGenerator {
//    private final IParentCustomGenerator parent;
//    private final SettingType type;
//    private final String title;
//    private final String key;
//    private final Function instanceGetter;
//    private IChallengeSetting setting;
//    private SubSettingsBuilder subSettingsBuilder;
//    private Map subSettings;
//
//    public CustomMainSettingsMenuGenerator(IParentCustomGenerator parent, SettingType type, String key, String title, LinkedHashMap items, Function instanceGetter) {
//       super(items);
//       this.parent = parent;
//       this.type = type;
//       this.title = title;
//       this.key = key;
//       this.instanceGetter = instanceGetter;
//       this.subSettings = new HashMap();
//    }
//
//    public String[] getSubTitles(int page) {
//       return new String[]{this.title};
//    }
//
//    public int[] getNavigationSlots(int page) {
//       return MainCustomMenuGenerator.NAVIGATION_SLOTS;
//    }
//
//    public void accept(Player player, SettingType type, Map data) {
//       this.subSettings.putAll(data);
//       if (!this.openSubSettingsMenu(player)) {
//          this.parent.accept(player, this.type, this.subSettings);
//       }
//
//    }
//
//    public void onItemClick(Player player, String itemKey) {
//       this.setting = (IChallengeSetting)this.instanceGetter.apply(itemKey);
//       this.subSettingsBuilder = this.setting.getSubSettingsBuilder();
//       this.subSettings.put(this.key, new String[]{this.setting.getName()});
//       if (!this.openSubSettingsMenu(player)) {
//          this.parent.accept(player, this.type, this.subSettings);
//       }
//
//    }
//
//    private boolean openSubSettingsMenu(Player player) {
//       if (this.subSettingsBuilder != null && this.subSettingsBuilder.hasSettings()) {
//          this.subSettingsBuilder.open(player, this, this.title);
//          this.subSettingsBuilder = this.subSettingsBuilder.getChild();
//          return true;
//       } else {
//          return false;
//       }
//    }
//
//    public void onBackToMenuItemClick(Player player) {
//       this.parent.decline(player);
//    }
//
//    public void decline(Player player) {
//       if (this.setting != null) {
//          this.subSettings = MapUtils.createStringArrayMap(this.key, this.setting.getName());
//       }
//
//       this.open(player, 0);
//    }
//
//    @Generated
//    public IParentCustomGenerator getParent() {
//       return this.parent;
//    }
// }
//
