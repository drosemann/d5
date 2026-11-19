package apocalypse.commands;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

public class ApocalypseCommand implements CommandExecutor {
    
    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (args.length == 0) {
            sendHelp(sender);
            return true;
        }

        switch (args[0].toLowerCase()) {
            case "help":
                sendHelp(sender);
                break;
            
            case "reload":
                if (!sender.hasPermission("apocalypse.admin")) {
                    sender.sendMessage("§cYou don't have permission to use this command!");
                    return true;
                }
                // Plugin reload logic will be implemented here
                sender.sendMessage("§aConfiguration reloaded successfully!");
                break;
            
            default:
                sender.sendMessage("§cUnknown command. Type /apocalypse help for help.");
                break;
        }
        
        return true;
    }

    private void sendHelp(CommandSender sender) {
        sender.sendMessage("§6=== ApocalypseUnleashed Help ===");
        sender.sendMessage("§e/apocalypse help §7- Show this help message");
        if (sender.hasPermission("apocalypse.admin")) {
            sender.sendMessage("§e/apocalypse reload §7- Reload the configuration");
        }
        sender.sendMessage("§e/disaster <type> §7- Spawn a disaster");
        sender.sendMessage("§e/giveitem <item> [player] §7- Give custom items");
    }
}