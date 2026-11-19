// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/AcidRainDisaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/AcidRainDisaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/AcidRainDisaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.Material;
// import org.bukkit.Sound;
// import org.bukkit.Particle;
// import org.bukkit.block.Block;
// import org.bukkit.scheduler.BukkitRunnable;
// import org.bukkit.entity.Player;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public class AcidRainDisaster extends Disaster {
//     private static final int RADIUS = 20;
//     private BukkitRunnable rainTask;
//     
//     public AcidRainDisaster(World world, Location location) {
//         super(world, location);
//     }
//
//     @Override
//     public void start() {
//         Location center = location.clone();
//         
//         // Initial effect when the disaster starts
//         createDisasterCloud(Particle.FALLING_WATER, RADIUS, 100);
//         playDisasterSound(Sound.WEATHER_RAIN, 1.0f, 0.5f);
//         
//         rainTask = new BukkitRunnable() {
//             @Override
//             public void run() {
//                 // Create acid rain particles with more variety
//                 for(int i = 0; i < 50; i++) {
//                     double x = center.getX() + (Math.random() - 0.5) * RADIUS * 2;
//                     double y = center.getY() + 20;
//                     double z = center.getZ() + (Math.random() - 0.5) * RADIUS * 2;
//                     Location particleLoc = new Location(world, x, y, z);
//                     world.spawnParticle(Particle.DRIPPING_LAVA, particleLoc, 1, 0, 0, 0, 0);
//                     world.spawnParticle(Particle.FALLING_OBSIDIAN_TEAR, particleLoc, 1, 0.2, 0, 0.2, 0);
//                     
//                     // Ground effect where rain hits
//                     Location groundLoc = world.getHighestBlockAt(particleLoc).getLocation().add(0, 1, 0);
//                     world.spawnParticle(Particle.SMOKE, groundLoc, 1, 0.2, 0, 0.2, 0);
//                 }
//                 
//                 // Affect players in the rain
//                 for(Player player : world.getPlayers()) {
//                     Location playerLoc = player.getLocation();
//                     if(playerLoc.distance(center) <= RADIUS) {
//                         // Check if player is exposed to sky
//                         Location above = playerLoc.clone();
//                         boolean exposed = true;
//                         for(int y = 0; y < 20; y++) {
//                             above.add(0, 1, 0);
//                             if(above.getBlock().getType().isSolid()) {
//                                 exposed = false;
//                                 break;
//                             }
//                         }
//                         
//                         if(exposed) {
//                             player.damage(1.0); // Acid damage
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.POISON, 60, 0));
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.DARKNESS, 100, 0));
//                         }
//                     }
//                 }
//                 
//                 // Damage certain blocks
//                 if(Math.random() < 0.1) { // 10% chance each tick
//                     for(int x = -RADIUS; x <= RADIUS; x++) {
//                         for(int z = -RADIUS; z <= RADIUS; z++) {
//                             if(Math.random() < 0.05) { // 5% chance per block
//                                 Location blockLoc = center.clone().add(x, 0, z);
//                                 blockLoc.setY(world.getHighestBlockYAt(blockLoc));
//                                 Block block = blockLoc.getBlock();
//                                 
//                                 // Dissolve leaves and plants
//                                 if(block.getType().name().contains("LEAVES") || 
//                                    block.getType().name().contains("GRASS") ||
//                                    block.getType().name().contains("FLOWERS")) {
//                                     block.setType(Material.AIR);
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
//         };
//         rainTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 5L);
//     }
//
//     @Override
//     public void stop() {
//         if(rainTask != null) {
//             rainTask.cancel();
//         }
//     }
//
//     @Override
//     public String getName() {
//         return "acidrain";
//     }
// }
