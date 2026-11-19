// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/GroupChangeListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/GroupChangeListener.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-rolesync/src/main/java/com/example/rolesync/GroupChangeListener.java), unveraendert, als Inline-Doku ----
// package com.example.rolesync;
//
// import net.luckperms.api.model.user.User;
// import net.luckperms.api.node.types.InheritanceNode;
// import org.bukkit.Bukkit;
// import java.util.UUID;
// import java.util.Map;
//
// public class GroupChangeListener {
//     private final DiscordSyncPlugin plugin;
//
//     public GroupChangeListener(DiscordSyncPlugin plugin) {
//         this.plugin = plugin;
//     }
//
//     public void handleGroupChange(UUID uuid, String groupName) {
//         String discordId = plugin.getLinkedAccounts().get(uuid);
//         if (discordId == null) {
//             return;
//         }
//
//         // Get the Discord role ID that corresponds to this group
//         String roleId = plugin.getRoleGroupMapping().entrySet().stream()
//                 .filter(entry -> entry.getValue().equals(groupName))
//                 .map(Map.Entry::getKey)
//                 .findFirst()
//                 .orElse(null);
//
//         if (roleId != null) {
//             String guildId = plugin.getConfig().getString("discord.guildId");
//             plugin.getJDA().getGuildById(guildId).retrieveMemberById(discordId).queue(
//                 member -> {
//                     net.dv8tion.jda.api.entities.Role role = 
//                         member.getGuild().getRoleById(roleId);
//                     if (role != null) {
//                         member.getGuild().addRoleToMember(member, role).queue();
//                     }
//                 }
//             );
//         }
//     }
// }
//
