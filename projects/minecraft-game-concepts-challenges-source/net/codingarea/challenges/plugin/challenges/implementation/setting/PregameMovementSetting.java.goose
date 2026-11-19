// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/PregameMovementSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/PregameMovementSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/PregameMovementSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.player.PlayerMoveEvent;
//
// public class PregameMovementSetting extends Setting {
//    public PregameMovementSetting() {
//       super(MenuType.SETTINGS, true);
//    }
//
//    @EventHandler
//    public void onMove(@Nonnull PlayerMoveEvent event) {
//       if (!ChallengeAPI.isStarted() && !this.isEnabled()) {
//          if (event.getPlayer().getGameMode() != GameMode.SPECTATOR && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
//             Location to = event.getTo();
//             if (to != null) {
//                if (!BlockUtils.isSameLocationIgnoreHeight(event.getFrom(), to)) {
//                   Location target = event.getFrom().clone();
//                   target.setY((double)target.getBlockY());
//                   this.findNearestBlock(target);
//                   target.add(0.0D, 1.0D, 0.0D);
//                   target.setPitch(to.getPitch());
//                   target.setYaw(to.getYaw());
//                   target.setDirection(to.getDirection());
//                   event.setTo(target);
//                   Message.forName("title-pregame-movement-setting").sendTitleInstant(event.getPlayer());
//                }
//             }
//          }
//       }
//    }
//
//    private void findNearestBlock(@Nonnull Location location) {
//       while(location.getBlockY() > 0 && location.getBlock().isPassable()) {
//          location.subtract(0.0D, 1.0D, 0.0D);
//       }
//
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.PISTON, Message.forName("pregame-movement-setting"));
//    }
// }
//
