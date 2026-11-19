import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class CustomCommands implements CommandExecutor {
    private final TeamManager teamManager;

    public CustomCommands(TeamManager teamManager) {
        this.teamManager = teamManager;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (command.getName().equalsIgnoreCase("createteam") && args.length == 1) {
            String teamName = args[0];
            teamManager.createTeam(teamName);
            sender.sendMessage("Team " + teamName + " has been created!");
            return true;
        } else if (command.getName().equalsIgnoreCase("jointeam") && args.length == 1) {
            if (sender instanceof Player) {
                Player player = (Player) sender;
                String teamName = args[0];
                teamManager.addPlayerToTeam(player, teamName);
                return true;
            }
        } else if (command.getName().equalsIgnoreCase("teaminfo")) {
            if (sender instanceof Player) {
                Player player = (Player) sender;
                StringBuilder info = new StringBuilder("Teams:\n");
                for (String teamName : teamManager.getAllTeams().keySet()) {
                    info.append(teamName).append(": ").append(teamManager.getPlayersInTeam(teamName).size()).append(" players\n");
                }
                player.sendMessage(info.toString());
                return true;
            }
        }
        return false;
    }
} 