// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TopCommandSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TopCommandSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/TopCommandSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.entity.Player;
//
// public class TopCommandSetting extends Setting implements PlayerCommand {
//    public TopCommandSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    public void onCommand(@Nonnull Player player, @Nonnull String[] args) {
//       if (!this.isEnabled()) {
//          Message.forName("feature-disabled").send(player, Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.play(player);
//       } else {
//          World world = player.getWorld();
//          Environment environment = world.getEnvironment();
//          Location playerLocation = player.getLocation();
//          Location location;
//          if (environment == Environment.NORMAL) {
//             Message.forName("top-to-surface").send(player, Prefix.CHALLENGES);
//             location = player.getWorld().getHighestBlockAt(playerLocation).getLocation().add(0.5D, 1.0D, 0.5D);
//             location.setYaw(playerLocation.getYaw());
//             location.setPitch(playerLocation.getPitch());
//             player.setFallDistance(0.0F);
//             player.teleport(location);
//          } else {
//             Message.forName("top-to-overworld").send(player, Prefix.CHALLENGES);
//             if (environment == Environment.NETHER) {
//                location = playerLocation.clone();
//                world = ChallengeAPI.getGameWorld(Environment.NORMAL);
//                location.setWorld(world);
//                location.multiply(8.0D);
//                location = world.getHighestBlockAt(location).getLocation().add(0.5D, 1.0D, 0.5D);
//                player.setFallDistance(0.0F);
//                player.teleport(location);
//             } else {
//                world = ChallengeAPI.getGameWorld(Environment.NORMAL);
//                location = player.getBedSpawnLocation();
//                if (location == null) {
//                   location = world.getSpawnLocation();
//                }
//
//                player.setFallDistance(0.0F);
//                player.teleport(location);
//             }
//          }
//
//          SoundSample.TELEPORT.play(player);
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.MAGENTA_GLAZED_TERRACOTTA, Message.forName("top-command-setting"));
//    }
// }
//
