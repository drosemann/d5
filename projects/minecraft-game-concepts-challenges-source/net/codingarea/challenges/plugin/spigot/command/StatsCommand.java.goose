// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/StatsCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/StatsCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/StatsCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import java.io.IOException;
// import java.util.Map;
// import java.util.UUID;
// import java.util.concurrent.ConcurrentHashMap;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.AnimatedInventory;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.cloud.CloudSupportManager;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.stats.LeaderboardInfo;
// import net.codingarea.challenges.plugin.management.stats.PlayerStats;
// import net.codingarea.challenges.plugin.management.stats.Statistic;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.StatsHelper;
// import net.codingarea.challenges.plugin.utils.misc.Utils;
// import org.bukkit.Bukkit;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
//
// public class StatsCommand implements PlayerCommand {
//    private final Map submitTimeByPlayer = new ConcurrentHashMap();
//
//    public void onCommand(@Nonnull Player player, @Nonnull String[] args) {
//       if (!Challenges.getInstance().getStatsManager().isEnabled()) {
//          Message.forName("feature-disabled").send(player, Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.play(player);
//       } else if (!Challenges.getInstance().getStatsManager().hasDatabaseConnection()) {
//          Message.forName("no-database-connection").send(player, Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.play(player);
//       } else if (System.currentTimeMillis() - (Long)this.submitTimeByPlayer.getOrDefault(player, System.currentTimeMillis() - 10000L) < 5000L) {
//          SoundSample.BASS_OFF.play(player);
//       } else {
//          this.submitTimeByPlayer.put(player, System.currentTimeMillis());
//          switch(args.length) {
//          case 0:
//             Message.forName("fetching-data").send(player, Prefix.CHALLENGES);
//             this.handleCommand(player);
//             break;
//          case 1:
//             Message.forName("fetching-data").send(player, Prefix.CHALLENGES);
//             this.handleCommand(player, args[0]);
//             break;
//          default:
//             Message.forName("syntax").send(player, Prefix.CHALLENGES, "stats [player]");
//          }
//
//       }
//    }
//
//    private void handleCommand(@Nonnull Player player) {
//       Challenges.getInstance().runAsync(() -> {
//          this.open(player, player.getUniqueId(), player.getName());
//       });
//    }
//
//    private void handleCommand(@Nonnull Player player, @Nonnull String name) {
//       Challenges.getInstance().runAsync(() -> {
//          Player target = Bukkit.getPlayer(name);
//          if (target != null) {
//             this.open(player, target.getUniqueId(), target.getName());
//          } else {
//             try {
//                UUID uuid = Utils.fetchUUID(name);
//                this.open(player, uuid, name);
//             } catch (IOException var5) {
//                player.sendMessage(Prefix.CHALLENGES + "§7Something went wrong");
//             }
//
//          }
//       });
//    }
//
//    private void open(@Nonnull Player player, @Nonnull UUID uuid, @Nonnull String name) {
//       PlayerStats stats = Challenges.getInstance().getStatsManager().getStats(uuid, name);
//       name = stats.getPlayerName();
//       CloudSupportManager cloudSupport = Challenges.getInstance().getCloudSupportManager();
//       String coloredName = cloudSupport.isNameSupport() && cloudSupport.hasNameFor(uuid) ? cloudSupport.getColoredName(uuid) : name;
//       AnimatedInventory inventory = new AnimatedInventory(InventoryTitleManager.getStatsTitle(name), 45, MenuPosition.HOLDER);
//       StatsHelper.setAccent(inventory, 3);
//       inventory.cloneLastAndAdd().setItem(13, (ItemStack)(new ItemBuilder.SkullBuilder(uuid, name, Message.forName("stats-of").asString(coloredName), new String[0])).build());
//       LeaderboardInfo info = Challenges.getInstance().getStatsManager().getLeaderboardInfo(uuid);
//       this.createInventory(stats, info, inventory, StatsHelper.getSlots(2));
//       MenuPosition.setEmpty(player);
//       inventory.open(player, Challenges.getInstance());
//       this.submitTimeByPlayer.remove(player);
//    }
//
//    private void createInventory(@Nonnull PlayerStats stats, @Nonnull LeaderboardInfo info, @Nonnull AnimatedInventory inventory, @Nonnull int... slots) {
//       for(int i = 0; i < Statistic.values().length; ++i) {
//          Statistic statistic = Statistic.values()[i];
//          double value = stats.getStatisticValue(statistic);
//          String format = statistic.formatChat(value);
//          ItemBuilder item = (new ItemBuilder(StatsHelper.getMaterial(statistic), StatsHelper.getNameMessage(statistic).asString())).setLore(Message.forName("stats-display").asArray(format, info.getPlace(statistic))).hideAttributes();
//          inventory.cloneLastAndAdd().setItem(slots[i], (net.anweisen.utilities.bukkit.utils.item.ItemBuilder)item);
//       }
//
//    }
// }
//
