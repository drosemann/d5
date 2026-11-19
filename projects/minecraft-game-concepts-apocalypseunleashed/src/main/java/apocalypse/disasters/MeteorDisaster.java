package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.entity.FallingBlock;

public class MeteorDisaster extends Disaster {
    private FallingBlock meteor;
    
    public MeteorDisaster(World world, Location location) {
        super(world, location);
    }

    @Override
    public void start() {
        Location spawnLoc = location.clone().add(0, 60, 0);
        meteor = world.spawnFallingBlock(spawnLoc, Material.MAGMA_BLOCK.createBlockData());
        meteor.setDropItem(false);
        meteor.setHurtEntities(true);
    }

    @Override
    public void stop() {
        if (meteor != null && !meteor.isDead()) {
            meteor.remove();
        }
    }

    @Override
    public String getName() {
        return "meteor";
    }
}