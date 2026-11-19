import org.bukkit.entity.Player;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class TeamManager {
    private final Map<String, Set<Player>> teams = new HashMap<>();

    public void createTeam(String teamName) {
        if (!teams.containsKey(teamName)) {
            teams.put(teamName, new HashSet<>());
        }
    }

    public void addPlayerToTeam(Player player, String teamName) {
        if (teams.containsKey(teamName)) {
            teams.get(teamName).add(player);
            player.sendMessage("You have joined the team: " + teamName);
        } else {
            player.sendMessage("Team " + teamName + " does not exist!");
        }
    }

    public void removePlayerFromTeam(Player player) {
        for (Set<Player> team : teams.values()) {
            if (team.remove(player)) {
                player.sendMessage("You have been removed from your team.");
                return;
            }
        }
        player.sendMessage("You are not in any team.");
    }

    public Set<Player> getPlayersInTeam(String teamName) {
        return teams.getOrDefault(teamName, new HashSet<>());
    }

    public Map<String, Set<Player>> getAllTeams() {
        return teams;
    }
} 