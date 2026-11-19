// Goose-Port-Spiegel von: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/commands/parentcommands/ParentCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/commands/parentcommands/ParentCommand.java");
}

// ---- Original-Code (projects/minecraft-plugins-&-server-systems-bedwars/src/main/java/org/bedwars/bedwarsproject/commands/parentcommands/ParentCommand.java), unveraendert, als Inline-Doku ----
// package org.bedwars.bedwarsproject.commands.parentcommands;
//
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
// import org.bukkit.command.TabCompleter;
// import org.bedwars.bedwarsproject.commands.subcommands.SubCommand;
//
// import java.util.*;
//
// public abstract class ParentCommand implements CommandExecutor, TabCompleter {
//     
//     private final String name;
//     private final Map<String, SubCommand> subCommands = new HashMap<>();
//     private final List<SubCommand> sortedCommands = new ArrayList<>();
//
//     public ParentCommand(String name) {
//         this.name = name;
//     }
//
//     @Override
//     public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
//         if (args.length == 0) {
//             showHelp(sender);
//             return true;
//         }
//
//         SubCommand subCommand = subCommands.get(args[0].toLowerCase());
//         if (subCommand == null || !subCommand.canSee(sender)) {
//             showHelp(sender);
//             return true;
//         }
//
//         String[] subArgs = Arrays.copyOfRange(args, 1, args.length);
//         return subCommand.execute(subArgs, sender);
//     }
//
//     @Override
//     public List<String> onTabComplete(CommandSender sender, Command command, String alias, String[] args) {
//         if (args.length == 1) {
//             List<String> completions = new ArrayList<>();
//             for (SubCommand subCommand : sortedCommands) {
//                 if (subCommand.canSee(sender)) {
//                     completions.add(subCommand.getSubCommandName());
//                 }
//             }
//             return completions;
//         }
//
//         SubCommand subCommand = subCommands.get(args[0].toLowerCase());
//         if (subCommand != null && subCommand.canSee(sender)) {
//             return subCommand.getTabComplete();
//         }
//
//         return new ArrayList<>();
//     }
//
//     public void registerSubCommand(SubCommand subCommand) {
//         subCommands.put(subCommand.getSubCommandName().toLowerCase(), subCommand);
//         sortedCommands.add(subCommand);
//         sortedCommands.sort(Comparator.comparingInt(SubCommand::getPriority));
//     }
//
//     protected void showHelp(CommandSender sender) {
//         sender.sendMessage("§6=== BedWars Help ===");
//         for (SubCommand subCommand : sortedCommands) {
//             if (subCommand.canSee(sender)) {
//                 sender.sendMessage(subCommand.getDisplayInfo());
//             }
//         }
//     }
//
//     public String getName() {
//         return name;
//     }
// }
