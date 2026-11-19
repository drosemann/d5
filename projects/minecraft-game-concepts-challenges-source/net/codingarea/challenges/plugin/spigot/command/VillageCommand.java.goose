// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/VillageCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/VillageCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/VillageCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import org.bukkit.Bukkit;
// import org.bukkit.Location;
// import org.bukkit.StructureType;
// import org.bukkit.entity.Player;
//
// public class VillageCommand implements PlayerCommand {
//    public void onCommand(@Nonnull Player player, @Nonnull String[] args) throws Exception {
//       player.setNoDamageTicks(10);
//       Message.forName("command-village-search").send(player, Prefix.CHALLENGES);
//       Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
//          Location village = player.getWorld().locateNearestStructure(player.getLocation(), StructureType.VILLAGE, 5000, true);
//          if (village == null) {
//             Message.forName("command-village-not-found").send(player, Prefix.CHALLENGES);
//          } else {
//             village = player.getWorld().getHighestBlockAt(village).getLocation().add(0.5D, 1.0D, 0.5D);
//             village.getChunk().load(true);
//             Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
//                player.teleport(village);
//                SoundSample.TELEPORT.play(player);
//                Message.forName("command-village-teleport").send(player, Prefix.CHALLENGES);
//             }, 20L);
//          }
//       });
//    }
// }
//
