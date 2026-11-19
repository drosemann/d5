// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/MostEmeraldsGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/MostEmeraldsGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/MostEmeraldsGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.PointsGoal;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.inventory.InventoryClickEvent;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.PlayerInventory;
//
// @Since("2.0.2")
// public class MostEmeraldsGoal extends PointsGoal {
//    public MostEmeraldsGoal() {
//       this.setCategory(SettingCategory.SCORE_POINTS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.EMERALD, Message.forName("item-most-emeralds-goal"));
//    }
//
//    protected void onEnable() {
//       broadcastFiltered(this::updatePoints);
//       super.onEnable();
//    }
//
//    private void updatePoints(@Nonnull Player player) {
//       Bukkit.getScheduler().runTask(plugin, () -> {
//          int count = this.getEmeraldsCount(player);
//          this.setPoints(player.getUniqueId(), count);
//       });
//    }
//
//    private int getEmeraldsCount(@Nonnull Player player) {
//       PlayerInventory inventory = player.getInventory();
//       int count = 0;
//       ItemStack[] var4 = inventory.getContents();
//       int var5 = var4.length;
//
//       for(int var6 = 0; var6 < var5; ++var6) {
//          ItemStack itemStack = var4[var6];
//          if (itemStack != null && itemStack.getType() == Material.EMERALD) {
//             count += itemStack.getAmount();
//          }
//       }
//
//       if (player.getItemOnCursor().getType() == Material.EMERALD) {
//          count += player.getItemOnCursor().getAmount();
//       }
//
//       return count;
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onUpdate(@Nonnull InventoryClickEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getWhoClicked() instanceof Player) {
//             Player player = (Player)event.getWhoClicked();
//             if (!ignorePlayer(player)) {
//                this.updatePoints(player);
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onUpdate(@Nonnull PlayerPickupItemEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.updatePoints(event.getPlayer());
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onUpdate(@Nonnull PlayerDropItemEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.updatePoints(event.getPlayer());
//          }
//       }
//    }
// }
//
