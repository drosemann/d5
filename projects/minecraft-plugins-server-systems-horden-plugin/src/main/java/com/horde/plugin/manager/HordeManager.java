package de.hordeplugin.manager;

import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.configuration.ConfigurationSection;
import org.bukkit.Location;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Zombie;
import org.bukkit.entity.Skeleton;
import org.bukkit.entity.Husk;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.ItemStack;
import org.bukkit.Material;
import org.bukkit.Color;
import org.bukkit.DyeColor;
import org.bukkit.inventory.meta.LeatherArmorMeta;
import org.bukkit.entity.EntityType;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;
import org.bukkit.ChatColor;
import java.util.*;

import de.hordeplugin.HordePlugin;
import de.hordeplugin.data.HordeDefinition;

/**
 * HordeManager - Verwaltet das Spawning und die Logik von Horden
 */
public class HordeManager {

    private final JavaPlugin plugin;
    private final Map<String, HordeDefinition> hordes = new HashMap<>();
    private HordeDefinition activeHorde = null;
    private Location spawnLocation = null;
    private int currentWaveNumber = 0;
    private int currentSpawnedMobs = 0;
    private boolean isActive = false;
    private int mainTaskId = -1;
    private int waveTaskId = -1;
    private Random random = new Random();

    public HordeManager(JavaPlugin plugin) {
        this.plugin = plugin;
        loadHordedefinitions();
    }

    /**
     * Lädt alle Horden-Definitionen aus der Config
     */
    private void loadHordedefinitions() {
        FileConfiguration config = plugin.getConfig();
        ConfigurationSection hordesSection = config.getConfigurationSection("hordes");

        if (hordesSection == null) {
            plugin.getLogger().warning("Keine Horden in der Konfiguration definiert!");
            return;
        }

        for (String hordeName : hordesSection.getKeys(false)) {
            ConfigurationSection hordeSection = hordesSection.getConfigurationSection(hordeName);
            if (hordeSection != null) {
                HordeDefinition horde = new HordeDefinition(hordeSection);
                hordes.put(hordeName.toLowerCase(), horde);
                plugin.getLogger().info("✓ Horde geladen: " + hordeName);
            }
        }
    }

