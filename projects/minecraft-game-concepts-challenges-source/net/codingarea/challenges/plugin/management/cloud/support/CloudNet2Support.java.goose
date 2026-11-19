// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/cloud/support/CloudNet2Support.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/cloud/support/CloudNet2Support.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/cloud/support/CloudNet2Support.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.cloud.support;
//
// import de.dytanic.cloudnet.api.CloudAPI;
// import de.dytanic.cloudnet.bridge.CloudServer;
// import de.dytanic.cloudnet.lib.player.OfflinePlayer;
// import de.dytanic.cloudnet.lib.player.permission.PermissionGroup;
// import de.dytanic.cloudnet.lib.server.ServerState;
// import java.util.UUID;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.management.cloud.CloudSupport;
// import org.bukkit.entity.Player;
//
// public final class CloudNet2Support implements CloudSupport {
//    @Nonnull
//    public String getColoredName(@Nonnull Player player) {
//       return this.getColoredName(player.getUniqueId());
//    }
//
//    @Nonnull
//    public String getColoredName(@Nonnull UUID uuid) {
//       OfflinePlayer offlinePlayer = CloudAPI.getInstance().getOfflinePlayer(uuid);
//       PermissionGroup permissionGroup = offlinePlayer.getPermissionEntity().getHighestPermissionGroup(CloudAPI.getInstance().getPermissionPool());
//       String color = permissionGroup.getColor();
//       return color.replace('&', '§') + offlinePlayer.getName();
//    }
//
//    public boolean hasNameFor(@Nonnull UUID uuid) {
//       return CloudAPI.getInstance().getOfflinePlayer(uuid) != null;
//    }
//
//    public void startNewService() {
//       CloudServer.getInstance().changeToIngame();
//    }
//
//    public void setIngame() {
//       CloudServer.getInstance().setServerState(ServerState.INGAME);
//    }
//
//    public void setLobby() {
//       CloudServer.getInstance().setServerStateAndUpdate(ServerState.LOBBY);
//    }
// }
//
