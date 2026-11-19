// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/WorldServer_1_13.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/WorldServer_1_13.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/WorldServer_1_13.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;
//
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.type.WorldServer;
// import org.bukkit.World;
//
// public class WorldServer_1_13 extends WorldServer {
//    public WorldServer_1_13(World object) throws ClassNotFoundException {
//       super(object, ReflectionUtil.getBukkitClass("CraftWorld"));
//    }
//
//    public Object get(World world) {
//       Object worldServer;
//       try {
//          worldServer = ReflectionUtil.invokeMethod((Class)this.nmsClass, (Object)world, (String)"getHandle");
//       } catch (Exception var4) {
//          Challenges.getInstance().getLogger().error("Failed to get WorldServer:", new Object[]{var4});
//          worldServer = null;
//       }
//
//       return worldServer;
//    }
// }
//
