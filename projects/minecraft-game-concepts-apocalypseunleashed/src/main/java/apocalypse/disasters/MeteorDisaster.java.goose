// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/MeteorDisaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/MeteorDisaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/MeteorDisaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.Material;
// import org.bukkit.entity.FallingBlock;
//
// public class MeteorDisaster extends Disaster {
//     private FallingBlock meteor;
//     
//     public MeteorDisaster(World world, Location location) {
//         super(world, location);
//     }
//
//     @Override
//     public void start() {
//         Location spawnLoc = location.clone().add(0, 60, 0);
//         meteor = world.spawnFallingBlock(spawnLoc, Material.MAGMA_BLOCK.createBlockData());
//         meteor.setDropItem(false);
//         meteor.setHurtEntities(true);
//     }
//
//     @Override
//     public void stop() {
//         if (meteor != null && !meteor.isDead()) {
//             meteor.remove();
//         }
//     }
//
//     @Override
//     public String getName() {
//         return "meteor";
//     }
// }
