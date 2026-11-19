package apocalypse.commands;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import apocalypse.disasters.DisasterManager;

public class DisasterCommand implements CommandExecutor {
    private final DisasterManager disasterManager;

    public DisasterCommand(DisasterManager disasterManager) {
        this.disasterManager = disasterManager;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (args.length < 1) {
            sender.sendMessage("§cUsage: /disaster <start|stop> [type]");
            return false;
        }

        String action = args[0].toLowerCase();
        String type = args.length > 1 ? args[1].toLowerCase() : null;

        switch (action) {
            case "start":
                if (type == null) {
                    sender.sendMessage("§cPlease specify a disaster type!");
                    return false;
                }
                disasterManager.startDisaster(type);
                sender.sendMessage("§aStarting disaster: " + type);
                break;
            case "stop":
                if (type == null) {
                    disasterManager.stopAllDisasters();
                    sender.sendMessage("§aStopped all disasters");
                } else {
                    disasterManager.stopDisaster(type);
                    sender.sendMessage("§aStopped disaster: " + type);
                }
                break;
            default:
                sender.sendMessage("§cUnknown action. Use 'start' or 'stop'");
                return false;
        }

        return true;
    }
}