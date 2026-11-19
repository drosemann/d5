import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class LobbyCommand implements CommandExecutor {
    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (sender instanceof Player) {
            Player player = (Player) sender;
            // Teleportiere Spieler zur Wartelobby
            player.teleport(new Location(player.getWorld(), x, y, z)); // Setze x, y, z auf die Koordinaten der Wartelobby
            player.sendMessage("Du bist jetzt in der Wartelobby!");
            return true;
        }
        return false;
    }
}
