// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/material/BlockMaterialSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/material/BlockMaterialSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/material/BlockMaterialSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.material;
//
// import java.util.Arrays;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.spigot.events.PlayerInventoryClickEvent;
// import net.codingarea.challenges.plugin.spigot.events.PlayerPickupItemEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerInteractEvent;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.ItemStack;
// import org.jetbrains.annotations.NotNull;
//
// public class BlockMaterialSetting extends Setting {
//    private final String name;
//    private final ItemBuilder preset;
//    private final Object[] replacements;
//    private final Material[] materials;
//
//    public BlockMaterialSetting(@Nonnull String name, @Nonnull ItemBuilder preset, @Nonnull Object[] replacements, @Nonnull Material... materials) {
//       super(MenuType.ITEMS, true);
//       this.name = name;
//       this.preset = preset;
//       this.replacements = replacements;
//       this.materials = materials;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return this.preset.clone().applyFormat(Message.forName(this.name).asItemDescription(this.replacements));
//    }
//
//    private boolean blockMaterial(Material material) {
//       return Arrays.asList(this.materials).contains(material);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onPlayerInteract(@Nonnull PlayerInteractEvent event) {
//       if (!this.isEnabled()) {
//          if (!ChallengeAPI.isWorldInUse()) {
//             if (!ignorePlayer(event.getPlayer())) {
//                if (!this.blockMaterial(event.getMaterial())) {
//                   if (event.getClickedBlock() != null) {
//                      if (this.blockMaterial(event.getClickedBlock().getType())) {
//                         event.setCancelled(true);
//                      }
//                   }
//                } else {
//                   event.setCancelled(true);
//                   this.dropMaterial(event.getPlayer().getLocation(), event.getPlayer().getInventory());
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onPlayerInventoryClick(@Nonnull PlayerInventoryClickEvent event) {
//       if (!this.isEnabled()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (!ChallengeAPI.isWorldInUse()) {
//                if (event.getCurrentItem() != null) {
//                   if (event.getClickedInventory() != null) {
//                      if (event.getClickedInventory().getHolder() == event.getPlayer()) {
//                         if (this.blockMaterial(event.getCurrentItem().getType())) {
//                            event.setCancelled(true);
//                            this.dropMaterial(event.getPlayer().getLocation(), event.getClickedInventory());
//                         }
//                      }
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerPickupItem(@Nonnull PlayerPickupItemEvent event) {
//       if (!this.isEnabled()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (!ChallengeAPI.isWorldInUse()) {
//                if (this.blockMaterial(event.getItem().getItemStack().getType())) {
//                   event.setCancelled(true);
//                }
//             }
//          }
//       }
//    }
//
//    public void dropMaterial(@Nonnull Location location, @Nonnull Inventory inventory) {
//       for(int slot = 0; slot < inventory.getSize(); ++slot) {
//          ItemStack item = inventory.getItem(slot);
//          if (item != null && this.blockMaterial(item.getType())) {
//             InventoryUtils.dropItemByPlayer(location, item);
//             inventory.setItem(slot, (ItemStack)null);
//          }
//       }
//
//    }
//
//    @NotNull
//    public String getUniqueName() {
//       return "blockmaterial" + this.materials[0].name().toLowerCase();
//    }
// }
//
