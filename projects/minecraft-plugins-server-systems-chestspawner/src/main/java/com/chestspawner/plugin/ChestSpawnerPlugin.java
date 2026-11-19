package com.chestspawner.plugin;

import org.bukkit.*;
import org.bukkit.block.*;
import org.bukkit.configuration.ConfigurationSection;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.entity.Player;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitRunnable;

import java.util.*;
import java.util.logging.Level;

public class ChestSpawnerPlugin extends JavaPlugin {

    private String targetWorldName;
    private List<LootItem> lootItems;
    private final Random random = new Random();

    @Override
    public void onEnable() {
        saveDefaultConfig();
        reloadConfig();
        loadConfig();
        getServer().getScheduler().runTaskTimer(this, this::checkPlayers, 0, 200); // Every 10 seconds
    }

    private void loadConfig() {
        FileConfiguration config = getConfig();
        targetWorldName = config.getString("world", "world");
        lootItems = new ArrayList<>();

        ConfigurationSection itemsSection = config.getConfigurationSection("items");
        if (itemsSection != null) {
            for (String key : itemsSection.getKeys(false)) {
                ConfigurationSection itemSection = itemsSection.getConfigurationSection(key);
                if (itemSection != null) {
                    Material material = Material.matchMaterial(itemSection.getString("material", "STONE"));
                    int min = itemSection.getInt("min_amount", 1);
                    int max = itemSection.getInt("max_amount", 1);
                    double chance = itemSection.getDouble("chance", 1.0);

                    if (material != null && min > 0 && max >= min && chance > 0) {
                        lootItems.add(new LootItem(material, min, max, chance));
                    }
                }
            }
        }

        if (lootItems.isEmpty()) {
            getLogger().warning("No valid loot items found in config! Using default items.");
            lootItems.add(new LootItem(Material.DIAMOND, 1, 1, 0.5));
            lootItems.add(new LootItem(Material.IRON_INGOT, 1, 3, 0.8));
        }
    }

   private void checkPlayers() {
    World world = Bukkit.getWorld(targetWorldName);
    if (world == null) return;

    List<Player> players = world.getPlayers();
    Set<Chunk> chunksToProcess = new HashSet<>();

    // Check each player to see if they are alone
    for (Player player : players) {
        Chunk currentChunk = player.getLocation().getChunk();
        boolean isAlone = true;

        // Check against all other players
        for (Player other : players) {
            if (player == other) continue; // Skip self

            Chunk otherChunk = other.getLocation().getChunk();
            if (isWithinChunkDistance(currentChunk, otherChunk, 2)) {
                isAlone = false;
                break; // No need to check further
            }
        }

        if (isAlone) {
            chunksToProcess.add(currentChunk);
        }
    }

    // Process chunks where players are alone
    for (Chunk chunk : chunksToProcess) {
        trySpawnChest(chunk);
    }
}
    private boolean isWithinChunkDistance(Chunk c1, Chunk c2, int distance) {
        return Math.abs(c1.getX() - c2.getX()) <= distance && 
               Math.abs(c1.getZ() - c2.getZ()) <= distance;
    }

    private void trySpawnChest(Chunk chunk) {
        World world = chunk.getWorld();
        
        for (int attempt = 0; attempt < 10; attempt++) {
            int relX = random.nextInt(16);
            int relZ = random.nextInt(16);
            
            int worldX = chunk.getX() * 16 + relX;
            int worldZ = chunk.getZ() * 16 + relZ;
            int y = world.getHighestBlockYAt(worldX, worldZ);
            
            Block surfaceBlock = world.getBlockAt(worldX, y, worldZ);
            Block chestBlock = world.getBlockAt(worldX, y + 1, worldZ);

            if (isValidSurface(surfaceBlock) && chestBlock.getType() == Material.AIR) {
                chestBlock.setType(Material.CHEST);
                generateLoot(chestBlock);
                return;
            }
        }
    }

    private boolean isValidSurface(Block block) {
        Material type = block.getType();
        return type.isSolid() && 
               !type.toString().endsWith("_LEAVES") &&
               type != Material.LAVA &&
               type != Material.WATER;
    }

    private void generateLoot(Block chestBlock) {
        if (!(chestBlock.getState() instanceof Chest chest)) return;

        Inventory inv = chest.getBlockInventory();
        inv.clear();
        
        int itemsToAdd = random.nextInt(4) + 1; // 1-4 items
        
        for (int i = 0; i < itemsToAdd; i++) {
            LootItem item = getRandomItem();
            if (item != null) {
                int amount = random.nextInt(item.maxAmount - item.minAmount + 1) + item.minAmount;
                inv.setItem(random.nextInt(inv.getSize()), new ItemStack(item.material, amount));
            }
        }
    }

    private LootItem getRandomItem() {
        List<LootItem> possible = new ArrayList<>();
        for (LootItem item : lootItems) {
            if (random.nextDouble() <= item.chance) {
                possible.add(item);
            }
        }
        return possible.isEmpty() ? null : possible.get(random.nextInt(possible.size()));
    }

    private static class LootItem {
        final Material material;
        final int minAmount;
        final int maxAmount;
        final double chance;

        LootItem(Material material, int minAmount, int maxAmount, double chance) {
            this.material = material;
            this.minAmount = minAmount;
            this.maxAmount = maxAmount;
            this.chance = chance;
        }
    }
}