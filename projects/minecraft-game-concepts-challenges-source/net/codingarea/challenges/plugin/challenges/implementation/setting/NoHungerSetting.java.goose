// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHungerSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHungerSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHungerSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.entity.FoodLevelChangeEvent;
//
// public class NoHungerSetting extends Setting {
//    public NoHungerSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    protected void onEnable() {
//       broadcastFiltered(this::feedPlayer);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BREAD, Message.forName("no-hunger-setting"));
//    }
//
//    @EventHandler(
//       ignoreCancelled = true
//    )
//    public void onHunger(@Nonnull FoodLevelChangeEvent event) {
//       if (event.getEntity() instanceof Player) {
//          if (this.shouldExecuteEffect()) {
//             this.feedPlayer((Player)event.getEntity());
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    private void feedPlayer(@Nonnull Player player) {
//       player.setFoodLevel(20);
//       player.setSaturation(20.0F);
//    }
// }
//
