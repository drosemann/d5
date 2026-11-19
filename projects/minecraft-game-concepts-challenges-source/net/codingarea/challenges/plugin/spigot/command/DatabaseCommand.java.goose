// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/DatabaseCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/DatabaseCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/DatabaseCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import com.google.common.collect.Lists;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import net.codingarea.challenges.plugin.utils.misc.Utils;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandSender;
// import org.bukkit.command.TabCompleter;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.NotNull;
// import org.jetbrains.annotations.Nullable;
//
// public class DatabaseCommand implements PlayerCommand, TabCompleter {
//    private final Map databaseExecutors = new HashMap();
//    private final boolean savePlayerConfigs = Challenges.getInstance().getConfigDocument().getBoolean("save-player-configs");
//    private final boolean savePlayerChallenges = Challenges.getInstance().getConfigDocument().getBoolean("save-player-custom_challenges");
//
//    public DatabaseCommand() {
//       this.databaseExecutors.put("settings", new DatabaseCommand.DatabaseCommandExecutor() {
//          public void save(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerConfigs, player)) {
//                Challenges.getInstance().getChallengeManager().saveSettings(player);
//                Message.forName("player-config-loaded").send(player, Prefix.CHALLENGES);
//             }
//          }
//
//          public void load(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerConfigs, player)) {
//                Document config = Challenges.getInstance().getDatabaseManager().getDatabase().query("challenges").select("config").where("uuid", (Object)player.getUniqueId()).execute().firstOrEmpty().getDocument("config");
//                Challenges.getInstance().getChallengeManager().loadSettings(config);
//                Message.forName("player-config-loaded").send(player, Prefix.CHALLENGES);
//             }
//          }
//
//          public void reset(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerConfigs, player)) {
//                Challenges.getInstance().getDatabaseManager().getDatabase().update("challenges").where("uuid", (Object)player.getUniqueId()).set("config", (Object)null).execute();
//                Message.forName("player-config-reset").send(player, Prefix.CHALLENGES);
//             }
//          }
//       });
//       this.databaseExecutors.put("customs", new DatabaseCommand.DatabaseCommandExecutor() {
//          public void save(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerChallenges, player)) {
//                Challenges.getInstance().getChallengeManager().saveCustomChallenges(player);
//                Message.forName("player-custom_challenges-saved").send(player, Prefix.CHALLENGES);
//             }
//          }
//
//          public void load(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerChallenges, player)) {
//                Document config = Challenges.getInstance().getDatabaseManager().getDatabase().query("challenges").select("custom_challenges").where("uuid", (Object)player.getUniqueId()).execute().firstOrEmpty().getDocument("custom_challenges");
//                Challenges.getInstance().getChallengeManager().loadCustomChallenges(config);
//                Message.forName("player-custom_challenges-loaded").send(player, Prefix.CHALLENGES);
//             }
//          }
//
//          public void reset(Player player) throws Exception {
//             if (!DatabaseCommand.this.checkFeatureDisabled(DatabaseCommand.this.savePlayerChallenges, player)) {
//                Challenges.getInstance().getDatabaseManager().getDatabase().update("challenges").where("uuid", (Object)player.getUniqueId()).set("custom_challenges", (Object)null).execute();
//                Message.forName("player-custom_challenges-reset").send(player, Prefix.CHALLENGES);
//             }
//          }
//       });
//    }
//
//    public void onCommand(@NotNull Player player, @NotNull String[] args) throws Exception {
//       if (!this.checkFeatureDisabled(Challenges.getInstance().getDatabaseManager().isConnected(), player)) {
//          if (args.length == 2 && this.databaseExecutors.containsKey(args[1])) {
//             String type = args[1].toLowerCase();
//             DatabaseCommand.DatabaseCommandExecutor executor = (DatabaseCommand.DatabaseCommandExecutor)this.databaseExecutors.get(type);
//             String var5 = args[0].toLowerCase();
//             byte var6 = -1;
//             switch(var5.hashCode()) {
//             case 3327206:
//                if (var5.equals("load")) {
//                   var6 = 1;
//                }
//                break;
//             case 3522941:
//                if (var5.equals("save")) {
//                   var6 = 0;
//                }
//                break;
//             case 108404047:
//                if (var5.equals("reset")) {
//                   var6 = 2;
//                }
//             }
//
//             switch(var6) {
//             case 0:
//                executor.save(player);
//                break;
//             case 1:
//                executor.load(player);
//                break;
//             case 2:
//                executor.reset(player);
//                break;
//             default:
//                Message.forName("syntax").send(player, Prefix.CHALLENGES, "database <save/load/reset> <settings/customs>");
//             }
//
//          } else {
//             Message.forName("syntax").send(player, Prefix.CHALLENGES, "database <save/load/reset> <settings/customs>");
//          }
//       }
//    }
//
//    private boolean checkFeatureDisabled(boolean enabled, @Nonnull Player player) {
//       if (!enabled) {
//          Message.forName("feature-disabled").send(player, Prefix.CHALLENGES);
//          SoundSample.BASS_OFF.play(player);
//          return true;
//       } else {
//          return false;
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String alias, @NotNull String[] args) {
//       if (args.length <= 1) {
//          return Utils.filterRecommendations(args[0], "save", "load", "reset");
//       } else {
//          return (List)(args.length <= 2 ? Utils.filterRecommendations(args[1], (String[])this.databaseExecutors.keySet().toArray(new String[0])) : Lists.newLinkedList());
//       }
//    }
//
//    private interface DatabaseCommandExecutor {
//       void save(Player var1) throws Exception;
//
//       void load(Player var1) throws Exception;
//
//       void reset(Player var1) throws Exception;
//    }
// }
//
