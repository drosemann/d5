package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Particle;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.entity.Player;
import org.bukkit.entity.FallingBlock;
import org.bukkit.util.Vector;

public class AsteroidRainDisaster extends Disaster {
    private static final int RADIUS = 20;
    private BukkitRunnable asteroidTask;
    
    public AsteroidRainDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location center = location.clone();
        
        asteroidTask = new BukkitRunnable() {
            @Override
            public void run() {
                // Spawn multiple small asteroids
                for(int i = 0; i < 3; i++) {
                    if(Math.random() < 0.3) { // 30% chance for each potential asteroid
                        // Random position within radius
                        double angle = Math.random() * Math.PI * 2;
                        double distance = Math.random() * RADIUS;
                        int x = (int)(Math.cos(angle) * distance);
                        int z = (int)(Math.sin(angle) * distance);
                        
                        Location asteroidLoc = center.clone().add(x, 40, z);
                        
                        // Create asteroid (falling block)
                        Material[] materials = {
                            Material.OBSIDIAN, Material.MAGMA_BLOCK, 
                            Material.STONE, Material.COBBLESTONE
                        };
                        Material asteroidMaterial = materials[(int)(Math.random() * materials.length)];
                        
                        FallingBlock asteroid = world.spawnFallingBlock(
                            asteroidLoc, 
                            asteroidMaterial.createBlockData()
                        );
                        
                        // Set properties
                        asteroid.setDropItem(false);
                        asteroid.setHurtEntities(true);
                        asteroid.setFallDistance(100f);
                        
                        // Add some random velocity
                        Vector vel = new Vector(
                            (Math.random() - 0.5) * 0.2,
                            -1,
                            (Math.random() - 0.5) * 0.2
                        );
                        asteroid.setVelocity(vel);
                        
                        // Particle effects
                        world.spawnParticle(Particle.FLAME, asteroidLoc, 10, 0.2, 0.2, 0.2, 0.05);
                        world.spawnParticle(Particle.CLOUD, asteroidLoc, 5, 0.2, 0.2, 0.2, 0.05);
                    }
                }
                
                // Background effects
                for(int i = 0; i < 10; i++) {
                    double x = center.getX() + (Math.random() - 0.5) * RADIUS * 2;
                    double y = center.getY() + 30 + Math.random() * 20;
                    double z = center.getZ() + (Math.random() - 0.5) * RADIUS * 2;
                    Location effectLoc = new Location(world, x, y, z);
                    world.spawnParticle(Particle.CLOUD, effectLoc, 1, 0, 0, 0, 0);
                }
            }
        };
        asteroidTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 10L);
    }

    @Override
    public void stop() {
        if(asteroidTask != null) {
            asteroidTask.cancel();
        }
    }

    @Override
    public String getName() {
        return "asteroidrain";
    }
}