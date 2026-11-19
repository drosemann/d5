// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/Disaster.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/Disaster.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/Disaster.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.Particle;
// import org.bukkit.Sound;
// import org.bukkit.World;
// import apocalypse.utils.VisualEffectUtil;
//
// public abstract class Disaster {
//     protected final World world;
//     protected final Location location;
//     
//     public Disaster(World world, Location location) {
//         this.world = world;
//         this.location = location;
//     }
//
//     public abstract void start();
//     public abstract void stop();
//     public abstract String getName();
//
//     public World getWorld() {
//         return world;
//     }
//
//     public Location getLocation() {
//         return location;
//     }
//
//     // Common visual effect methods that can be used by all disasters
//     protected void createDisasterCloud(Particle particle, double radius, int count) {
//         VisualEffectUtil.createParticleCloud(location, particle, radius, count, 0.5);
//     }
//
//     protected void createDisasterSphere(Particle particle, double radius) {
//         VisualEffectUtil.createParticleSphere(location, particle, radius, 15);
//     }
//
//     protected void createDisasterColumn(Particle particle, double height) {
//         VisualEffectUtil.createParticleColumn(location, particle, height, 20);
//     }
//
//     public void playDisasterSound(Sound sound, float volume, float pitch) {
//         VisualEffectUtil.playSound(location, sound, volume, pitch);
//     }
// }
