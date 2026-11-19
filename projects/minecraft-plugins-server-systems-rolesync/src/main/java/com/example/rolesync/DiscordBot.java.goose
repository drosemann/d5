// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/DiscordBot.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/DiscordBot.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/DiscordBot.java), unveraendert, als Inline-Doku ----
// package com.example.rolesync;
//
// import net.dv8tion.jda.api.JDABuilder;
// import net.dv8tion.jda.api.events.guild.member.GuildMemberRoleAddEvent;
// import net.dv8tion.jda.api.events.guild.member.GuildMemberRoleRemoveEvent;
// import net.dv8tion.jda.api.hooks.ListenerAdapter;
// import javax.security.auth.login.LoginException;
// import net.dv8tion.jda.api.requests.GatewayIntent;
//
// public class DiscordBot extends ListenerAdapter {
//     private final DiscordSyncPlugin plugin;
//
//     public DiscordBot(DiscordSyncPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     public void start() {
//         try {
//             JDABuilder.createDefault(plugin.getDiscordToken())
//                 .enableIntents(GatewayIntent.GUILD_MEMBERS)
//                 .addEventListeners(this)
//                 .build();
//         } catch (Exception e) {
//             plugin.getLogger().severe("Failed to initialize Discord bot: " + e.getMessage());
//         }
//     }
//
//     @Override
//     public void onGuildMemberRoleAdd(GuildMemberRoleAddEvent event) {
//         String discordId = event.getMember().getId();
//         event.getRoles().forEach(role -> {
//             if (!plugin.getIgnoreRoles().contains(role.getName())) {
//                 plugin.syncDiscordRoleToMinecraft(discordId, role.getName());
//             }
//         });
//     }
//
//     @Override
//     public void onGuildMemberRoleRemove(GuildMemberRoleRemoveEvent event) {
//         String discordId = event.getMember().getId();
//         event.getRoles().forEach(role -> {
//             if (!plugin.getIgnoreRoles().contains(role.getName())) {
//                 plugin.syncDiscordRoleToMinecraft(discordId, role.getName());
//             }
//         });
//     }
// }
//
