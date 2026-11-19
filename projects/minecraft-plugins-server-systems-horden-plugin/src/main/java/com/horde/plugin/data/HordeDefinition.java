package de.hordeplugin.data;

import org.bukkit.configuration.ConfigurationSection;
import org.bukkit.entity.EntityType;
import org.bukkit.Color;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * HordeDefinition - Definiert eine Horde mit Wellen, Mobs und Loot
 */
public class HordeDefinition {
    
    private String name;
    private String displayName;
    private List<WaveDefinition> waves;
    private int minDurationSeconds;
    private int maxDurationSeconds;

    public HordeDefinition(ConfigurationSection section) {
        this.name = section.getName();
        this.displayName = section.getString("display-name", name);
        this.minDurationSeconds = section.getInt("min-duration", 600); // 10 min
        this.maxDurationSeconds = section.getInt("max-duration", 1200); // 20 min

        // Wellen laden
        this.waves = new java.util.ArrayList<>();
        ConfigurationSection wavesSection = section.getConfigurationSection("waves");
        if (wavesSection != null) {
            for (String waveKey : wavesSection.getKeys(false)) {
                ConfigurationSection waveSection = wavesSection.getConfigurationSection(waveKey);
                if (waveSection != null) {
                    waves.add(new WaveDefinition(waveSection));
                }
            }
        }
    }

    public String getName() {
        return name;
    }

    public String getDisplayName() {
        return displayName;
    }

    public List<WaveDefinition> getWaves() {
        return waves;
    }

    public int getMinDurationSeconds() {
        return minDurationSeconds;
    }

    public int getMaxDurationSeconds() {
        return maxDurationSeconds;
    }

    /**
     * WaveDefinition - Einzelne Welle mit Mobs und Loot
     */
    public static class WaveDefinition {
        private int waveNumber;
        private EntityType mobType;
        private int mobCount;
        private String armorType;
        private String armorColor;
        private List<String> lootItems;
        private int spawnDelaySeconds;

        public WaveDefinition(ConfigurationSection section) {
            this.waveNumber = section.getInt("wave-number", 1);
            this.mobType = EntityType.valueOf(section.getString("mob-type", "ZOMBIE"));
            this.mobCount = section.getInt("mob-count", 10);
            this.armorType = section.getString("armor-type", "LEATHER");
            this.armorColor = section.getString("armor-color", "GRAY");
            this.spawnDelaySeconds = section.getInt("spawn-delay", 5);

            // Loot-Items laden
            this.lootItems = section.getStringList("loot-items");
        }

        public int getWaveNumber() {
            return waveNumber;
        }

        public EntityType getMobType() {
            return mobType;
        }

        public int getMobCount() {
            return mobCount;
        }

        public String getArmorType() {
            return armorType;
        }

        public String getArmorColor() {
            return armorColor;
        }

        public List<String> getLootItems() {
            return lootItems;
        }

        public int getSpawnDelaySeconds() {
            return spawnDelaySeconds;
        }
    }
}
