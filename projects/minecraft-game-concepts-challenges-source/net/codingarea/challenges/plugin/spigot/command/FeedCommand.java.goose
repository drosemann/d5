// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/FeedCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/FeedCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/FeedCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import java.util.ArrayList;
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
// import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
// import net.codingarea.challenges.plugin.utils.misc.CommandHelper;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.Nullable;
//
// public class FeedCommand implements SenderCommand, Completer {
//    public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
//       List targets = new ArrayList();
//       if (args.length > 0) {
//          targets.addAll(CommandHelper.getPlayers(sender, args[0]));
//       } else if (sender instanceof Player) {
//          targets.add((Player)sender);
//       }
//
//       if (targets.isEmpty()) {
//          Message.forName("command-no-target").send(sender, Prefix.CHALLENGES);
//       } else {
//          boolean otherPlayers = false;
//          Iterator var5 = targets.iterator();
//
//          while(var5.hasNext()) {
//             Player target = (Player)var5.next();
//             target.setFoodLevel(20);
//             Message.forName("command-feed-fed").send(target, Prefix.CHALLENGES);
//             if (target != sender) {
//                otherPlayers = true;
//             }
//          }
//
//          if (otherPlayers) {
//             Message.forName("command-feed-others").send(sender, Prefix.CHALLENGES, targets.size());
//          }
//
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
//       return CommandHelper.getCompletions(sender);
//    }
// }
//
