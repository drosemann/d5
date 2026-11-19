// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/SubSettingChooseMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/SubSettingChooseMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/SubSettingChooseMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;
//
// import java.util.LinkedHashMap;
// import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
// import net.codingarea.challenges.plugin.management.menu.generator.ChooseItemGenerator;
// import net.codingarea.challenges.plugin.utils.misc.MapUtils;
// import org.bukkit.entity.Player;
//
// public class SubSettingChooseMenuGenerator extends ChooseItemGenerator {
//    private final IParentCustomGenerator parent;
//    private final String key;
//    private final String title;
//
//    public SubSettingChooseMenuGenerator(String key, IParentCustomGenerator parent, LinkedHashMap map, String title) {
//       super(map);
//       this.key = key;
//       this.title = title;
//       this.parent = parent;
//    }
//
//    public String[] getSubTitles(int page) {
//       return new String[]{this.title};
//    }
//
//    public void onItemClick(Player player, String itemKey) {
//       this.parent.accept(player, (SettingType)null, MapUtils.createStringArrayMap(this.key, itemKey));
//    }
//
//    public void onBackToMenuItemClick(Player player) {
//       this.parent.decline(player);
//    }
// }
//
