// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/VolcanicDisaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/VolcanicDisaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/VolcanicDisaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.Material;
// import org.bukkit.Particle;
// import org.bukkit.block.Block;
// import org.bukkit.scheduler.BukkitRunnable;
// import org.bukkit.entity.Player;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public class VolcanicDisaster extends Disaster {
//     private static final int RADIUS = 10;
//     private BukkitRunnable eruption;
//     
//     public VolcanicDisaster(World world, Location location) {
//         super(world, location);
//     }
//
//     @Override
//     public void start() {
//         Location center = location.clone();
//         // Create volcano structure
//         for(int x = -RADIUS; x <= RADIUS; x++) {
//             for(int z = -RADIUS; z <= RADIUS; z++) {
//                 double distance = Math.sqrt(x*x + z*z);
//                 if(distance <= RADIUS) {
//                     int height = (int)(RADIUS - distance);
//                     for(int y = 0; y < height; y++) {
//                         Location blockLoc = center.clone().add(x, y, z);
//                         blockLoc.getBlock().setType(Material.MAGMA_BLOCK);
//                     }
//                 }
//             }
//         }
//         
//         eruption = new BukkitRunnable() {
//             @Override
//             public void run() {
//                 // Spawn lava particles and damage nearby players
//                 world.spawnParticle(Particle.LAVA, center.clone().add(0, RADIUS, 0), 50, 3, 3, 3, 0);
//                 world.spawnParticle(Particle.FLAME, center.clone().add(0, RADIUS, 0), 30, 2, 2, 2, 0.1);
//                 
//                 for(Player player : world.getPlayers()) {
//                     if(player.getLocation().distance(center) <= RADIUS * 2) {
//                         player.damage(2.0); // Fire damage
//                         player.setFireTicks(100); // Set player on fire
//                         player.addPotionEffect(new PotionEffect(PotionEffectType.SLOWNESS, 100, 1)); // Slow from heat
//                     }
//                 }
//                 
//                 // Random lava blocks
//                 if(Math.random() < 0.3) {
//                     double angle = Math.random() * Math.PI * 2;
//                     double distance = Math.random() * RADIUS;
//                     int x = (int)(Math.cos(angle) * distance);
//                     int z = (int)(Math.sin(angle) * distance);
//                     Location lavaLoc = center.clone().add(x, RADIUS, z);
//                     if(lavaLoc.getBlock().getType() == Material.AIR) {
//                         lavaLoc.getBlock().setType(Material.LAVA);
//                     }
//                 }
//             }
//         };
//         eruption.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 20L);
//     }
//
//     @Override
//     public void stop() {
//         if(eruption != null) {
//             eruption.cancel();
//         }
//         // Clean up lava
//         Location center = location.clone();
//         for(int x = -RADIUS*2; x <= RADIUS*2; x++) {
//             for(int y = 0; y <= RADIUS; y++) {
//                 for(int z = -RADIUS*2; z <= RADIUS*2; z++) {
//                     Location blockLoc = center.clone().add(x, y, z);
//                     if(blockLoc.getBlock().getType() == Material.LAVA) {
//                         blockLoc.getBlock().setType(Material.AIR);
//                     }
//                 }
//             }
//         }
//     }
//
//     @Override
//     public String getName() {
//         return "volcanic";
//     }
// }
