package com.example.rolesync;

import net.dv8tion.jda.api.events.guild.member.GuildMemberRoleAddEvent;
import net.dv8tion.jda.api.events.guild.member.GuildMemberRoleRemoveEvent;
import net.dv8tion.jda.api.hooks.ListenerAdapter;

public class DiscordRoleListener extends ListenerAdapter {

    private final DiscordSyncPlugin plugin;

    public DiscordRoleListener(DiscordSyncPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public void onGuildMemberRoleAdd(GuildMemberRoleAddEvent event) {
        String discordId = event.getMember().getId();
        event.getRoles().forEach(role -> {
            if (!plugin.getConfig().getStringList("ignoreRoles").contains(role.getName())) {
                plugin.syncDiscordRoleToMinecraft(discordId, role.getName());
            }
        });
    }

    @Override
    public void onGuildMemberRoleRemove(GuildMemberRoleRemoveEvent event) {
        String discordId = event.getMember().getId();
        event.getRoles().forEach(role -> {
            if (!plugin.getConfig().getStringList("ignoreRoles").contains(role.getName())) {
                plugin.syncDiscordRoleToMinecraft(discordId, role.getName());
            }
        });
    }

}