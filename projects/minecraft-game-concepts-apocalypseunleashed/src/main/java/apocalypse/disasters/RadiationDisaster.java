package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Particle;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.entity.Player;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;

public class RadiationDisaster extends Disaster {
    private static final int RADIUS = 25;
    private BukkitRunnable radiationTask;
    
    public RadiationDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location center = location.clone();
        
        // Create initial contamination
        for(int x = -RADIUS/2; x <= RADIUS/2; x++) {
            for(int z = -RADIUS/2; z <= RADIUS/2; z++) {
                if(Math.random() < 0.3 && x*x + z*z <= (RADIUS/2)*(RADIUS/2)) {
                    Location blockLoc = center.clone().add(x, 0, z);
                    blockLoc.setY(world.getHighestBlockYAt(blockLoc));
                    Block block = blockLoc.getBlock();
                    
                    // Create radioactive-looking blocks
                    if(block.getType() != Material.AIR) {
                        if(Math.random() < 0.5) {
                            block.setType(Material.SLIME_BLOCK);
                        } else {
                            block.setType(Material.EMERALD_BLOCK);
                        }
                    }
                }
            }
        }
        
        radiationTask = new BukkitRunnable() {
            @Override
            public void run() {
                // Radiation particles
                for(int i = 0; i < 50; i++) {
                    double angle = Math.random() * Math.PI * 2;
                    double distance = Math.random() * RADIUS;
                    double x = center.getX() + Math.cos(angle) * distance;
                    double y = center.getY() + Math.random() * 3;
                    double z = center.getZ() + Math.sin(angle) * distance;
                    Location particleLoc = new Location(world, x, y, z);
                    
                    world.spawnParticle(Particle.SOUL_FIRE_FLAME, particleLoc, 0, 0.5, 1.0, 0.0, 1);
                    if(Math.random() < 0.2) {
                        world.spawnParticle(Particle.ANGRY_VILLAGER, particleLoc, 1, 0.5, 0.5, 0.5, 0);
                    }
                }
                
                // Affect players in radiation zone
                for(Player player : world.getPlayers()) {
                    double distance = player.getLocation().distance(center);
                    if(distance <= RADIUS) {
                        double intensity = 1 - (distance / RADIUS); // Stronger effect closer to center
                        
                        // Apply radiation effects
                        player.addPotionEffect(new PotionEffect(PotionEffectType.WITHER, 60, (int)(intensity * 2)));
                        player.addPotionEffect(new PotionEffect(PotionEffectType.WEAKNESS, 100, (int)(intensity * 2)));
                        player.addPotionEffect(new PotionEffect(PotionEffectType.DARKNESS, 100, 0));
                        
                        if(Math.random() < intensity * 0.3) {
                            player.damage(1.0);
                        }
                    }
                }
            }
        };
        radiationTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 20L);
    }

    @Override
    public void stop() {
        if(radiationTask != null) {
            radiationTask.cancel();
        }
        
        // Clean up contaminated blocks
        Location center = location.clone();
        for(int x = -RADIUS; x <= RADIUS; x++) {
            for(int y = -5; y <= 5; y++) {
                for(int z = -RADIUS; z <= RADIUS; z++) {
                    if(x*x + z*z <= RADIUS*RADIUS) {
                        Location blockLoc = center.clone().add(x, y, z);
                        Block block = blockLoc.getBlock();
                        if(block.getType() == Material.SLIME_BLOCK || 
                           block.getType() == Material.EMERALD_BLOCK) {
                            block.setType(Material.GRASS_BLOCK);
                        }
                    }
                }
            }
        }
    }

    @Override
    public String getName() {
        return "radiation";
    }
}