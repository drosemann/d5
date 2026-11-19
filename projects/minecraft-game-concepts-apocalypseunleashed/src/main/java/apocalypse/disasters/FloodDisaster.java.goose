// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/FloodDisaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/FloodDisaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/FloodDisaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.Material;
// import org.bukkit.entity.FallingBlock;
//
// public class FloodDisaster extends Disaster {
//     private static final int FLOOD_HEIGHT = 5;
//     private static final int FLOOD_RADIUS = 20;
//     
//     public FloodDisaster(World world, Location location) {
//         super(world, location);
//     }
//
//     @Override
//     public void start() {
//         Location center = location.clone();
//         for(int x = -FLOOD_RADIUS; x <= FLOOD_RADIUS; x++) {
//             for(int z = -FLOOD_RADIUS; z <= FLOOD_RADIUS; z++) {
//                 if(x*x + z*z <= FLOOD_RADIUS*FLOOD_RADIUS) {
//                     Location loc = center.clone().add(x, 0, z);
//                     for(int y = 0; y < FLOOD_HEIGHT; y++) {
//                         loc.clone().add(0, y, 0).getBlock().setType(Material.WATER);
//                     }
//                 }
//             }
//         }
//     }
//
//     @Override
//     public void stop() {
//         Location center = location.clone();
//         for(int x = -FLOOD_RADIUS; x <= FLOOD_RADIUS; x++) {
//             for(int z = -FLOOD_RADIUS; z <= FLOOD_RADIUS; z++) {
//                 if(x*x + z*z <= FLOOD_RADIUS*FLOOD_RADIUS) {
//                     Location loc = center.clone().add(x, 0, z);
//                     for(int y = 0; y < FLOOD_HEIGHT; y++) {
//                         Location blockLoc = loc.clone().add(0, y, 0);
//                         if(blockLoc.getBlock().getType() == Material.WATER) {
//                             blockLoc.getBlock().setType(Material.AIR);
//                         }
//                     }
//                 }
//             }
//         }
//     }
//
//     @Override
//     public String getName() {
//         return "flood";
//     }
// }
