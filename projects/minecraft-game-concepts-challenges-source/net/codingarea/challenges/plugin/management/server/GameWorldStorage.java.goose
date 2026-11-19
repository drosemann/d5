// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/GameWorldStorage.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/GameWorldStorage.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/GameWorldStorage.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.server;
//
// import java.util.Collections;
// import java.util.LinkedList;
// import java.util.List;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.management.challenges.entities.GamestateSaveable;
// import net.codingarea.challenges.plugin.spigot.generator.VoidMapGenerator;
// import org.bukkit.Bukkit;
// import org.bukkit.World;
// import org.bukkit.WorldCreator;
// import org.bukkit.WorldType;
// import org.bukkit.World.Environment;
// import org.jetbrains.annotations.NotNull;
//
// public class GameWorldStorage implements GamestateSaveable {
//    private final List worlds = new LinkedList();
//    private World overworld;
//    private World nether;
//    private World end;
//    private World voidWorld;
//
//    public void enable() {
//       Challenges.getInstance().getChallengeManager().registerGameStateSaver(this);
//
//       for(int i = 0; i < 3 && i < Bukkit.getWorlds().size(); ++i) {
//          World world = (World)Bukkit.getWorlds().get(i);
//          switch(i) {
//          case 0:
//             this.overworld = world;
//             this.worlds.add(world);
//             break;
//          case 1:
//             if (world.getEnvironment() == Environment.NETHER) {
//                this.nether = world;
//                this.worlds.add(world);
//             } else if (world.getEnvironment() == Environment.THE_END) {
//                this.end = world;
//                this.worlds.add(world);
//             }
//             break;
//          case 2:
//             if (world.getEnvironment() == Environment.THE_END) {
//                this.end = world;
//                this.worlds.add(world);
//             }
//          }
//       }
//
//    }
//
//    public String getUniqueGamestateName() {
//       return this.getClass().getSimpleName().toLowerCase();
//    }
//
//    public void writeGameState(@NotNull Document document) {
//       document.set("void-generated", this.voidWorld != null);
//    }
//
//    public void loadGameState(@NotNull Document document) {
//       if (document.getBoolean("void-generated")) {
//          this.getOrCreateVoidWorld();
//       }
//
//    }
//
//    @Nonnull
//    public World getOrCreateVoidWorld() {
//       if (this.voidWorld != null) {
//          return this.voidWorld;
//       } else {
//          VoidMapGenerator generator = new VoidMapGenerator();
//          this.voidWorld = (new WorldCreator("void")).type(WorldType.FLAT).generator(generator).createWorld();
//          this.worlds.add(this.voidWorld);
//          return this.voidWorld;
//       }
//    }
//
//    public World getWorld(@Nullable Environment environment) {
//       if (environment == null) {
//          return null;
//       } else {
//          switch(environment) {
//          case NORMAL:
//             return this.overworld;
//          case NETHER:
//             return this.nether;
//          case THE_END:
//             return this.end;
//          case CUSTOM:
//             return Challenges.getInstance().getWorldManager().getExtraWorld();
//          default:
//             return null;
//          }
//       }
//    }
//
//    public List getCustomGeneratedGameWorlds() {
//       return Collections.singletonList("void");
//    }
//
//    public List getGameWorlds() {
//       return Collections.unmodifiableList(this.worlds);
//    }
// }
//
