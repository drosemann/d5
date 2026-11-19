// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ExecuteCommandAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ExecuteCommandAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/ExecuteCommandAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.List;
// import java.util.Map;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.PlayerTargetAction;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// public class ExecuteCommandAction extends PlayerTargetAction {
//    public static int maxCommandLength = Challenges.getInstance().getConfigDocument().getInt("custom-challenge-settings.max-command-length");
//    private static List commandsThatCanBeExecuted = Challenges.getInstance().getConfigDocument().getStringList("custom-challenge-settings.allowed-commands-to-execute");
//
//    public ExecuteCommandAction(String name) {
//       super(name, (SubSettingsBuilder)SubSettingsHelper.createEntityTargetSettingsBuilder(true, true, true).createTextInputChild("command", (player) -> {
//          Message.forName("custom-command-info").send(player, Prefix.CUSTOM, "/" + String.join(" /", commandsThatCanBeExecuted));
//       }, (event) -> {
//          String cmd = event.getMessage().split(" ")[0].toLowerCase();
//          if (!commandsThatCanBeExecuted.contains(cmd)) {
//             Message.forName("custom-command-not-allowed").send(event.getPlayer(), Prefix.CUSTOM, cmd);
//             return false;
//          } else if (event.getMessage().length() > maxCommandLength) {
//             Message.forName("custom-chars-max_length").send(event.getPlayer(), Prefix.CUSTOM, maxCommandLength);
//             return false;
//          } else {
//             return true;
//          }
//       }));
//       maxCommandLength = Challenges.getInstance().getConfigDocument().getInt("custom-challenge-settings.max-command-length");
//       commandsThatCanBeExecuted = Challenges.getInstance().getConfigDocument().getStringList("custom-challenge-settings.allowed-commands-to-execute");
//    }
//
//    public void executeForPlayer(Player player, Map subActions) {
//       String fullCommand = ((String[])subActions.get("command"))[0];
//       CommandSender sender = Bukkit.getConsoleSender();
//       if (player != null) {
//          fullCommand = "execute as " + player.getName() + " at " + player.getName() + " run " + fullCommand;
//       }
//
//       Bukkit.getServer().dispatchCommand(sender, fullCommand);
//    }
//
//    public Material getMaterial() {
//       return Material.COMMAND_BLOCK;
//    }
// }
//
