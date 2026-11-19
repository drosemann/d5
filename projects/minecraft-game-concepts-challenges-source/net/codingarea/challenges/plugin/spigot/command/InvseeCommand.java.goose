// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/InvseeCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/InvseeCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/InvseeCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.anweisen.utilities.bukkit.utils.menu.positions.SlottedMenuPosition;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.entity.HumanEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.inventory.InventoryCloseEvent;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.PlayerInventory;
//
// public class InvseeCommand implements PlayerCommand, Listener {
//    private static final int startBottom = 36;
//    private static final int endBottom = 53;
//    private static final int helmetSlot = 46;
//    private static final int chestPlateSlot = 47;
//    private static final int leggingsSlot = 48;
//    private static final int bootsSlot = 49;
//    private static final int offHandSlot = 52;
//    private final Map inventories = new HashMap();
//
//    public void onCommand(@Nonnull Player player, @Nonnull String[] args) throws Exception {
//       if (args.length < 1) {
//          Message.forName("syntax").send(player, Prefix.CHALLENGES, "invsee <player>");
//       } else {
//          Player target = Bukkit.getPlayer(args[0]);
//          if (target == null) {
//             Message.forName("command-no-target").send(player, Prefix.CHALLENGES);
//          } else {
//             player.openInventory(this.getInventory(target));
//             MenuPosition.set(player, new SlottedMenuPosition());
//             Message.forName("command-invsee-open").send(player, Prefix.CHALLENGES, NameHelper.getName(target));
//          }
//       }
//    }
//
//    public Inventory getInventory(@Nonnull Player player) {
//       if (this.inventories.containsKey(player)) {
//          return (Inventory)this.inventories.get(player);
//       } else {
//          Inventory inventory = Bukkit.createInventory(MenuPosition.HOLDER, 54, InventoryTitleManager.getTitle(Message.forName("inventory-color").asString() + NameHelper.getName(player)));
//          this.inventories.put(player, inventory);
//          MenuPosition.set(player, (event) -> {
//          });
//          this.updateInventoryContents(inventory, player.getInventory());
//          return inventory;
//       }
//    }
//
//    public void updateInventoryContents(@Nonnull Inventory inventory, @Nonnull PlayerInventory playerInventory) {
//       inventory.clear();
//
//       int slot;
//       for(slot = 36; slot <= 53; ++slot) {
//          inventory.setItem(slot, ItemBuilder.FILL_ITEM);
//       }
//
//       inventory.setItem(46, playerInventory.getHelmet());
//       inventory.setItem(47, playerInventory.getChestplate());
//       inventory.setItem(48, playerInventory.getLeggings());
//       inventory.setItem(49, playerInventory.getBoots());
//       inventory.setItem(52, playerInventory.getItemInOffHand());
//
//       for(slot = 0; slot < 36; ++slot) {
//          inventory.setItem(slot, playerInventory.getItem(slot));
//       }
//
//    }
//
//    public void updateInventory(@Nonnull Player player) {
//       if (this.inventories.containsKey(player)) {
//          Inventory inventory = (Inventory)this.inventories.get(player);
//          this.updateInventoryContents(inventory, player.getInventory());
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
//       if (event.getClickedInventory() != null) {
//          if (event.getClickedInventory().getHolder() == event.getPlayer()) {
//             Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
//                this.updateInventory(event.getPlayer());
//             }, 1L);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerDropItem(@Nonnull PlayerDropItemEvent event) {
//       Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
//          this.updateInventory(event.getPlayer());
//       }, 1L);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerQuit(@Nonnull PlayerQuitEvent event) {
//       Inventory inventory = (Inventory)this.inventories.remove(event.getPlayer());
//       if (inventory != null) {
//          Iterator var3 = (new ArrayList(inventory.getViewers())).iterator();
//
//          while(var3.hasNext()) {
//             HumanEntity viewer = (HumanEntity)var3.next();
//             viewer.closeInventory();
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onClose(@Nonnull InventoryCloseEvent event) {
//       if (event.getInventory().getHolder() == MenuPosition.HOLDER) {
//          Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
//             Iterator var1 = this.inventories.entrySet().iterator();
//
//             while(var1.hasNext()) {
//                Entry entry = (Entry)var1.next();
//                Inventory inventory = (Inventory)entry.getValue();
//                if (inventory.getViewers().isEmpty()) {
//                   this.inventories.remove(entry.getKey());
//                }
//             }
//
//          }, 1L);
//       }
//    }
// }
//
