// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ChallengesCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ChallengesCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/ChallengesCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import java.util.Arrays;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
// import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
// import net.codingarea.challenges.plugin.utils.misc.Utils;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.NotNull;
// import org.jetbrains.annotations.Nullable;
//
// public class ChallengesCommand implements PlayerCommand, Completer {
//    public void onCommand(@Nonnull Player player, @Nonnull String[] args) {
//       if (args.length > 1) {
//          Message.forName("syntax").send(player, Prefix.CHALLENGES, "challenges [menu]");
//       } else if (args.length == 1) {
//          String menuName = args[0].toUpperCase();
//
//          try {
//             MenuType menuType = MenuType.valueOf(menuName);
//             Challenges.getInstance().getMenuManager().openMenu(player, menuType, 0);
//          } catch (IllegalArgumentException var5) {
//             Challenges.getInstance().getMenuManager().openGUI(player);
//          }
//
//       } else {
//          Challenges.getInstance().getMenuManager().openGUI(player);
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@NotNull CommandSender sender, @NotNull String[] args) {
//       return args.length != 1 ? null : Utils.filterRecommendations(args[0], (String[])Arrays.stream(MenuType.values()).map((menuType) -> {
//          return menuType.name().toLowerCase();
//       }).toArray((x$0) -> {
//          return new String[x$0];
//       }));
//    }
// }
//
