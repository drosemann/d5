package apocalypse.disasters;

import org.bukkit.Location;
import org.bukkit.World;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.scheduler.BukkitRunnable;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;

public class EarthquakeDisaster extends Disaster {
    private BukkitRunnable earthquakeTask;
    private static final int RADIUS = 15;
    private static final int DURATION = 200; // 10 seconds
    private int ticksRemaining;
    
    public EarthquakeDisaster(World world, Location location) {
        super(world, location);
        this.ticksRemaining = DURATION;
    }

    @Override
    public void start() {
        earthquakeTask = new BukkitRunnable() {
            @Override
            public void run() {
                if(ticksRemaining <= 0) {
                    stop();
                    return;
                }

                // Shake nearby players
                for(Player player : world.getPlayers()) {
                    if(player.getLocation().distance(location) <= RADIUS) {
                        Location playerLoc = player.getLocation();
                        playerLoc.add(Math.random() * 0.3 - 0.15, 0, Math.random() * 0.3 - 0.15);
                        player.teleport(playerLoc);
                        player.addPotionEffect(new PotionEffect(PotionEffectType.DARKNESS, 40, 1));
                    }
                }

                // Damage and crack blocks
                if(ticksRemaining % 20 == 0) { // Every second
                    for(int x = -RADIUS; x <= RADIUS; x++) {
                        for(int z = -RADIUS; z <= RADIUS; z++) {
                            if(Math.random() < 0.1) { // 10% chance for each block
                                Location blockLoc = location.clone().add(x, 0, z);
                                Block block = world.getHighestBlockAt(blockLoc);
                                if(block.getType().isSolid() && !block.getType().equals(Material.BEDROCK)) {
                                    block.setType(Material.CRACKED_STONE_BRICKS);
                                }
                            }
                        }
                    }
                }

                ticksRemaining--;
            }
        };
        earthquakeTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 1L);
    }

    @Override
    public void stop() {
        if(earthquakeTask != null) {
            earthquakeTask.cancel();
        }
    }

    @Override
    public String getName() {
        return "earthquake";
    }
}