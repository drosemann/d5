package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.entity.Player;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;
import org.bukkit.Particle;

public class BlizzardDisaster extends Disaster {
    private BukkitRunnable blizzardTask;
    private static final int RADIUS = 30;
    
    public BlizzardDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        // Change weather to storm
        world.setStorm(true);
        world.setThundering(false);
        
        // Initial dramatic effects
        createDisasterSphere(Particle.SNOWFLAKE, RADIUS);
        createDisasterCloud(Particle.CLOUD, RADIUS, 100);
        playDisasterSound(Sound.WEATHER_RAIN, 2.0f, 2.0f);
        
        blizzardTask = new BukkitRunnable() {
            @Override
            public void run() {
                // Create dramatic snow and wind effects
                for(int i = 0; i < 50; i++) {
                    double x = location.getX() + (Math.random() * RADIUS * 2) - RADIUS;
                    double z = location.getZ() + (Math.random() * RADIUS * 2) - RADIUS;
                    Location snowLoc = new Location(world, x, location.getY() + 15, z);
                    
                    // Enhanced snow and ice effects
                    world.spawnParticle(Particle.SNOWFLAKE, snowLoc, 5, 0.5, 0.5, 0.5, 0);
                    world.spawnParticle(Particle.CLOUD, snowLoc, 3, 0.5, 0.5, 0.5, 0);
                    world.spawnParticle(Particle.WHITE_ASH, snowLoc, 2, 1.0, 0.5, 1.0, 0.1);
                    world.spawnParticle(Particle.FALLING_WATER, snowLoc, 10, 0.1, 0.1, 0.1, 0);
                    
                    // Wind effect
                    if (i % 5 == 0) {
                        world.spawnParticle(Particle.SWEEP_ATTACK, snowLoc, 1, 0.5, 0.5, 0.5, 0.1);
                    }
                }

                // Freeze water and create snow layers
                if(Math.random() < 0.1) { // 10% chance each tick
                    int x = (int)(location.getX() + (Math.random() * RADIUS * 2) - RADIUS);
                    int z = (int)(location.getZ() + (Math.random() * RADIUS * 2) - RADIUS);
                    Location groundLoc = world.getHighestBlockAt(x, z).getLocation();
                    Block block = groundLoc.getBlock();
                    
                    if(block.getType() == Material.WATER) {
                        block.setType(Material.ICE);
                    } else if(block.getType().isSolid() && block.getRelative(0, 1, 0).getType() == Material.AIR) {
                        block.getRelative(0, 1, 0).setType(Material.SNOW);
                    }
                }

                // Affect players in the blizzard
                for(Player player : world.getPlayers()) {
                    if(player.getLocation().distance(location) <= RADIUS) {
                        player.addPotionEffect(new PotionEffect(PotionEffectType.SLOWNESS, 40, 1));
                        player.damage(1.0); // Cold damage
                    }
                }
            }
        };
        blizzardTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 1L);
    }

    @Override
    public void stop() {
        if(blizzardTask != null) {
            blizzardTask.cancel();
        }
        
        // Reset weather if no other disasters are active
        world.setStorm(false);
        
        // Create final dissipating effect
        createDisasterCloud(Particle.CLOUD, RADIUS, 50);
        playDisasterSound(Sound.WEATHER_RAIN, 1.0f, 0.5f);
    }

    @Override
    public String getName() {
        return "blizzard";
    }
}