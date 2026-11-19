package com.example.rolesync;

import net.luckperms.api.LuckPerms;
import net.luckperms.api.event.user.UserDataRecalculateEvent;
import net.luckperms.api.model.group.Group;
import net.luckperms.api.model.user.User;
import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.entities.Guild;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.configuration.ConfigurationSection;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.configuration.file.YamlConfiguration;
import org.bukkit.entity.Player;
import org.bukkit.plugin.RegisteredServiceProvider;
import org.bukkit.plugin.java.JavaPlugin;

import javax.security.auth.login.LoginException;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

public class DiscordSyncPlugin extends JavaPlugin {

    private JDA jda;
    private LuckPerms luckPerms;
    private Map<String, String> roleGroupMapping = new HashMap<>();
    private Map<UUID, String> linkedAccounts = new HashMap<>();

    private FileConfiguration config;
    private File linkFile;
    private YamlConfiguration links;

    @Override
    public void onEnable() {
        saveDefaultConfig();
        config = getConfig();

        ConfigurationSection mappingSection = config.getConfigurationSection("roleGroupMapping");
        if (mappingSection != null) {
            for (String discordRoleId : mappingSection.getKeys(false)) {
                String groupName = mappingSection.getString(discordRoleId);
                roleGroupMapping.put(discordRoleId, groupName);
            }
        }

        linkFile = new File(getDataFolder(), "links.yml");
        if (!linkFile.exists()) {
            saveResource("links.yml", false);
        }
        links = YamlConfiguration.loadConfiguration(linkFile);
        for (String uuidString : links.getKeys(false)) {
            try {
                UUID uuid = UUID.fromString(uuidString);
                String discordId = links.getString(uuidString);
                linkedAccounts.put(uuid, discordId);
            } catch (IllegalArgumentException e) {
                getLogger().warning("Invalid UUID in links.yml: " + uuidString);
            }
        }

        String botToken = config.getString("discordBotToken");
        try {
            jda = JDABuilder.createDefault(botToken)
                    .enableIntents(net.dv8tion.jda.api.requests.GatewayIntent.GUILD_MEMBERS)
                    .addEventListeners(new DiscordRoleListener(this))
                    .build().awaitReady();
        } catch (Exception e) {
            getLogger().severe("Failed to initialize Discord bot: " + e.getMessage());
        }

        RegisteredServiceProvider<LuckPerms> provider = getServer().getServicesManager().getRegistration(LuckPerms.class);
        if (provider != null) {
            luckPerms = provider.getProvider();
            luckPerms.getEventBus().subscribe(UserDataRecalculateEvent.class, event -> {
                UUID uuid = event.getUser().getUniqueId();
                if (linkedAccounts.containsKey(uuid)) {
                    String discordId = linkedAccounts.get(uuid);
                    updateDiscordRoles(uuid, discordId, event.getUser());
                }
            });
        } else {
            getLogger().severe("LuckPerms not found!");
        }

        getCommand("linkdiscord").setExecutor(new LinkDiscordCommand(this));
    }

    @Override
    public void onDisable() {
        if (jda != null) {
            jda.shutdown();
        }
    }

    public void updateDiscordRoles(UUID uuid, String discordId, User lpUser) {
        String guildId = config.getString("guildId");
        Guild guild = jda.getGuildById(guildId);
        if (guild == null) {
            getLogger().warning("Discord guild not found!");
            return;
        }
        guild.retrieveMemberById(discordId).queue(member -> {
            Set<String> playerGroups = lpUser.getInheritedGroups(lpUser.getQueryOptions()).stream()
                    .map(Group::getName)
                    .collect(Collectors.toSet());

            List<net.dv8tion.jda.api.entities.Role> rolesToAdd = new ArrayList<>();
            List<net.dv8tion.jda.api.entities.Role> rolesToRemove = new ArrayList<>();

            for (Map.Entry<String, String> entry : roleGroupMapping.entrySet()) {
                String discordRoleId = entry.getKey();
                String requiredGroup = entry.getValue();
                net.dv8tion.jda.api.entities.Role role = guild.getRoleById(discordRoleId);
                if (role == null) continue;

                if (playerGroups.contains(requiredGroup)) {
                    if (!member.getRoles().contains(role)) {
                        rolesToAdd.add(role);
                    }
                } else {
                    if (member.getRoles().contains(role)) {
                        rolesToRemove.add(role);
                    }
                }
            }
            guild.modifyMemberRoles(member, rolesToAdd, rolesToRemove).queue();
        }, throwable -> getLogger().warning("Could not retrieve Discord member for ID: " + discordId));
    }

    public JDA getJDA() {
        return jda;
    }

    public LuckPerms getLuckPerms() {
        return luckPerms;
    }

    public Map<String, String> getRoleGroupMapping() {
        return roleGroupMapping;
    }

    public Map<UUID, String> getLinkedAccounts() {
        return linkedAccounts;
    }

    public void addLinkedAccount(UUID uuid, String discordId) {
        linkedAccounts.put(uuid, discordId);
        links.set(uuid.toString(), discordId);
        try {
            links.save(linkFile);
        } catch (IOException e) {
            getLogger().severe("Could not save links.yml: " + e.getMessage());
        }
    }

    public String getDiscordToken() {
        return config.getString("discordBotToken");
    }

    public List<String> getIgnoreRoles() {
        return config.getStringList("ignoreRoles");
    }

    public void syncDiscordRoleToMinecraft(String discordId, String roleName) {
        // Find UUID for this Discord ID
        UUID uuid = null;
        for (Map.Entry<UUID, String> entry : linkedAccounts.entrySet()) {
            if (entry.getValue().equals(discordId)) {
                uuid = entry.getKey();
                break;
            }
        }
        
        if (uuid == null) {
            getLogger().warning("No Minecraft account linked to Discord ID: " + discordId);
            return;
        }

        // Get the LuckPerms user
        User user = luckPerms.getUserManager().getUser(uuid);
        if (user == null) {
            getLogger().warning("Could not find LuckPerms user for UUID: " + uuid);
            return;
        }

        // Find the group that corresponds to this role
        String groupName = roleGroupMapping.entrySet().stream()
                .filter(e -> e.getValue().equals(roleName))
                .map(Map.Entry::getKey)
                .findFirst()
                .orElse(null);

        if (groupName != null) {
            updateDiscordRoles(uuid, discordId, user);
        }
    }
}
