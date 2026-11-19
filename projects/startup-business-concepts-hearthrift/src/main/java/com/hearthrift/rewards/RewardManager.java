package com.hearthrift.rewards;

import com.hearthrift.Hearthrift;
import org.bukkit.*;
import org.bukkit.block.Chest;
import org.bukkit.entity.*;
import org.bukkit.inventory.EntityEquipment;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.ItemStack;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;
import org.bukkit.scheduler.BukkitTask;
import org.bukkit.enchantments.Enchantment;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class RewardManager {
    private final Hearthrift plugin;
    private final Map<UUID, Long> lastDailyReward;
    private final Map<UUID, Integer> pvpWinStreak;
    private final Map<UUID, Set<String>> completedTasks;
    private final Map<UUID, Integer> loginStreak;
    private final Map<UUID, Long> lastLoginDay;
    private final List<RandomEvent> activeEvents;
    private BukkitTask eventTask;

    private static final long DAY_MILLIS = 24L * 60L * 60L * 1000L;

    public RewardManager(Hearthrift plugin) {
        this.plugin = plugin;
        this.lastDailyReward = new ConcurrentHashMap<>();
        this.pvpWinStreak = new ConcurrentHashMap<>();
        this.completedTasks = new ConcurrentHashMap<>();
        this.loginStreak = new ConcurrentHashMap<>();
        this.lastLoginDay = new ConcurrentHashMap<>();
        this.activeEvents = new ArrayList<>();
        startRandomEventScheduler();
    }

    private void startRandomEventScheduler() {
        eventTask = plugin.getServer().getScheduler().runTaskTimer(plugin, () -> {
            // Überprüfe ob Spieler im RIFT sind
            long playersInRift = plugin.getServer().getOnlinePlayers().stream()
                .filter(p -> p.getWorld().getName().equals("RIFT"))
                .count();

            if (playersInRift > 0 && Math.random() < 0.15) { // 15% Chance pro Check
                startRandomEvent();
            }
        }, 1200L, 1200L); // Überprüfe alle 60 Sekunden
    }

    private void startRandomEvent() {
        RandomEvent event = RandomEvent.values()[new Random().nextInt(RandomEvent.values().length)];
        activeEvents.add(event);
        
        // Bereite den Event-Bereich vor (0,0 mit 50-Block-Radius)
        World riftWorld = plugin.getServer().getWorld("RIFT");
        if (riftWorld != null) {
            Location eventCenter = new Location(riftWorld, 0, riftWorld.getHighestBlockYAt(0, 0), 0);
            
            // Spezielle Effekte am Event-Ort
            riftWorld.strikeLightningEffect(eventCenter);
            riftWorld.spawnParticle(Particle.DRAGON_BREATH, eventCenter, 500, 25, 25, 25);
            
            // Event-spezifische Vorbereitungen
            switch(event) {
                case METEOR_SHOWER:
                    prepareEventArea(eventCenter, Material.MAGMA_BLOCK);
                    break;
                case MONSTER_INVASION:
                    spawnEliteMonsters(eventCenter);
                    break;
                case TREASURE_HUNT:
                    spawnTreasureChests(eventCenter);
                    break;
                case BLOOD_MOON:
                    prepareBossEvent(eventCenter);
                    break;
                case BOSS_INVASION:
                    spawnBossMonsters(eventCenter);
                    break;
            }
        }

        // Globale Ankündigung mit Soundeffekt
        plugin.getServer().getOnlinePlayers().forEach(p -> {
            p.playSound(p.getLocation(), Sound.ENTITY_WITHER_SPAWN, 1.0f, 0.5f);
            p.sendTitle(
                "§4§l" + event.getName(),
                event.getDescription(),
                10, 70, 20
            );
        });
        plugin.getServer().broadcastMessage("\n§4§l[RIFT-EVENT] §e" + event.getDescription() + "\n");
        
        // Event-Timer und Beendigung
        plugin.getServer().getScheduler().runTaskLater(plugin, () -> {
            activeEvents.remove(event);
            if (riftWorld != null) {
                Location eventCenter = new Location(riftWorld, 0, riftWorld.getHighestBlockYAt(0, 0), 0);
                riftWorld.spawnParticle(Particle.LAVA, eventCenter, 20, 25, 25, 25); // Using LAVA particles for dramatic effect
                riftWorld.playSound(eventCenter, Sound.ENTITY_WITHER_DEATH, 2.0f, 0.5f);
            }
            plugin.getServer().broadcastMessage("§4§l[RIFT-EVENT] §cDas Event '" + event.getName() + "' ist beendet!");
        }, event.getDuration());
    }

    public void handleDailyReward(Player player) {
        UUID playerId = player.getUniqueId();
        long currentTime = System.currentTimeMillis();
        Long lastReward = lastDailyReward.get(playerId);

        if (lastReward == null || currentTime - lastReward > 86400000) { // 24 Stunden in Millisekunden
            lastDailyReward.put(playerId, currentTime);
            
            // Basis-Belohnung
            DailyReward reward = new DailyReward(plugin);
            reward.giveReward(player);
            
            int streak = calculateLoginStreak(playerId);
            if (streak > 0 && streak % 7 == 0) {
                // Bonus für wöchentlichen Login-Streak
                reward.giveWeeklyBonus(player);
            }
        }
    }

    public void handlePvPWin(Player winner, Player loser) {
        UUID winnerId = winner.getUniqueId();
        int streak = pvpWinStreak.getOrDefault(winnerId, 0) + 1;
        pvpWinStreak.put(winnerId, streak);

        // Basis-PvP-Belohnung
        PvPReward.giveWinReward(winner);

        // Streak-Bonus
        if (streak % 5 == 0) { // Alle 5 Siege
            PvPReward.giveStreakBonus(winner, streak);
        }

        // Spezielle Belohnung für Siege im RIFT
        if (winner.getWorld().getName().equals("RIFT")) {
            PvPReward.giveRiftBonus(winner);
        }
    }

    public void resetPvPStreak(UUID playerId) {
        pvpWinStreak.remove(playerId);
    }

    public void completeTask(Player player, String taskId) {
        UUID playerId = player.getUniqueId();
        Set<String> playerTasks = completedTasks.computeIfAbsent(playerId, k -> new HashSet<>());
        
        if (!playerTasks.contains(taskId)) {
            playerTasks.add(taskId);
            TaskReward.giveReward(player, taskId);
        }
    }

    public boolean isEventActive(RandomEvent event) {
        return activeEvents.contains(event);
    }

    private int calculateLoginStreak(UUID playerId) {
        long now = System.currentTimeMillis();
        long todayStart = now - (now % DAY_MILLIS);
        Long lastDay = lastLoginDay.get(playerId);
        int currentStreak = loginStreak.getOrDefault(playerId, 0);

        // Persisted database would normally be queried here (e.g. a
        // "login_streak" table). We emulate the same day-boundary logic
        // in-memory and keep the maps as the authoritative store until a
        // real DB layer is added.
        int updatedStreak;
        if (lastDay == null) {
            updatedStreak = 1;
        } else {
            long diff = todayStart - lastDay;
            if (diff == DAY_MILLIS) {
                updatedStreak = currentStreak + 1;
            } else if (diff == 0) {
                // already logged in today – keep streak
                updatedStreak = currentStreak;
            } else {
                // gap of >=2 days or clock skew – restart streak
                updatedStreak = 1;
            }
        }

        lastLoginDay.put(playerId, todayStart);
        loginStreak.put(playerId, updatedStreak);
        return updatedStreak;
    }

    public int getLoginStreak(UUID playerId) {
        return loginStreak.getOrDefault(playerId, 0);
    }

    public void cleanup() {
        if (eventTask != null) {
            eventTask.cancel();
        }
        activeEvents.clear();
    }

    private void prepareEventArea(Location center, Material material) {
        World world = center.getWorld();
        Random random = new Random();

        // Markiere den Event-Bereich
        for (int i = 0; i < 16; i++) {
            double angle = i * (Math.PI * 2) / 16;
            Location markerLoc = center.clone().add(
                Math.cos(angle) * 50,
                0,
                Math.sin(angle) * 50
            );
            markerLoc.setY(world.getHighestBlockYAt(markerLoc));
            world.getBlockAt(markerLoc).setType(material);
        }
    }

    private void spawnEliteMonsters(Location center) {
        Random random = new Random();
        World world = center.getWorld();

        // Liste der Elite-Monster mit besonderen Effekten
        EntityType[] eliteTypes = {
            EntityType.WITHER_SKELETON,
            EntityType.VINDICATOR,
            EntityType.RAVAGER,
            EntityType.EVOKER,
            EntityType.PIGLIN_BRUTE
        };

        for (int i = 0; i < 15; i++) {
            Location spawnLoc = center.clone().add(
                random.nextInt(100) - 50,
                0,
                random.nextInt(100) - 50
            );
            spawnLoc.setY(world.getHighestBlockYAt(spawnLoc));

            EntityType type = eliteTypes[random.nextInt(eliteTypes.length)];
            LivingEntity entity = (LivingEntity) world.spawnEntity(spawnLoc, type);

            // Elite-Modifikationen
            entity.setCustomName("§c§lElite " + type.name());
            entity.setCustomNameVisible(true);
            entity.setMaxHealth(100.0);
            entity.setHealth(100.0);
            
            // Verstärkte Ausrüstung
            if (entity instanceof Monster) {
                EntityEquipment equipment = ((Monster) entity).getEquipment();
                if (equipment != null) {
                    equipment.setHelmet(new ItemStack(Material.NETHERITE_HELMET));
                    equipment.setChestplate(new ItemStack(Material.NETHERITE_CHESTPLATE));
                    equipment.setLeggings(new ItemStack(Material.NETHERITE_LEGGINGS));
                    equipment.setBoots(new ItemStack(Material.NETHERITE_BOOTS));
                    equipment.setItemInMainHand(new ItemStack(Material.NETHERITE_SWORD));
                }
            }

            // Effekte
            entity.addPotionEffect(new PotionEffect(PotionEffectType.STRENGTH, Integer.MAX_VALUE, 2));
            entity.addPotionEffect(new PotionEffect(PotionEffectType.SPEED, Integer.MAX_VALUE, 1));
        }
    }

    private void spawnTreasureChests(Location center) {
        Random random = new Random();
        World world = center.getWorld();

        for (int i = 0; i < 8; i++) {
            Location chestLoc = center.clone().add(
                random.nextInt(100) - 50,
                0,
                random.nextInt(100) - 50
            );
            chestLoc.setY(world.getHighestBlockYAt(chestLoc));
            
            // Setze und fülle Truhe
            world.getBlockAt(chestLoc).setType(Material.CHEST);
            Chest chest = (Chest) world.getBlockAt(chestLoc).getState();
            
            // Füge zufällige hochwertige Items hinzu
            Inventory inv = chest.getInventory();
            fillTreasureChest(inv);

            // Effekte
            world.spawnParticle(Particle.TOTEM_OF_UNDYING, chestLoc, 50, 0.5, 0.5, 0.5);
            world.spawnParticle(Particle.END_ROD, chestLoc, 20, 0.5, 0.5, 0.5);
        }
    }

    private void fillTreasureChest(Inventory inv) {
        Random random = new Random();
        Material[] valuableItems = {
            Material.DIAMOND, Material.EMERALD, Material.NETHERITE_INGOT,
            Material.GOLDEN_APPLE, Material.ENCHANTED_GOLDEN_APPLE,
            Material.EXPERIENCE_BOTTLE, Material.TOTEM_OF_UNDYING
        };

        for (int i = 0; i < 5 + random.nextInt(5); i++) {
            Material item = valuableItems[random.nextInt(valuableItems.length)];
            int amount = 1 + random.nextInt(4);
            inv.setItem(random.nextInt(27), new ItemStack(item, amount));
        }
    }

    private void prepareBossEvent(Location center) {
        prepareEventArea(center, Material.CRYING_OBSIDIAN);
        
        // Spawn Boss
        World world = center.getWorld();
        Location bossLoc = center.clone();
        bossLoc.setY(world.getHighestBlockYAt(center));

        // Wither als Haupt-Boss
        Wither boss = (Wither) world.spawnEntity(bossLoc, EntityType.WITHER);
        boss.setCustomName("§4§lApokalyptischer Wächter");
        boss.setCustomNameVisible(true);
        boss.setMaxHealth(500.0);
        boss.setHealth(500.0);
        
        // Boss-Effekte
        boss.addPotionEffect(new PotionEffect(PotionEffectType.RESISTANCE, Integer.MAX_VALUE, 1));
        boss.addPotionEffect(new PotionEffect(PotionEffectType.STRENGTH, Integer.MAX_VALUE, 2));
        
        // Visueller Effekt
        world.strikeLightningEffect(bossLoc);
        world.spawnParticle(Particle.DRAGON_BREATH, bossLoc, 1000, 5, 5, 5);
    }

    private void spawnBossMonsters(Location center) {
        World world = center.getWorld();
        
        // Spawn mehrere Mini-Bosse
        Location[] bossLocations = new Location[4];
        for (int i = 0; i < 4; i++) {
            double angle = i * (Math.PI * 2) / 4;
            bossLocations[i] = center.clone().add(
                Math.cos(angle) * 20,
                0,
                Math.sin(angle) * 20
            );
            bossLocations[i].setY(world.getHighestBlockYAt(bossLocations[i]));
        }

        // Verschiedene Boss-Typen
        spawnEliteBoss(bossLocations[0], EntityType.RAVAGER, "§4§lKriegs-Bestie");
        spawnEliteBoss(bossLocations[1], EntityType.ELDER_GUARDIAN, "§4§lUralter Wächter");
        spawnEliteBoss(bossLocations[2], EntityType.EVOKER, "§4§lChaos-Magier");
        spawnEliteBoss(bossLocations[3], EntityType.WITHER_SKELETON, "§4§lTodes-Ritter");
    }

    private void spawnEliteBoss(Location loc, EntityType type, String name) {
        World world = loc.getWorld();
        LivingEntity boss = (LivingEntity) world.spawnEntity(loc, type);
        
        boss.setCustomName(name);
        boss.setCustomNameVisible(true);
        boss.setMaxHealth(250.0);
        boss.setHealth(250.0);
        
        // Verstärkte Ausrüstung für humanoide Bosse
        if (boss instanceof Monster) {
            EntityEquipment equipment = ((Monster) boss).getEquipment();
            if (equipment != null) {
                ItemStack sword = new ItemStack(Material.NETHERITE_SWORD);
                sword.addEnchantment(Enchantment.SHARPNESS, 5);
                equipment.setItemInMainHand(sword);
                
                ItemStack helmet = new ItemStack(Material.NETHERITE_HELMET);
                helmet.addEnchantment(Enchantment.PROTECTION, 4);
                equipment.setHelmet(helmet);
                
                equipment.setChestplate(new ItemStack(Material.NETHERITE_CHESTPLATE));
                equipment.setLeggings(new ItemStack(Material.NETHERITE_LEGGINGS));
                equipment.setBoots(new ItemStack(Material.NETHERITE_BOOTS));
            }
        }
        
        // Boss-Effekte
        boss.addPotionEffect(new PotionEffect(PotionEffectType.STRENGTH, Integer.MAX_VALUE, 3));
        boss.addPotionEffect(new PotionEffect(PotionEffectType.SPEED, Integer.MAX_VALUE, 1));
        boss.addPotionEffect(new PotionEffect(PotionEffectType.FIRE_RESISTANCE, Integer.MAX_VALUE, 1));
        
        // Visueller Effekt
        world.strikeLightningEffect(loc);
        world.spawnParticle(Particle.SOUL_FIRE_FLAME, loc, 100, 1, 1, 1);
    }
}