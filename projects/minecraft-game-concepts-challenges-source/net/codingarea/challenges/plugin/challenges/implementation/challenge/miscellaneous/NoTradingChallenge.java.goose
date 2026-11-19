// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoTradingChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoTradingChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoTradingChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.Sound;
// import org.bukkit.entity.Villager;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityPickupItemEvent;
// import org.bukkit.event.player.PlayerInteractEntityEvent;
//
// public class NoTradingChallenge extends Setting {
//    public NoTradingChallenge() {
//       super(MenuType.CHALLENGES);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.EMERALD, Message.forName("item-no-trading-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onInteract(@Nonnull PlayerInteractEntityEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getRightClicked() instanceof Villager) {
//             event.getPlayer().playSound(event.getPlayer().getLocation(), Sound.ENTITY_VILLAGER_NO, 1.0F, 1.0F);
//             event.setCancelled(true);
//          } else if (event.getRightClicked().getType().name().equals("PIGLIN")) {
//             event.getPlayer().playSound(event.getPlayer().getLocation(), Sound.ENTITY_PIGLIN_ADMIRING_ITEM, 1.0F, 1.0F);
//             event.setCancelled(true);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onEntityPickupItem(@Nonnull EntityPickupItemEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getEntityType().name().equals("PIGLIN")) {
//             event.setCancelled(true);
//          }
//
//       }
//    }
// }
//
