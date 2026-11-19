// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/NoDupedItemsChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/NoDupedItemsChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/NoDupedItemsChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory;
//
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.collection.pair.Triple;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.challenges.annotations.CanInstaKillOnEnable;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
// import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.OfflinePlayer;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.inventory.ItemStack;
//
// @Since("2.0")
// @CanInstaKillOnEnable
// public class NoDupedItemsChallenge extends Setting {
//    public NoDupedItemsChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.INVENTORY);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.OBSERVER, Message.forName("item-no-duped-items-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.checkInventories();
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onEntityPickUpItem(@Nonnull PlayerPickupItemEvent event) {
//       Bukkit.getScheduler().runTaskLater(plugin, () -> {
//          if (this.shouldExecuteEffect()) {
//             if (!ignorePlayer(event.getPlayer())) {
//                this.checkInventories();
//             }
//          }
//       }, 1L);
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onInteract(@Nonnull PlayerInteractEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getClickedBlock() != null) {
//                this.checkInventories();
//             }
//          }
//       }
//    }
//
//    private void checkInventories() {
//       Map blackList = new HashMap();
//       Iterator var2 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var2.hasNext()) {
//          Player player = (Player)var2.next();
//          Triple result = this.checkInventory(player, blackList);
//          if (result != null) {
//             Message.forName("no-duped-items-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName((OfflinePlayer)result.getFirst()), NameHelper.getName((OfflinePlayer)result.getSecond()), result.getThird());
//             ChallengeHelper.kill((Player)result.getFirst());
//             ChallengeHelper.kill((Player)result.getSecond());
//          }
//       }
//
//    }
//
//    private Triple checkInventory(@Nonnull Player player, Map blacklist) {
//       List localBlacklist = new ArrayList();
//       List playerBlacklist = (List)blacklist.getOrDefault(player, new ArrayList());
//       blacklist.put(player, playerBlacklist);
//       ItemStack[] var5 = player.getInventory().getContents();
//       int var6 = var5.length;
//
//       for(int var7 = 0; var7 < var6; ++var7) {
//          ItemStack item = var5[var7];
//          if (item != null && !localBlacklist.contains(item.getType())) {
//             localBlacklist.add(item.getType());
//             Iterator var9 = blacklist.entrySet().iterator();
//
//             while(var9.hasNext()) {
//                Entry entry = (Entry)var9.next();
//                List currentBlacklist = (List)entry.getValue();
//                if (currentBlacklist.contains(item.getType())) {
//                   return new Triple(player, (Player)entry.getKey(), item.getType());
//                }
//             }
//
//             playerBlacklist.add(item.getType());
//          }
//       }
//
//       return null;
//    }
// }
//
