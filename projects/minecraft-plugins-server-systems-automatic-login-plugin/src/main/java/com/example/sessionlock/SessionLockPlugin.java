package com.example.sessionlock;

import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.CommandExecutor;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;
import org.bukkit.event.player.PlayerQuitEvent;
import org.bukkit.metadata.FixedMetadataValue;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.HashMap;
import java.util.UUID;

public class SessionLockPlugin extends JavaPlugin implements Listener {

    private final HashMap<UUID, Boolean> playerLoginStatus = new HashMap<>();
    private final HashMap<UUID, String> playerIps = new HashMap<>();
    private final HashMap<UUID, String> playerPasswords = new HashMap<>();

    @Override
    public void onEnable() {
        getLogger().info("SessionLockPlugin has been enabled!");
        getServer().getPluginManager().registerEvents(this, this);
        getCommand("login").setExecutor(new LoginCommandExecutor(this));
        getCommand("register").setExecutor(new RegisterCommandExecutor(this));
    }

    @Override
    public void onDisable() {
        getLogger().info("SessionLockPlugin has been disabled!");
    }

    @EventHandler
    public void onPlayerJoin(PlayerJoinEvent event) {
        Player player = event.getPlayer();
        String currentIp = player.getAddress().getAddress().getHostAddress();

        // Check if the player has a stored IP address
        if (playerIps.containsKey(player.getUniqueId())) {
            String storedIpAddress = playerIps.get(player.getUniqueId());
            
            // Compare stored IP address with current IP address
            if (storedIpAddress.equals(currentIp)) {
                // Player is logging in from the same IP address, log them in automatically
                player.sendMessage("§a✓ Welcome back, you are logged in automatically!");
                playerLoginStatus.put(player.getUniqueId(), true);
                player.setMetadata("sessionLock", new FixedMetadataValue(this, true));
            } else {
                // Player is logging in from a different IP address, prompt them to log in manually
                player.sendMessage("§c✗ You are logging in from a different IP address.");
                player.sendMessage("§eUse /login to authenticate yourself.");
                playerLoginStatus.put(player.getUniqueId(), false);
            }
        } else {
            // New player, requires registration
            player.sendMessage("§c✗ You are not registered yet.");
            player.sendMessage("§eUse /register <password> <password> to create an account.");
            playerLoginStatus.put(player.getUniqueId(), false);
        }
    }

    @EventHandler
    public void onPlayerQuit(PlayerQuitEvent event) {
        Player player = event.getPlayer();
        // Clean up player data on quit
        playerLoginStatus.remove(player.getUniqueId());
    }

    public class LoginCommandExecutor implements CommandExecutor {
        private final SessionLockPlugin plugin;

        public LoginCommandExecutor(SessionLockPlugin plugin) {
            this.plugin = plugin;
        }

        @Override
        public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
            if (!(sender instanceof Player)) {
                sender.sendMessage("This command can only be used by a player.");
                return true;
            }

            Player player = (Player) sender;
            UUID playerUUID = player.getUniqueId();

            // Check if password is provided
            if (args.length < 1) {
                player.sendMessage("§cUsage: /login <password>");
                return true;
            }

            String providedPassword = args[0];

            // Check if player has registered
            if (!plugin.playerPasswords.containsKey(playerUUID)) {
                player.sendMessage("§c✗ You haven't registered yet. Use /register <password> <password>");
                return true;
            }

            // Verify password
            String storedPassword = plugin.playerPasswords.get(playerUUID);
            if (storedPassword.equals(providedPassword)) {
                player.sendMessage("§a✓ You have successfully logged in!");
                player.setMetadata("sessionLock", new FixedMetadataValue(plugin, true));
                plugin.playerLoginStatus.put(playerUUID, true);
                
                // Update IP address for future sessions
                String currentIp = player.getAddress().getAddress().getHostAddress();
                plugin.playerIps.put(playerUUID, currentIp);
            } else {
                player.sendMessage("§c✗ Wrong password!");
            }

            return true;
        }
    }

    public class RegisterCommandExecutor implements CommandExecutor {
        private final SessionLockPlugin plugin;

        public RegisterCommandExecutor(SessionLockPlugin plugin) {
            this.plugin = plugin;
        }

        @Override
        public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
            if (!(sender instanceof Player)) {
                sender.sendMessage("This command can only be used by a player.");
                return true;
            }

            Player player = (Player) sender;
            UUID playerUUID = player.getUniqueId();

            // Check if player already registered
            if (plugin.playerPasswords.containsKey(playerUUID)) {
                player.sendMessage("§c✗ You are already registered!");
                return true;
            }

            // Check password arguments
            if (args.length < 2) {
                player.sendMessage("§cUsage: /register <password> <password>");
                return true;
            }

            String password1 = args[0];
            String password2 = args[1];

            // Check if passwords match
            if (!password1.equals(password2)) {
                player.sendMessage("§c✗ Passwords do not match!");
                return true;
            }

            // Check password length
            if (password1.length() < 3) {
                player.sendMessage("§c✗ Password must be at least 3 characters long!");
                return true;
            }

            // Register the player
            String currentIp = player.getAddress().getAddress().getHostAddress();
            plugin.playerPasswords.put(playerUUID, password1);
            plugin.playerIps.put(playerUUID, currentIp);
            plugin.playerLoginStatus.put(playerUUID, true);
            player.setMetadata("sessionLock", new FixedMetadataValue(plugin, true));

            player.sendMessage("§a✓ Account registered successfully!");
            player.sendMessage("§eYour IP address has been saved. You can now join without logging in from this IP.");

            return true;
        }
    }
}
