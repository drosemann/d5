// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/BlockMobsChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/BlockMobsChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/BlockMobsChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import java.util.Collection;
// import java.util.Iterator;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.impl.RandomMobAction;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.block.BlockBreakEvent;
// import org.bukkit.event.block.BlockExplodeEvent;
// import org.bukkit.event.entity.EntityExplodeEvent;
// import org.bukkit.inventory.EntityEquipment;
// import org.bukkit.inventory.EquipmentSlot;
// import org.bukkit.inventory.ItemStack;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.3")
// public class BlockMobsChallenge extends Setting {
//    public BlockMobsChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BRICKS, Message.forName("item-block-mob-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onBlockBreak(BlockBreakEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             EntityType type = (EntityType)globalRandom.choose((Object[])RandomMobAction.getLivingMobs());
//             LivingEntity entity = (LivingEntity)event.getBlock().getWorld().spawnEntity(event.getBlock().getLocation().add(0.5D, 0.0D, 0.5D), type);
//             Collection drops = event.getBlock().getDrops(event.getPlayer().getEquipment().getItemInMainHand());
//             int i = 0;
//
//             for(Iterator var6 = drops.iterator(); var6.hasNext(); ++i) {
//                ItemStack drop = (ItemStack)var6.next();
//                EquipmentSlot slot = EquipmentSlot.HEAD;
//                EntityEquipment equipment = entity.getEquipment();
//                switch(i) {
//                case 0:
//                   equipment.setHelmetDropChance(1.0F);
//                   break;
//                case 1:
//                   slot = EquipmentSlot.CHEST;
//                   equipment.setChestplateDropChance(1.0F);
//                   break;
//                case 2:
//                   slot = EquipmentSlot.LEGS;
//                   equipment.setLeggingsDropChance(1.0F);
//                   break;
//                case 3:
//                   slot = EquipmentSlot.FEET;
//                   equipment.setBootsDropChance(1.0F);
//                   break;
//                case 4:
//                   slot = EquipmentSlot.HAND;
//                   equipment.setItemInMainHandDropChance(1.0F);
//                   break;
//                case 5:
//                   slot = EquipmentSlot.OFF_HAND;
//                   equipment.setItemInOffHandDropChance(1.0F);
//                }
//
//                equipment.setItem(slot, drop);
//             }
//
//             event.setDropItems(false);
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onEntityExplosion(EntityExplodeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          Iterator var2 = event.blockList().iterator();
//
//          while(var2.hasNext()) {
//             Block block = (Block)var2.next();
//             block.setType(Material.AIR);
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onBlockExplosion(BlockExplodeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          Iterator var2 = event.blockList().iterator();
//
//          while(var2.hasNext()) {
//             Block block = (Block)var2.next();
//             block.setType(Material.AIR);
//          }
//
//       }
//    }
// }
//
