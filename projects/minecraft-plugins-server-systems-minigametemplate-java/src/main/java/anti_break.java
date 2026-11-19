import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.BlockBreakEvent;

public class BlockBreakListener implements Listener {
    @EventHandler
    public void onBlockBreak(BlockBreakEvent event) {
        Player player = event.getPlayer();
        // Überprüfe, ob der Block während des Spiels platziert wurde
        if (!isPlacedDuringGame(event.getBlock())) {
            event.setCancelled(true);
            player.sendMessage("Du kannst diesen Block nicht abbauen!");
        }
    }

    private boolean isPlacedDuringGame(Block block) {
        // Implementiere die Logik, um zu überprüfen, ob der Block während des Spiels platziert wurde
        return false;
    }
}
