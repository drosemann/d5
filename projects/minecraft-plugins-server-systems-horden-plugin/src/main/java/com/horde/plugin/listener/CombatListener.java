package de.hordeplugin.listener;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.entity.Player;
import org.bukkit.entity.LivingEntity;
import org.bukkit.inventory.ItemStack;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.ChatColor;

import de.hordeplugin.HordePlugin;

/**
 * CombatListener - Verarbeitet Partikel-Effekte bei Horden-Kämpfen
 */
public class CombatListener implements Listener {

    private final HordePlugin plugin;

    public CombatListener(HordePlugin plugin) {
        this.plugin = plugin;
    }

    /**
     * Verarbeitet Schaden gegen Horde-Mobs und spielt Effekte ab
     */
    @EventHandler
    public void onEntityDamageByEntity(EntityDamageByEntityEvent event) {
        // Nur Spieler-Schaden zählt
        if (!(event.getDamager() instanceof Player)) {
            return;
        }

        Player attacker = (Player) event.getDamager();
        LivingEntity target = event.getEntity();

        // Prüfe ob Ziel ein Horde-Mob ist
        if (!isHordeMob(target)) {
            return;
        }

        // Horde-Mob getroffen
        ItemStack weapon = attacker.getInventory().getItemInMainHand();

        // Spezial-Effekte für Custom-Waffen
        if (isSpecialWeapon(weapon)) {
            playSpecialWeaponEffect(target, weapon);
            attacker.sendMessage(ChatColor.LIGHT_PURPLE + "⚡ Spezial-Waffe aktiviert!");
        } else {
            // Standard-Effekt
            playStandardCombatEffect(target);
        }

        // Sound-Effekt
        target.getLocation().getWorld().playSound(
            target.getLocation(),
            Sound.ENTITY_GENERIC_HURT,
            1.0f,
            1.2f
        );
    }

    /**
     * Spielt Standard-Kampf-Effekte ab
     */
    private void playStandardCombatEffect(LivingEntity target) {
        if (target.getLocation().getWorld() == null) {
            return;
        }

        target.getLocation().getWorld().spawnParticle(
            Particle.CRIT,
            target.getLocation().add(0, 1, 0),
            10,
            0.5, 0.5, 0.5,
            0.1
        );
    }

    /**
     * Spielt spezielle Waffen-Effekte ab
     */
    private void playSpecialWeaponEffect(LivingEntity target, ItemStack weapon) {
        if (target.getLocation().getWorld() == null) {
            return;
        }

        String weaponName = weapon.hasItemMeta() && weapon.getItemMeta().hasDisplayName() ? 
            weapon.getItemMeta().getDisplayName() : "";

        // Magische Effekte für Zauberstäbe/Spezialwaffen
        target.getLocation().getWorld().spawnParticle(
            Particle.CRIT_MAGIC,
            target.getLocation().add(0, 1, 0),
            20,
            1.0, 1.0, 1.0,
            0.2
        );

        // Zusätzliche Feuer-Partikel für "Flammender" Waffen
        if (weaponName.toLowerCase().contains("flamm")) {
            target.getLocation().getWorld().spawnParticle(
                Particle.FLAME,
                target.getLocation().add(0, 1, 0),
                15,
                0.5, 0.5, 0.5,
                0.1
            );
        }

        // Frost-Partikel für "Eis"-Waffen
        if (weaponName.toLowerCase().contains("eis") || weaponName.toLowerCase().contains("frost")) {
            target.getLocation().getWorld().spawnParticle(
                Particle.SNOWBALL,
                target.getLocation().add(0, 1, 0),
                15,
                0.5, 0.5, 0.5,
                0.1
            );
        }

        // Sound für Spezial-Effekt
        target.getLocation().getWorld().playSound(
            target.getLocation(),
            Sound.ENTITY_EXPERIENCE_ORB_PICKUP,
            1.0f,
            1.5f
        );
    }

    /**
     * Prüft ob die Waffe eine Spezial-Waffe ist
     */
    private boolean isSpecialWeapon(ItemStack weapon) {
        if (weapon == null || !weapon.hasItemMeta()) {
            return false;
        }

        if (!weapon.getItemMeta().hasDisplayName()) {
            return false;
        }

        String displayName = weapon.getItemMeta().getDisplayName().toLowerCase();

        // Liste von Spezial-Waffen
        return displayName.contains("dragon") ||
               displayName.contains("flamm") ||
               displayName.contains("eis") ||
               displayName.contains("blitz") ||
               displayName.contains("mythisch") ||
               displayName.contains("legend") ||
               displayName.contains("schwert der") ||
               displayName.contains("axt des");
    }

    /**
     * Prüfe ob der Mob ein Horde-Mob ist
     */
    private boolean isHordeMob(LivingEntity entity) {
        if (entity.getEquipment() == null) {
            return false;
        }

        ItemStack helmet = entity.getEquipment().getHelmet();
        if (helmet == null || helmet.getType() == org.bukkit.Material.AIR) {
            return false;
        }

        // Custom-Rüstung = Horde-Mob
        String helmetType = helmet.getType().toString();
        return helmetType.contains("GOLDEN") || 
               helmetType.contains("LEATHER") || 
               helmetType.contains("IRON");
    }
}
