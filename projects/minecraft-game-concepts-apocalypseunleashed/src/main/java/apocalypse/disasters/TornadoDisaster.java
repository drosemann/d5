package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Sound;
import org.bukkit.Particle;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.util.Vector;

public class TornadoDisaster extends Disaster {
    private BukkitRunnable tornadoTask;
    private static final int RADIUS = 10;
    private static final int HEIGHT = 20;
    
    public TornadoDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location center = location.clone();
        
        // Initial dramatic effect
        createDisasterCloud(Particle.EXPLOSION_EMITTER, RADIUS * 2, 50);
        playDisasterSound(Sound.ENTITY_LIGHTNING_BOLT_THUNDER, 2.0f, 0.5f);
        
        tornadoTask = new BukkitRunnable() {
            double angle = 0;
            
            @Override
            public void run() {
                // Rotate tornado effect
                angle += 0.2;
                if(angle > 360) angle = 0;
                
                // Create dramatic tornado particles
                for(double y = 0; y < HEIGHT; y += 0.5) {
                    double radius = (RADIUS * (HEIGHT - y)) / HEIGHT;
                    double x = center.getX() + radius * Math.cos(angle);
                    double z = center.getZ() + radius * Math.sin(angle);
                    Location particleLoc = new Location(world, x, center.getY() + y, z);
                    
                    // Main tornado funnel
                    world.spawnParticle(Particle.CLOUD, particleLoc, 2, 0.2, 0.2, 0.2, 0);
                    world.spawnParticle(Particle.CAMPFIRE_COSY_SMOKE, particleLoc, 1, 0.2, 0.2, 0.2, 0.1);
                    
                    // Add debris effects
                    if(y % 2 == 0) {
                        world.spawnParticle(Particle.FALLING_DUST, particleLoc, 3, 0.5, 0.5, 0.5, 0, Material.DIRT.createBlockData());
                    }
                    
                    // Lightning effect occasionally
                    if(Math.random() < 0.01) {
                        world.spawnParticle(Particle.FLASH, particleLoc, 1, 0, 0, 0, 0);
                        playDisasterSound(Sound.ENTITY_LIGHTNING_BOLT_THUNDER, 1.0f, 1.0f);
                    }
                    
                    // Affect nearby players
                    for(Player player : world.getPlayers()) {
                        if(player.getLocation().distance(particleLoc) < 3) {
                            Vector velocity = player.getVelocity();
                            velocity.setY(velocity.getY() + 0.5);
                            player.setVelocity(velocity);
                        }
                    }
                }
            }
        };
        tornadoTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 1L);
    }

    @Override
    public void stop() {
        if(tornadoTask != null) {
            tornadoTask.cancel();
        }
    }

    @Override
    public String getName() {
        return "tornado";
    }
}