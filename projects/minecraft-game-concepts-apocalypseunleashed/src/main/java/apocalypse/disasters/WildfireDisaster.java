package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Particle;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.entity.Player;

public class WildfireDisaster extends Disaster {
    private static final int RADIUS = 15;
    private BukkitRunnable fireSpreadTask;
    
    public WildfireDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location center = location.clone();
        
        // Initial fire spots
        for(int i = 0; i < 5; i++) {
            double angle = Math.random() * Math.PI * 2;
            double distance = Math.random() * RADIUS;
            int x = (int)(Math.cos(angle) * distance);
            int z = (int)(Math.sin(angle) * distance);
            Location fireLoc = center.clone().add(x, 0, z);
            fireLoc.setY(world.getHighestBlockYAt(fireLoc));
            fireLoc.getBlock().setType(Material.FIRE);
        }
        
        fireSpreadTask = new BukkitRunnable() {
            @Override
            public void run() {
                for(int x = -RADIUS; x <= RADIUS; x++) {
                    for(int z = -RADIUS; z <= RADIUS; z++) {
                        if(Math.random() < 0.1) { // 10% chance per block
                            Location blockLoc = center.clone().add(x, 0, z);
                            blockLoc.setY(world.getHighestBlockYAt(blockLoc));
                            Block block = blockLoc.getBlock();
                            Block below = block.getLocation().clone().subtract(0, 1, 0).getBlock();
                            
                            // Spread fire on suitable blocks
                            if(block.getType() == Material.AIR && 
                               (below.getType().isSolid() || below.getType() == Material.GRASS_BLOCK)) {
                                if(Math.random() < 0.3) { // 30% chance to spread
                                    block.setType(Material.FIRE);
                                }
                            }
                            
                            // Burn wooden blocks
                            if(block.getType().name().contains("WOOD") || 
                               block.getType().name().contains("LEAVES") ||
                               block.getType().name().contains("LOG")) {
                                block.setType(Material.FIRE);
                            }
                        }
                    }
                }
                
                // Smoke particles
                world.spawnParticle(Particle.CAMPFIRE_SIGNAL_SMOKE, center, 50, RADIUS/2, 5, RADIUS/2, 0.01);
            }
        };
        fireSpreadTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 20L);
    }

    @Override
    public void stop() {
        if(fireSpreadTask != null) {
            fireSpreadTask.cancel();
        }
        
        // Extinguish fires
        Location center = location.clone();
        for(int x = -RADIUS; x <= RADIUS; x++) {
            for(int y = -5; y <= 10; y++) {
                for(int z = -RADIUS; z <= RADIUS; z++) {
                    Location blockLoc = center.clone().add(x, y, z);
                    if(blockLoc.getBlock().getType() == Material.FIRE) {
                        blockLoc.getBlock().setType(Material.AIR);
                    }
                }
            }
        }
    }

    @Override
    public String getName() {
        return "wildfire";
    }
}