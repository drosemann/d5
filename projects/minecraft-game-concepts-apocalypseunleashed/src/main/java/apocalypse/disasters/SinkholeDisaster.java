package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.entity.Player;
import org.bukkit.entity.FallingBlock;

public class SinkholeDisaster extends Disaster {
    private static final int RADIUS = 8;
    private static final int DEPTH = 10;
    private BukkitRunnable sinkTask;
    
    public SinkholeDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location center = location.clone();
        sinkTask = new BukkitRunnable() {
            int currentDepth = 0;
            
            @Override
            public void run() {
                if(currentDepth >= DEPTH) {
                    this.cancel();
                    return;
                }

                for(int x = -RADIUS; x <= RADIUS; x++) {
                    for(int z = -RADIUS; z <= RADIUS; z++) {
                        if(x*x + z*z <= RADIUS*RADIUS) {
                            Location blockLoc = center.clone().add(x, -currentDepth, z);
                            Block block = blockLoc.getBlock();
                            
                            if(block.getType() != Material.AIR && block.getType() != Material.BEDROCK) {
                                if(Math.random() < 0.3) { // 30% chance to create falling block
                                    FallingBlock fallingBlock = world.spawnFallingBlock(blockLoc, block.getBlockData());
                                    fallingBlock.setDropItem(false);
                                }
                                block.setType(Material.AIR);
                            }
                        }
                    }
                }
                
                currentDepth++;
            }
        };
        sinkTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 10L);
    }

    @Override
    public void stop() {
        if(sinkTask != null) {
            sinkTask.cancel();
        }
    }

    @Override
    public String getName() {
        return "sinkhole";
    }
}