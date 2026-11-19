// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/BackCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/BackCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/BackCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import com.google.common.collect.Lists;
// import java.util.HashMap;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.Map;
// import java.util.UUID;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.implementation.setting.PregameMovementSetting;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.AbstractChallenge;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandSender;
// import org.bukkit.command.TabCompleter;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
// import org.bukkit.event.player.PlayerTeleportEvent;
// import org.bukkit.event.player.PlayerTeleportEvent.TeleportCause;
// import org.jetbrains.annotations.NotNull;
// import org.jetbrains.annotations.Nullable;
//
// public class BackCommand implements PlayerCommand, TabCompleter, Listener {
//    private final Map lastLocations = new HashMap();
//    private boolean inTeleport = false;
//
//    public void onCommand(@NotNull Player player, @NotNull String[] args) throws Exception {
//       int count = 1;
//
//       try {
//          if (args.length > 0) {
//             count = Integer.parseInt(args[0]);
//          }
//       } catch (NumberFormatException var8) {
//          Message.forName("syntax").send(player, Prefix.CHALLENGES, "back [count]");
//          return;
//       }
//
//       List list = (List)this.lastLocations.getOrDefault(player.getUniqueId(), Lists.newArrayList());
//       int savedCount = list.size();
//       if (savedCount == 0) {
//          Message.forName("command-back-no-locations").send(player, Prefix.CHALLENGES);
//       } else {
//          int countToTeleport = Math.min(list.size(), count);
//          Message.forName("command-back-teleported" + (countToTeleport > 1 ? "-multiple" : "")).send(player, Prefix.CHALLENGES, countToTeleport);
//          Location location = (Location)list.get(countToTeleport - 1);
//          this.inTeleport = true;
//          player.teleport(location);
//          this.inTeleport = false;
//          if (countToTeleport > 0) {
//             list.subList(0, countToTeleport).clear();
//          }
//
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String alias, @NotNull String[] args) {
//       if (!(sender instanceof Player)) {
//          return Lists.newLinkedList();
//       } else {
//          Player player = (Player)sender;
//          LinkedList list = Lists.newLinkedList();
//
//          for(int i = 0; i < ((List)this.lastLocations.getOrDefault(player.getUniqueId(), Lists.newLinkedList())).size(); ++i) {
//             list.add(String.valueOf(i + 1));
//          }
//
//          return list;
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onTeleport(PlayerTeleportEvent event) {
//       if (!this.inTeleport) {
//          if (((PregameMovementSetting)AbstractChallenge.getFirstInstance(PregameMovementSetting.class)).isEnabled() || event.getPlayer().getGameMode() != GameMode.SURVIVAL && event.getPlayer().getGameMode() != GameMode.ADVENTURE || ChallengeAPI.isStarted()) {
//             if (event.getTo() != null) {
//                if (event.getCause() != TeleportCause.ENDER_PEARL && event.getCause() != TeleportCause.CHORUS_FRUIT) {
//                   UUID uuid = event.getPlayer().getUniqueId();
//                   List locations = (List)this.lastLocations.getOrDefault(uuid, Lists.newArrayList());
//                   this.lastLocations.putIfAbsent(uuid, locations);
//                   locations.add(0, event.getFrom());
//                   if (locations.size() > 30) {
//                      locations.remove(locations.size() - 1);
//                   }
//
//                }
//             }
//          }
//       }
//    }
// }
//
