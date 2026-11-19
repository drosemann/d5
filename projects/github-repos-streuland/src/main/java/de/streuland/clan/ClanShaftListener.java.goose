// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/clan/ClanShaftListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/clan/ClanShaftListener.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/clan/ClanShaftListener.java), unveraendert, als Inline-Doku ----
// package de.streuland.clan;
//
// import de.streuland.clan.ClanShaftService;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.inventory.ItemStack;
//
// import java.util.List;
//
// /**
//  * Leitet Items, die von Clan-Mitgliedern in den Dropschacht geworfen werden,
//  * direkt ins Clan-Lager um.
//  */
// public class ClanShaftListener implements Listener {
//
//     private final ClanShaftService shaftService;
//     private final ClanManager clanManager;
//
//     public ClanShaftListener(ClanShaftService shaftService, ClanManager clanManager) {
//         this.shaftService = shaftService;
//         this.clanManager = clanManager;
//     }
//
//     @EventHandler(priority = EventPriority.HIGH, ignoreCancelled = true)
//     public void onPlayerDropItem(PlayerDropItemEvent event) {
//         if (shaftService == null || !shaftService.isEnabled()) {
//             return;
//         }
//         Player player = event.getPlayer();
//         Clan clan = clanManager != null ? clanManager.getClanByPlayer(player.getUniqueId()) : null;
//         if (clan == null) {
//             return;
//         }
//
//         ItemStack dropped = event.getItemDrop().getItemStack();
//         org.bukkit.Location dropLocation = event.getItemDrop().getLocation();
//         if (!shaftService.isInsideShaft(clan, dropLocation.getBlockX(), dropLocation.getBlockY(), dropLocation.getBlockZ())) {
//             return;
//         }
//
//         event.getItemDrop().remove();
//         List<ItemStack> leftovers = shaftService.deposit(clan, dropped);
//         if (leftovers.isEmpty()) {
//             player.sendMessage("§aItem(s) im Clan-Lager angekommen!");
//         } else {
//             for (ItemStack item : leftovers) {
//                 player.getWorld().dropItemNaturally(player.getLocation(), item);
//             }
//             player.sendMessage("§eDas Clan-Lager ist voll! Ein Teil wurde dir zurückgegeben.");
//         }
//     }
// }
//
