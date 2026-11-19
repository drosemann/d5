// Goose-Port-Spiegel von: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/DisasterManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/DisasterManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-apocalypseunleashed/src/main/java/apocalypse/disasters/DisasterManager.java), unveraendert, als Inline-Doku ----
// package apocalypse.disasters;
//
// import org.bukkit.Location;
// import org.bukkit.World;
// import apocalypse.ApocalypsePlugin;
// import java.util.HashMap;
// import java.util.Map;
//
// public class DisasterManager {
//     private final ApocalypsePlugin plugin;
//     private final Map<String, Disaster> activeDisasters;
//     private final String[] availableDisasters = {
//         "meteor", "flood", "earthquake", "tornado", "wildfire", "volcano", 
//         "blizzard", "sandstorm", "acidrain", "radiation", "sinkhole", 
//         "thunderstorm", "plague", "locustswarm", "asteroidrain"
//     };
//     
//     public DisasterManager(ApocalypsePlugin plugin) {
//         this.plugin = plugin;
//         this.activeDisasters = new HashMap<>();
//     }
//
//     public String[] getAvailableDisasters() {
//         return availableDisasters;
//     }
//
//     public void startDisaster(String type) {
//         World world = plugin.getServer().getWorlds().get(0);
//         Location location = getRandomPlayerLocation(world);
//         
//         Disaster disaster = switch(type.toLowerCase()) {
//             case "meteor" -> new MeteorDisaster(world, location);
//             case "flood" -> new FloodDisaster(world, location);
//             case "earthquake" -> new EarthquakeDisaster(world, location);
//             case "tornado" -> new TornadoDisaster(world, location);
//             case "wildfire" -> new WildfireDisaster(world, location);
//             case "volcano" -> new VolcanicDisaster(world, location);
//             case "blizzard" -> new BlizzardDisaster(world, location);
//             case "sandstorm" -> new SandstormDisaster(world, location);
//             case "acidrain" -> new AcidRainDisaster(world, location);
//             case "radiation" -> new RadiationDisaster(world, location);
//             case "sinkhole" -> new SinkholeDisaster(world, location);
//             case "thunderstorm" -> new ThunderstormDisaster(world, location);
//             case "plague" -> new PlagueDisaster(world, location);
//             case "locustswarm" -> new LocustSwarmDisaster(world, location);
//             case "asteroidrain" -> new AsteroidRainDisaster(world, location);
//             default -> throw new IllegalArgumentException("Unknown disaster type: " + type);
//         };
//
//         disaster.start();
//         activeDisasters.put(type.toLowerCase(), disaster);
//         plugin.getLogger().info("Started disaster: " + type);
//     }
//
//     private Location getRandomPlayerLocation(World world) {
//         if (world.getPlayers().isEmpty()) {
//             return world.getSpawnLocation();
//         }
//         
//         // Get a random player
//         int randomIndex = (int) (Math.random() * world.getPlayers().size());
//         Location playerLoc = world.getPlayers().get(randomIndex).getLocation();
//         
//         // Get a location near the player (within 20-50 blocks)
//         double distance = 20 + Math.random() * 30;
//         double angle = Math.random() * 2 * Math.PI;
//         
//         Location disasterLoc = playerLoc.clone();
//         disasterLoc.add(
//             Math.cos(angle) * distance,
//             0,
//             Math.sin(angle) * distance
//         );
//         
//         // Find the highest block at this location
//         disasterLoc.setY(world.getHighestBlockYAt(disasterLoc));
//         
//         return disasterLoc;
//     }
//
//     public void stopDisaster(String type) {
//         Disaster disaster = activeDisasters.remove(type.toLowerCase());
//         if (disaster != null) {
//             disaster.stop();
//             plugin.getLogger().info("Stopped disaster: " + type);
//         }
//     }
//
//     public void stopAllDisasters() {
//         activeDisasters.values().forEach(Disaster::stop);
//         activeDisasters.clear();
//         plugin.getLogger().info("Stopped all disasters");
//     }
//
//     public boolean hasActiveDisasters() {
//         return !activeDisasters.isEmpty();
//     }
// }
