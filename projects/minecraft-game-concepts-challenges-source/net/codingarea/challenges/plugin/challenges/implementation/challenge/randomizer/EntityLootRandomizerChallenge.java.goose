// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/randomizer/EntityLootRandomizerChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/randomizer/EntityLootRandomizerChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/randomizer/EntityLootRandomizerChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Collection;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
// import java.util.Objects;
// import java.util.Optional;
// import java.util.Map.Entry;
// import java.util.stream.Collectors;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.RandomizerSetting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
// import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.ListBuilder;
// import net.codingarea.challenges.plugin.utils.misc.Utils;
// import org.bukkit.Material;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDeathEvent;
// import org.bukkit.loot.LootTable;
// import org.bukkit.loot.LootTables;
// import org.bukkit.loot.LootContext.Builder;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.2.0")
// public class EntityLootRandomizerChallenge extends RandomizerSetting implements SenderCommand, Completer {
//    protected Map randomization;
//
//    public EntityLootRandomizerChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.RANDOMIZER);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.FURNACE_MINECART, Message.forName("item-entity-loot-randomizer-challenge"));
//    }
//
//    protected void reloadRandomization() {
//       this.randomization = new HashMap();
//       List from = new ArrayList(Arrays.asList(EntityType.values()));
//       from.removeIf((entityTypex) -> {
//          return !this.getLootableEntities().contains(entityTypex);
//       });
//       this.random.shuffle(from);
//       from.removeIf(Objects::isNull);
//       List entityTypesToRemove = new ArrayList();
//       List to = (List)from.stream().map((entityTypex) -> {
//          if (entityTypex == null) {
//             return null;
//          } else {
//             try {
//                return LootTables.valueOf(entityTypex.name()).getLootTable();
//             } catch (IllegalArgumentException var3) {
//                entityTypesToRemove.add(entityTypex);
//                return null;
//             }
//          }
//       }).filter(Objects::nonNull).collect(Collectors.toList());
//       from.removeAll(entityTypesToRemove);
//       this.random.shuffle(to);
//
//       while(!from.isEmpty()) {
//          EntityType entityType = (EntityType)from.remove(0);
//          LootTable lootTable = (LootTable)to.remove(0);
//          this.randomization.put(entityType, lootTable);
//       }
//
//    }
//
//    public List getLootableEntities() {
//       return (new ListBuilder(EntityType.values())).removeIf((type) -> {
//          return !type.isSpawnable();
//       }).removeIf((type) -> {
//          return !type.isAlive();
//       }).remove(EntityType.ENDER_DRAGON).remove(EntityType.GIANT).remove(EntityType.ILLUSIONER).remove(EntityType.ZOMBIE_HORSE).build();
//    }
//
//    protected void onDisable() {
//       this.randomization.clear();
//    }
//
//    @EventHandler(
//       priority = EventPriority.NORMAL,
//       ignoreCancelled = true
//    )
//    public void onEntityDeath(EntityDeathEvent event) {
//       if (this.isEnabled()) {
//          LivingEntity entity = event.getEntity();
//          if (this.getLootableEntities().contains(entity.getType())) {
//             event.getDrops().clear();
//             if (this.randomization.containsKey(entity.getType())) {
//                LootTable lootTable = (LootTable)this.randomization.get(entity.getType());
//                Builder builder = (new Builder(entity.getLocation())).lootedEntity(entity);
//                if (entity.getKiller() == null) {
//                   builder.lootingModifier(0);
//                } else {
//                   builder.killer(entity.getKiller());
//                }
//
//                Collection newDrops = lootTable.populateLoot(this.random.asRandom(), builder.build());
//                event.getDrops().addAll(newDrops);
//             }
//          }
//       }
//    }
//
//    public LootTable getLootTableForEntity(EntityType entityType) {
//       return (LootTable)this.randomization.get(entityType);
//    }
//
//    public Optional getEntityForLootTable(LootTable lootTable) {
//       return this.randomization.entrySet().stream().filter((entry) -> {
//          return ((LootTable)entry.getValue()).equals(lootTable);
//       }).map(Entry::getKey).findFirst();
//    }
//
//    public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
//       if (!this.isEnabled()) {
//          Message.forName("command-searchloot-disabled").send(sender, Prefix.CHALLENGES);
//       } else if (args.length == 0) {
//          Message.forName("syntax").send(sender, Prefix.CHALLENGES, "searchloot <entity>");
//       } else {
//          String input = String.join("_", args).toUpperCase();
//          EntityType entityType = Utils.getEntityType(input);
//          if (entityType == null) {
//             Message.forName("no-such-entity").send(sender, Prefix.CHALLENGES);
//          } else if (!entityType.isAlive()) {
//             Message.forName("not-alive").send(sender, Prefix.CHALLENGES, entityType);
//          } else {
//             LootTable givenLootTable;
//             try {
//                givenLootTable = LootTables.valueOf(entityType.name()).getLootTable();
//             } catch (IllegalArgumentException var8) {
//                Message.forName("no-loot").send(sender, Prefix.CHALLENGES, entityType);
//                return;
//             }
//
//             Optional optionalEntity = this.getEntityForLootTable(givenLootTable);
//             LootTable droppedLootTable = this.getLootTableForEntity(entityType);
//             if (optionalEntity.isPresent()) {
//                Message.forName("command-searchloot-result").send(sender, Prefix.CHALLENGES, entityType, droppedLootTable, optionalEntity.get());
//             } else {
//                Message.forName("command-searchloot-nothing").send(sender, Prefix.CHALLENGES, entityType);
//             }
//
//          }
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
//       EntityLootRandomizerChallenge instance = (EntityLootRandomizerChallenge)AbstractChallenge.getFirstInstance(EntityLootRandomizerChallenge.class);
//       return args.length != 1 ? null : (List)instance.getLootableEntities().stream().map((material) -> {
//          return material.name().toLowerCase();
//       }).collect(Collectors.toList());
//    }
// }
//
