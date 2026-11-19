package com.hearthrift.worlds;

import com.onarandombox.MultiverseCore.MultiverseCore;
import com.onarandombox.MultiverseCore.api.MVWorldManager;
import org.bukkit.Bukkit;
import org.bukkit.World;
import org.bukkit.WorldCreator;
import org.bukkit.WorldType;
import org.bukkit.entity.Player;
import org.bukkit.plugin.Plugin;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CompletableFuture;

public class WorldManager {
    private final Map<UUID, String> playerWorlds = new HashMap<>();
    private final Map<String, WorldPermissions> worldPermissions = new HashMap<>();
    private final MultiverseCore multiverseCore;
    private final MVWorldManager worldManager;

    public WorldManager() {
        Plugin mvPlugin = Bukkit.getPluginManager().getPlugin("Multiverse-Core");
        if (mvPlugin instanceof MultiverseCore) {
            this.multiverseCore = (MultiverseCore) mvPlugin;
            this.worldManager = multiverseCore.getMVWorldManager();
        } else {
            throw new RuntimeException("Multiverse-Core is required but not found!");
        }
        
        // Create default worlds
        createDefaultWorlds();
    }

    private void createDefaultWorlds() {
        // Create ENTRY world
        if (!worldManager.isMVWorld("ENTRY")) {
            worldManager.addWorld(
                "ENTRY",
                World.Environment.NORMAL,
                null,
                WorldType.NORMAL,
                true,
                null
            );
        }

        // Create RIFT world
        if (!worldManager.isMVWorld("RIFT")) {
            worldManager.addWorld(
                "RIFT",
                World.Environment.NORMAL,
                null,
                WorldType.NORMAL,
                true,
                null
            );
        }
    }
    
    public CompletableFuture<World> createPlayerWorld(Player player) {
        CompletableFuture<World> future = new CompletableFuture<>();
        String worldName = player.getName() + "_HEARTH";
        
        // Schedule the world creation on the main thread
        Bukkit.getScheduler().runTask(Bukkit.getPluginManager().getPlugin("Hearthrift"), () -> {
            try {
                if (!worldManager.isMVWorld(worldName)) {
                    boolean success = worldManager.addWorld(
                        worldName,
                        World.Environment.NORMAL,
                        null,
                        WorldType.NORMAL,
                        true,
                        null
                    );
                    
                    if (!success) {
                        future.complete(null);
                        return;
                    }
                }
                
                World world = worldManager.getMVWorld(worldName).getCBWorld();
                if (world != null) {
                    playerWorlds.put(player.getUniqueId(), worldName);
                    worldPermissions.put(worldName, new WorldPermissions(player.getUniqueId()));
                }
                future.complete(world);
            } catch (Exception e) {
                future.completeExceptionally(e);
            }
        });
        
        return future;
    }
    
    public boolean hasWorld(Player player) {
        return playerWorlds.containsKey(player.getUniqueId());
    }
    
    public String getPlayerWorldName(Player player) {
        return playerWorlds.get(player.getUniqueId());
    }
    
    public boolean canAccess(Player player, String worldName) {
        WorldPermissions perms = worldPermissions.get(worldName);
        return perms != null && perms.hasAccess(player.getUniqueId());
    }
    
    public void grantAccess(Player owner, Player guest) {
        String worldName = getPlayerWorldName(owner);
        if (worldName != null) {
            WorldPermissions perms = worldPermissions.get(worldName);
            if (perms != null) {
                perms.addGuest(guest.getUniqueId());
            }
        }
    }
    
    public void revokeAccess(Player owner, Player guest) {
        String worldName = getPlayerWorldName(owner);
        if (worldName != null) {
            WorldPermissions perms = worldPermissions.get(worldName);
            if (perms != null) {
                perms.removeGuest(guest.getUniqueId());
            }
        }
    }
    
    public WorldPermissions getWorldPermissions(String worldName) {
        return worldPermissions.get(worldName);
    }
}