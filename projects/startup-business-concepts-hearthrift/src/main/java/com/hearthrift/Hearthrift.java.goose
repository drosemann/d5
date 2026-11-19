// Goose-Port-Spiegel von: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/Hearthrift.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/Hearthrift.java");
}

// ---- Original-Code (projects/startup-business-concepts-hearthrift/src/main/java/com/hearthrift/Hearthrift.java), unveraendert, als Inline-Doku ----
// package com.hearthrift;
//
// import com.hearthrift.worlds.WorldManager;
// import com.hearthrift.tutorial.TutorialManager;
// import com.hearthrift.rewards.RewardManager;
// import com.hearthrift.commands.WorldCommand;
// import org.bukkit.World;
// import org.bukkit.WorldCreator;
// import org.bukkit.plugin.java.JavaPlugin;
//
// import java.util.Objects;
//
// public final class Hearthrift extends JavaPlugin {
//
//     private static final String ENTRY_WORLD = "ENTRY";
//     private static final String RIFT_WORLD = "RIFT";
//
//     private WorldManager worldManager;
//     private TutorialManager tutorialManager;
//     private RewardManager rewardManager;
//
//     @Override
//     public void onEnable() {
//         saveDefaultConfig();
//
//         worldManager = new WorldManager();               // korrekt
//         tutorialManager = new TutorialManager(this);    // this übergeben
//         rewardManager = new RewardManager(this);        // this übergeben
//
//         createWorldIfMissing(ENTRY_WORLD, World.Environment.NORMAL);
//         createWorldIfMissing(RIFT_WORLD, World.Environment.NORMAL);
//
//         getServer().getPluginManager().registerEvents(new PlayerListener(this), this);
//         Objects.requireNonNull(getCommand("world")).setExecutor(new WorldCommand(this));
//
//         getLogger().info(getDescription().getName() + " enabled.");
//     }
//
//     @Override
//     public void onDisable() {
//         // shutdown() existiert nicht → nur Felder auf null setzen oder eigene Cleanup-Methoden aufrufen
//         worldManager = null;
//         tutorialManager = null;
//         rewardManager = null;
//
//         getLogger().info(getDescription().getName() + " disabled.");
//     }
//
//     private void createWorldIfMissing(String name, World.Environment environment) {
//         if (getServer().getWorld(name) == null) {
//             new WorldCreator(name).environment(environment).createWorld();
//             getLogger().info("Created missing world: " + name);
//         }
//     }
//
//     public WorldManager getWorldManager() { return worldManager; }
//     public TutorialManager getTutorialManager() { return tutorialManager; }
//     public RewardManager getRewardManager() { return rewardManager; }
// }
//
