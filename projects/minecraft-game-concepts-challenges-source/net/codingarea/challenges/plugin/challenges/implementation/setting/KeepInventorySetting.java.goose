// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/KeepInventorySetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/KeepInventorySetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/KeepInventorySetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.GameRule;
// import org.bukkit.Material;
// import org.bukkit.World;
//
// public class KeepInventorySetting extends Setting {
//    public KeepInventorySetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ENDER_EYE, Message.forName("item-keep-inventory-setting"));
//    }
//
//    protected void onEnable() {
//       Iterator var1 = Bukkit.getWorlds().iterator();
//
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          world.setGameRule(GameRule.KEEP_INVENTORY, true);
//       }
//
//    }
//
//    protected void onDisable() {
//       Iterator var1 = Bukkit.getWorlds().iterator();
//
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          world.setGameRule(GameRule.KEEP_INVENTORY, false);
//       }
//
//    }
// }
//
