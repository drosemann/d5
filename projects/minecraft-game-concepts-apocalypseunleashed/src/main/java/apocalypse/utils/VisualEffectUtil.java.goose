// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/VisualEffectUtil.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/VisualEffectUtil.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/utils/VisualEffectUtil.java), unveraendert, als Inline-Doku ----
// package apocalypse.utils;
//
// import org.bukkit.Location;
// import org.bukkit.Particle;
// import org.bukkit.Sound;
// import org.bukkit.World;
//
// public class VisualEffectUtil {
//     
//     /**
//      * Creates a particle sphere effect at the given location
//      * @param location The center location of the sphere
//      * @param particle The particle type to display
//      * @param radius The radius of the sphere
//      * @param density Number of particles per block (density)
//      */
//     public static void createParticleSphere(Location location, Particle particle, double radius, int density) {
//         World world = location.getWorld();
//         for (double i = 0; i <= Math.PI; i += Math.PI / density) {
//             double radius_sin = Math.sin(i);
//             double y = Math.cos(i);
//             for (double a = 0; a < Math.PI * 2; a += Math.PI / density) {
//                 double x = Math.cos(a) * radius_sin;
//                 double z = Math.sin(a) * radius_sin;
//                 Location particleLoc = location.clone().add(x * radius, y * radius, z * radius);
//                 world.spawnParticle(particle, particleLoc, 1, 0, 0, 0, 0);
//             }
//         }
//     }
//
//     /**
//      * Creates a particle cloud effect in an area
//      * @param location The center location
//      * @param particle The particle type to display
//      * @param radius The radius of the effect
//      * @param count Number of particles to spawn
//      * @param speed Speed of the particles
//      */
//     public static void createParticleCloud(Location location, Particle particle, double radius, int count, double speed) {
//         location.getWorld().spawnParticle(particle, location, count, radius, radius, radius, speed);
//     }
//
//     /**
//      * Creates a rising particle column effect
//      * @param location The base location
//      * @param particle The particle type to display
//      * @param height The height of the column
//      * @param density Particles per block of height
//      */
//     public static void createParticleColumn(Location location, Particle particle, double height, int density) {
//         World world = location.getWorld();
//         for (double y = 0; y < height; y += 1.0 / density) {
//             Location particleLoc = location.clone().add(0, y, 0);
//             double radius = Math.sin(y * Math.PI / height) * 0.5;
//             for (double angle = 0; angle < Math.PI * 2; angle += Math.PI / 8) {
//                 double x = Math.cos(angle) * radius;
//                 double z = Math.sin(angle) * radius;
//                 world.spawnParticle(particle, particleLoc.clone().add(x, 0, z), 1, 0, 0, 0, 0);
//             }
//         }
//     }
//
//     /**
//      * Plays a sound with optional pitch and volume variation
//      * @param location The location to play the sound
//      * @param sound The sound to play
//      * @param volume The volume (default 1.0)
//      * @param pitch The pitch (default 1.0)
//      */
//     public static void playSound(Location location, Sound sound, float volume, float pitch) {
//         location.getWorld().playSound(location, sound, volume, pitch);
//     }
// }
