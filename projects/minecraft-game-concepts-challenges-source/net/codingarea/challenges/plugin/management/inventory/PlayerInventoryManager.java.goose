// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/inventory/PlayerInventoryManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/inventory/PlayerInventoryManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/inventory/PlayerInventoryManager.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.inventory;
//
// import java.util.Collection;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.Objects;
// import java.util.function.Consumer;
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.collection.pair.Triple;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.FileDocument;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.loader.LanguageLoader;
// import net.codingarea.challenges.plugin.management.scheduler.task.TimerTask;
// import net.codingarea.challenges.plugin.management.scheduler.timer.TimerStatus;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.GameMode;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerCommandSendEvent;
// import org.bukkit.event.player.PlayerDropItemEvent;
// import org.bukkit.event.player.PlayerGameModeChangeEvent;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
// import org.bukkit.event.player.PlayerRespawnEvent;
// import org.bukkit.inventory.ItemStack;
//
// public final class PlayerInventoryManager implements Listener {
//    private final List hotbarItems;
//
//    public PlayerInventoryManager() {
//       Challenges.getInstance().registerListener(new Listener[]{this});
//       ChallengeAPI.registerScheduler(this);
//       ChallengeAPI.subscribeLoader(LanguageLoader.class, () -> {
//          Collection var10000 = Bukkit.getOnlinePlayers();
//          PlayerInventoryManager var10001 = Challenges.getInstance().getPlayerInventoryManager();
//          Objects.requireNonNull(var10001);
//          var10000.forEach(var10001::updateInventoryAuto);
//       });
//       this.hotbarItems = new LinkedList();
//       this.loadItems();
//    }
//
//    public void loadItems() {
//       FileDocument config = Challenges.getInstance().getConfig("hotbar-items.yml");
//       this.loadItem(config.getDocument("timer"), "item-menu-timer", "challenges.timer", (p) -> {
//          p.performCommand("timer");
//       });
//       this.loadItem(config.getDocument("challenges"), "item-menu-challenges", "challenges.gui", (p) -> {
//          p.performCommand("challenges");
//       });
//       this.loadItem(config.getDocument("start"), "item-menu-start", "challenges.timer", (p) -> {
//          p.performCommand("start");
//       });
//       this.loadItem(config.getDocument("leaderboard"), "item-menu-leaderboard", (String)null, (p) -> {
//          p.performCommand("leaderboard");
//       });
//       this.loadItem(config.getDocument("stats"), "item-menu-stats", (String)null, (p) -> {
//          p.performCommand("stats");
//       });
//    }
//
//    public void loadItem(Document config, String message, String permission, Consumer action) {
//       if (config.getBoolean("enabled", false)) {
//          int slot = config.getInt("slot", 0);
//          Material material = (Material)config.getEnum("material", Material.BARRIER);
//          PlayerInventoryManager.HotbarItem item = new PlayerInventoryManager.HotbarItem(slot, message, material, action, permission);
//          this.hotbarItems.add(item);
//       }
//    }
//
//    public void handleDisable() {
//       Bukkit.getOnlinePlayers().forEach(this::removeItems);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onCommandsUpdate(@Nonnull PlayerCommandSendEvent event) {
//       this.updateInventoryAuto(event.getPlayer());
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onJoin(@Nonnull PlayerJoinEvent event) {
//       this.updateInventoryJoin(event.getPlayer(), true);
//    }
//
//    @EventHandler
//    public void onQuit(@Nonnull PlayerQuitEvent event) {
//       this.removeItems(event.getPlayer());
//    }
//
//    @EventHandler(
//       ignoreCancelled = true,
//       priority = EventPriority.MONITOR
//    )
//    public void onGameModeChange(@Nonnull PlayerGameModeChangeEvent event) {
//       this.updateInventoryGamemode(event.getPlayer(), event.getNewGameMode());
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onDrop(@Nonnull PlayerDropItemEvent event) {
//       if (!ChallengeAPI.isStarted()) {
//          if (this.hasItems(event.getPlayer())) {
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onRespawn(@Nonnull PlayerRespawnEvent event) {
//       this.updateInventoryAlive(event.getPlayer(), true);
//    }
//
//    @EventHandler
//    public void onInteract(@Nonnull PlayerInteractEvent event) {
//       switch(event.getAction()) {
//       case LEFT_CLICK_AIR:
//       case LEFT_CLICK_BLOCK:
//       case PHYSICAL:
//          return;
//       default:
//          if (!ChallengeAPI.isStarted()) {
//             if (this.hasItems(event.getPlayer())) {
//                Triple[] pairs = this.createItemPairs(event.getPlayer());
//                int slot = event.getPlayer().getInventory().getHeldItemSlot();
//                if (slot < pairs.length) {
//                   Triple pair = pairs[slot];
//                   if (pair != null) {
//                      if (pair.getThird() == null || event.getPlayer().hasPermission((String)pair.getThird())) {
//                         Consumer action = (Consumer)pair.getSecond();
//                         if (action != null) {
//                            action.accept(event.getPlayer());
//                            SoundSample.PLOP.play(event.getPlayer());
//                         }
//                      }
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    @TimerTask(
//       status = {TimerStatus.PAUSED, TimerStatus.RUNNING}
//    )
//    public void updateInventories() {
//       Bukkit.getOnlinePlayers().forEach(this::updateInventoryAuto);
//    }
//
//    public void updateInventoryAuto(@Nonnull Player player) {
//       this.updateInventory(player, player.getGameMode(), false, !player.isDead());
//    }
//
//    public void updateInventoryAlive(@Nonnull Player player, boolean alive) {
//       this.updateInventory(player, player.getGameMode(), false, alive);
//    }
//
//    public void updateInventoryGamemode(@Nonnull Player player, @Nonnull GameMode gamemode) {
//       this.updateInventory(player, gamemode, false, !player.isDead());
//    }
//
//    public void updateInventoryJoin(@Nonnull Player player, boolean join) {
//       this.updateInventory(player, player.getGameMode(), join, !player.isDead());
//    }
//
//    public void updateInventory(@Nonnull Player player, @Nonnull GameMode gamemode, boolean join, boolean alive) {
//       if (Bukkit.isPrimaryThread()) {
//          Challenges.getInstance().runAsync(() -> {
//             this.updateInventory(player, gamemode, join, alive);
//          });
//       } else {
//          try {
//             if (!LanguageLoader.isLoaded()) {
//                return;
//             }
//
//             if (ChallengeAPI.isPaused()) {
//                this.updateInventoryPaused(player, gamemode, join, alive);
//             } else {
//                this.updateInventoryStarted(player, gamemode, join, alive);
//             }
//          } catch (Exception var6) {
//             Logger.error("Failed to update inventory", var6);
//          }
//
//       }
//    }
//
//    private void updateInventoryStarted(@Nonnull Player player, @Nonnull GameMode gamemode, boolean join, boolean alive) {
//       this.removeItems(player);
//    }
//
//    private void updateInventoryPaused(@Nonnull Player player, @Nonnull GameMode gamemode, boolean join, boolean alive) {
//       if (gamemode != GameMode.CREATIVE && gamemode != GameMode.SPECTATOR) {
//          if (this.canGiveItems(player)) {
//             if (!alive) {
//                return;
//             }
//
//             this.giveItems(player);
//             if (join) {
//                player.getInventory().setHeldItemSlot(4);
//             }
//          }
//
//       } else {
//          this.removeItems(player);
//       }
//    }
//
//    private boolean hasItems(@Nonnull Player player) {
//       Triple[] pairs = this.createItemPairs(player);
//
//       for(int i = 0; i < pairs.length; ++i) {
//          Triple pair = pairs[i];
//          ItemStack expected = pair == null ? null : (ItemStack)pair.getFirst();
//          ItemStack found = player.getInventory().getItem(i);
//          if (pair == null || pair.getThird() == null || player.hasPermission((String)pair.getThird())) {
//             if (expected != null && found == null) {
//                return false;
//             }
//
//             if (expected != null && expected.getType() != found.getType()) {
//                return false;
//             }
//          }
//       }
//
//       return true;
//    }
//
//    private boolean canGiveItems(@Nonnull Player player) {
//       Triple[] pairs = this.createItemPairs(player);
//
//       for(int i = 0; i < pairs.length; ++i) {
//          Triple pair = pairs[i];
//          ItemStack expected = pair == null ? null : (ItemStack)pair.getFirst();
//          ItemStack found = player.getInventory().getItem(i);
//          if (expected == null && found != null) {
//             return false;
//          }
//
//          if (expected != null && found != null && expected.getType() != found.getType()) {
//             return false;
//          }
//       }
//
//       return true;
//    }
//
//    private void removeItems(@Nonnull Player player) {
//       Triple[] pairs = this.createItemPairs(player);
//       Triple[] var3 = pairs;
//       int var4 = pairs.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          Triple pair = var3[var5];
//          if (pair != null) {
//             ItemStack item = (ItemStack)pair.getFirst();
//             if (item != null && item.getItemMeta() != null) {
//                ItemStack[] content = player.getInventory().getContents();
//
//                for(int i = 0; i < content.length; ++i) {
//                   ItemStack current = content[i];
//                   if (current != null && current.getType() == item.getType() && current.getItemMeta() != null && current.getItemMeta().getDisplayName().equals(item.getItemMeta().getDisplayName())) {
//                      player.getInventory().setItem(i, (ItemStack)null);
//                   }
//                }
//             }
//          }
//       }
//
//    }
//
//    private void giveItems(@Nonnull Player player) {
//       Triple[] pairs = this.createItemPairs(player);
//
//       for(int i = 0; i < pairs.length; ++i) {
//          Triple pair = pairs[i];
//          if (pair != null && (pair.getThird() == null || player.hasPermission((String)pair.getThird()))) {
//             player.getInventory().setItem(i, (ItemStack)pair.getFirst());
//          }
//       }
//
//    }
//
//    @Nonnull
//    private Triple[] createItemPairs(@Nonnull Player player) {
//       Triple[] pairs = new Triple[9];
//
//       PlayerInventoryManager.HotbarItem item;
//       ItemStack stack;
//       for(Iterator var3 = this.hotbarItems.iterator(); var3.hasNext(); pairs[item.getSlot()] = new Triple(stack, item.getAction(), item.getPermission())) {
//          item = (PlayerInventoryManager.HotbarItem)var3.next();
//          if (item.getMaterial() == Material.PLAYER_HEAD) {
//             stack = (new ItemBuilder.SkullBuilder(player.getUniqueId(), player.getName(), Message.forName(item.getMessage()).asString(), new String[0])).build();
//          } else {
//             stack = (new ItemBuilder(item.getMaterial(), Message.forName(item.getMessage()).asString())).build();
//          }
//       }
//
//       return pairs;
//    }
//
//    public static class HotbarItem {
//       private final int slot;
//       private final String message;
//       private final Material material;
//       private final Consumer action;
//       private final String permission;
//
//       public HotbarItem(int slot, String message, Material material, Consumer action, String permission) {
//          this.slot = slot;
//          this.message = message;
//          this.material = material;
//          this.action = action;
//          this.permission = permission;
//       }
//
//       @Generated
//       public int getSlot() {
//          return this.slot;
//       }
//
//       @Generated
//       public String getMessage() {
//          return this.message;
//       }
//
//       @Generated
//       public Material getMaterial() {
//          return this.material;
//       }
//
//       @Generated
//       public Consumer getAction() {
//          return this.action;
//       }
//
//       @Generated
//       public String getPermission() {
//          return this.permission;
//       }
//    }
// }
//
