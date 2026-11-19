package apocalypse.tasks;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.Particle;
import org.bukkit.Sound;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import apocalypse.disasters.ThunderstormDisaster;

public class ThunderstormTask extends BukkitRunnable {
    private final World world;
    private final Location center;
    private final int radius;
    private final ThunderstormDisaster disaster;

    public ThunderstormTask(World world, Location center, int radius, ThunderstormDisaster disaster) {
        this.world = world;
        this.center = center;
        this.radius = radius;
        this.disaster = disaster;
    }

    @Override
    public void run() {
        // Create storm cloud effects
        for(int i = 0; i < 20; i++) {
            double x = center.getX() + (Math.random() * radius * 2) - radius;
            double z = center.getZ() + (Math.random() * radius * 2) - radius;
            Location cloudLoc = new Location(world, x, center.getY() + 20, z);
            
            // Storm cloud particles
            world.spawnParticle(Particle.CLOUD, cloudLoc, 5, 2, 1, 2, 0);
            world.spawnParticle(Particle.FALLING_WATER, cloudLoc, 10, 0.1, 0.1, 0.1, 0);
            
            // Lightning effect particles
            if(Math.random() < 0.1) {
                world.spawnParticle(Particle.FLASH, cloudLoc, 1, 0, 0, 0, 0);
            }
        }
        
        // Random lightning strikes
        if(Math.random() < 0.3) { // 30% chance each tick
            double angle = Math.random() * Math.PI * 2;
            double distance = Math.random() * radius;
            int x = (int)(Math.cos(angle) * distance);
            int z = (int)(Math.sin(angle) * distance);
            Location strikeLoc = center.clone().add(x, 0, z);
            strikeLoc.setY(world.getHighestBlockYAt(strikeLoc));
            
            // Pre-lightning effect
            world.spawnParticle(Particle.FLASH, strikeLoc.clone().add(0, 10, 0), 3, 0.5, 5, 0.5, 0);
            
            world.strikeLightning(strikeLoc);
            
            // Chance to start fires
            if(Math.random() < 0.3) {
                Block strikeBlock = strikeLoc.getBlock();
                if(strikeBlock.getType() == Material.AIR) {
                    strikeBlock.setType(Material.FIRE);
                }
            }
        }
        
        // Rain particles and effects
        for(int i = 0; i < 50; i++) {
            double x = center.getX() + (Math.random() - 0.5) * radius * 2;
            double y = center.getY() + 20;
            double z = center.getZ() + (Math.random() - 0.5) * radius * 2;
            Location rainLoc = new Location(world, x, y, z);
            world.spawnParticle(Particle.DRIPPING_WATER, rainLoc, 1, 0, 0, 0, 0);
        }
        
        // Thunder sound effects
        if(Math.random() < 0.1) {
            disaster.playDisasterSound(Sound.ENTITY_LIGHTNING_BOLT_THUNDER, 3.0f, 0.8f);
        }
    }
}