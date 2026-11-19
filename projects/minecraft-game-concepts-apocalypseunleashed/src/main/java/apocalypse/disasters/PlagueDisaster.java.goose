// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/PlagueDisaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/PlagueDisaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/PlagueDisaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.Material;
// import org.bukkit.Particle;
// import org.bukkit.entity.Player;
// import org.bukkit.scheduler.BukkitRunnable;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public class PlagueDisaster extends Disaster {
//     private static final int RADIUS = 30;
//     private static final double INFECTION_CHANCE = 0.3;
//     private BukkitRunnable plagueTask;
//     
//     public PlagueDisaster(World world, Location location) {
//         super(world, location);
//     }
//
//     @Override
//     public void start() {
//         Location center = location.clone();
//         
//         plagueTask = new BukkitRunnable() {
//             @Override
//             public void run() {
//                 for(Player player : world.getPlayers()) {
//                     if(player.getLocation().distance(center) <= RADIUS) {
//                         // Chance to infect player
//                         if(Math.random() < INFECTION_CHANCE) {
//                             // Apply plague effects
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.POISON, 200, 0));
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.DARKNESS, 200, 0));
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.HUNGER, 300, 1));
//                             player.addPotionEffect(new PotionEffect(PotionEffectType.WEAKNESS, 200, 1));
//                             
//                             // Visual effects
//                             world.spawnParticle(Particle.SOUL, player.getLocation().add(0, 1, 0), 
//                                               30, 0.5, 1, 0.5, 0);
//                         }
//                     }
//                 }
//                 
//                 // Plague clouds
//                 for(int i = 0; i < 5; i++) {
//                     double x = center.getX() + (Math.random() - 0.5) * RADIUS * 2;
//                     double y = center.getY() + Math.random() * 10;
//                     double z = center.getZ() + (Math.random() - 0.5) * RADIUS * 2;
//                     Location cloudLoc = new Location(world, x, y, z);
//                     world.spawnParticle(Particle.SOUL, cloudLoc, 50, 2, 2, 2, 0);
//                 }
//             }
//         };
//         plagueTask.runTaskTimer(apocalypse.ApocalypsePlugin.getInstance(), 0L, 20L);
//     }
//
//     @Override
//     public void stop() {
//         if(plagueTask != null) {
//             plagueTask.cancel();
//         }
//         
//         // Clear effects from nearby players
//         for(Player player : world.getPlayers()) {
//             if(player.getLocation().distance(location) <= RADIUS) {
//                 player.removePotionEffect(PotionEffectType.POISON);
//                 player.removePotionEffect(PotionEffectType.DARKNESS);
//                 player.removePotionEffect(PotionEffectType.HUNGER);
//                 player.removePotionEffect(PotionEffectType.WEAKNESS);
//             }
//         }
//     }
//
//     @Override
//     public String getName() {
//         return "plague";
//     }
// }