    /**
     * Startet eine Horde an einem Ort
     */
    public void startHorde(String hordeName, Location location) {
        if (isActive) {
            plugin.getLogger().warning("Eine Horde ist bereits aktiv!");
            return;
        }

        HordeDefinition horde = hordes.get(hordeName.toLowerCase());
        if (horde == null) {
            plugin.getLogger().warning("Horde nicht gefunden: " + hordeName);
            return;
        }

        this.activeHorde = horde;
        this.spawnLocation = location;
        this.currentWaveNumber = 0;
        this.currentSpawnedMobs = 0;
        this.isActive = true;

        // Zufällige Dauer zwischen min und max
        int durationSeconds = horde.getMinDurationSeconds() + 
                              random.nextInt(horde.getMaxDurationSeconds() - horde.getMinDurationSeconds());

        // Broadcast
        broadcastToAllPlayers(ChatColor.GOLD + "═══════════════════════════════════════");
        broadcastToAllPlayers(ChatColor.RED + "⚠ " + ChatColor.GOLD + horde.getDisplayName() + ChatColor.RED + " ⚠");
        broadcastToAllPlayers(ChatColor.GRAY + "Dauer: " + (durationSeconds / 60) + " Minuten");
        broadcastToAllPlayers(ChatColor.GOLD + "═══════════════════════════════════════");

        // Haupttimer - Startet erste Welle nach 5 Sekunden
        mainTaskId = Bukkit.getScheduler().scheduleSyncRepeatingTask(plugin, () -> {
            if (currentWaveNumber == 0) {
                startNextWave();
            }
        }, 5 * 20, durationSeconds * 20); // 5 Sekunden Verzögerung, dann laufen lassen

        // Beende Horde nach Zeitlimit
        Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, this::stopHorde, 
            (durationSeconds + 10) * 20);
    }

    /**
     * Startet die nächste Welle
     */
    private void startNextWave() {
        if (!isActive || activeHorde == null) return;

        List<HordeDefinition.WaveDefinition> waves = activeHorde.getWaves();
        if (waves.isEmpty()) {
            plugin.getLogger().warning("Keine Wellen definiert!");
            return;
        }

        // Zyklisch durch Wellen iterieren
        int waveIndex = currentWaveNumber % waves.size();
        HordeDefinition.WaveDefinition wave = waves.get(waveIndex);
        currentWaveNumber++;

        plugin.getLogger().info("Starte Welle " + currentWaveNumber);

        // Spawne Mobs mit Verzögerung
        for (int i = 0; i < wave.getMobCount(); i++) {
            int delayTicks = i * 2; // 0.1 Sekunden zwischen jedem Mob
            Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
                spawnMobWithEquipment(wave);
            }, delayTicks);
        }

        // Nächste Welle nach Verzögerung
        int delayTicks = wave.getSpawnDelaySeconds() * 20;
        Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, this::startNextWave, delayTicks);
    }

    /**
     * Spawnt einen Mob mit Custom-Ausrüstung
     */
    private void spawnMobWithEquipment(HordeDefinition.WaveDefinition wave) {
        if (spawnLocation == null) return;

        // Zufällige Position im Umkreis
        Location spawnLoc = spawnLocation.clone();
        spawnLoc.add(
            (random.nextDouble() - 0.5) * 20,
            0,
            (random.nextDouble() - 0.5) * 20
        );

        LivingEntity mob = (LivingEntity) spawnLocation.getWorld().spawnEntity(spawnLoc, wave.getMobType());
        currentSpawnedMobs++;

        // Ausrüstung anziehen
        equipMobWithArmor(mob, wave);

        // Ziel auf Spieler setzen (wenn vorhanden)
        List<Player> players = new java.util.ArrayList<>(spawnLocation.getWorld().getPlayers());
        if (!players.isEmpty()) {
            if (mob instanceof Zombie) {
                ((Zombie) mob).setTarget(players.get(random.nextInt(players.size())));
            }
            if (mob instanceof Skeleton) {
                ((Skeleton) mob).setTarget(players.get(random.nextInt(players.size())));
            }
        }
    }

    /**
     * Rüstet einen Mob mit Custom-Ausrüstung aus
     */
    private void equipMobWithArmor(LivingEntity mob, HordeDefinition.WaveDefinition wave) {
        EntityEquipment equipment = mob.getEquipment();
        if (equipment == null) return;

        String armorType = wave.getArmorType().toUpperCase();
        String armorColor = wave.getArmorColor().toUpperCase();

        // Gold-Rüstung für Skelette (Verfluchter Kreuzzug)
        if (armorType.equals("GOLD")) {
            equipment.setHelmet(new ItemStack(Material.GOLDEN_HELMET));
            equipment.setChestplate(new ItemStack(Material.GOLDEN_CHESTPLATE));
            equipment.setLeggings(new ItemStack(Material.GOLDEN_LEGGINGS));
            equipment.setBoots(new ItemStack(Material.GOLDEN_BOOTS));
            equipment.setHelmetDropChance(0.0f);
            equipment.setChestplateDropChance(0.0f);
            equipment.setLeggingsDropChance(0.0f);
            equipment.setBootsDropChance(0.0f);
        }
        // Blaue Leder-Rüstung für Tiefen-Horde
        else if (armorType.equals("LEATHER")) {
            ItemStack helmet = new ItemStack(Material.LEATHER_HELMET);
            ItemStack chestplate = new ItemStack(Material.LEATHER_CHESTPLATE);
            ItemStack leggings = new ItemStack(Material.LEATHER_LEGGINGS);
            ItemStack boots = new ItemStack(Material.LEATHER_BOOTS);

            // Farbe anwenden (Blau für Tiefen-Horde)
            if (armorColor.equals("BLUE")) {
                Color blue = Color.fromBGR(0, 0, 255);
                applyLeatherColor(helmet, blue);
                applyLeatherColor(chestplate, blue);
                applyLeatherColor(leggings, blue);
                applyLeatherColor(boots, blue);
            } else if (armorColor.equals("ORANGE")) {
                Color orange = Color.fromBGR(0, 165, 255);
                applyLeatherColor(helmet, orange);
                applyLeatherColor(chestplate, orange);
                applyLeatherColor(leggings, orange);
                applyLeatherColor(boots, orange);
            }

            equipment.setHelmet(helmet);
            equipment.setChestplate(chestplate);
            equipment.setLeggings(leggings);
            equipment.setBoots(boots);
            equipment.setHelmetDropChance(0.0f);
            equipment.setChestplateDropChance(0.0f);
            equipment.setLeggingsDropChance(0.0f);
            equipment.setBootsDropChance(0.0f);
        }
        // Eisen-Rüstung für Wüsten-Plage
        else if (armorType.equals("IRON")) {
            equipment.setHelmet(new ItemStack(Material.IRON_HELMET));
            equipment.setChestplate(new ItemStack(Material.IRON_CHESTPLATE));
            equipment.setLeggings(new ItemStack(Material.IRON_LEGGINGS));
            equipment.setBoots(new ItemStack(Material.IRON_BOOTS));
            equipment.setHelmetDropChance(0.0f);
            equipment.setChestplateDropChance(0.0f);
            equipment.setLeggingsDropChance(0.0f);
            equipment.setBootsDropChance(0.0f);

            // Eisen-Schwert
            equipment.setItemInMainHand(new ItemStack(Material.IRON_SWORD));
            equipment.setItemInMainHandDropChance(0.0f);
        }
    }

    /**
     * Wendet eine Farbe auf Leder-Rüstung an
     */
    private void applyLeatherColor(ItemStack item, Color color) {
        LeatherArmorMeta meta = (LeatherArmorMeta) item.getItemMeta();
        if (meta != null) {
            meta.setColor(color);
            item.setItemMeta(meta);
        }
    }

    /**
     * Stoppt die aktive Horde
     */
    public void stopHorde() {
        if (!isActive) return;

        isActive = false;
        if (mainTaskId != -1) {
            Bukkit.getScheduler().cancelTask(mainTaskId);
        }
        if (waveTaskId != -1) {
            Bukkit.getScheduler().cancelTask(waveTaskId);
        }

        broadcastToAllPlayers(ChatColor.GOLD + "═══════════════════════════════════════");
        broadcastToAllPlayers(ChatColor.GREEN + "✓ Horde beendet!");
        broadcastToAllPlayers(ChatColor.GRAY + "Wellen: " + currentWaveNumber);
        broadcastToAllPlayers(ChatColor.GOLD + "═══════════════════════════════════════");

        // Cleanup
        activeHorde = null;
        spawnLocation = null;
        currentWaveNumber = 0;
        currentSpawnedMobs = 0;
    }

    /**
     * Reduziert Mob-Zähler bei Tod
     */
    public void reduceMobCount() {
        if (currentSpawnedMobs > 0) {
            currentSpawnedMobs--;
        }
    }

    /**
     * Sendet eine Nachricht an alle Spieler
     */
    private void broadcastToAllPlayers(String message) {
        Bukkit.broadcastMessage(message);
    }

    /**
     * Listet alle verfügbaren Horden auf
     */
    public void listHordes(Player player) {
        player.sendMessage(ChatColor.GOLD + "═══════ Verfügbare Horden ═══════");
        if (hordes.isEmpty()) {
            player.sendMessage(ChatColor.RED + "Keine Horden definiert!");
        } else {
            for (HordeDefinition horde : hordes.values()) {
                player.sendMessage(ChatColor.YELLOW + "• " + horde.getName() + ChatColor.GRAY + 
                    " - " + horde.getDisplayName() + " (" + horde.getWaves().size() + " Wellen)");
            }
        }
    }

    // Getter
    public boolean isHordeActive() {
        return isActive;
    }

    public int getSpawnedMobCount() {
        return currentSpawnedMobs;
    }

    public int getCurrentWave() {
        return currentWaveNumber;
    }

    public HordeDefinition getActiveHorde() {
        return activeHorde;
    }
}
