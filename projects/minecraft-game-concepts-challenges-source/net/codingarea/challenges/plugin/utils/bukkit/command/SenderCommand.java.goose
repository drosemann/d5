// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/command/SenderCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/command/SenderCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/command/SenderCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.bukkit.command;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.codingarea.challenges.plugin.content.Prefix;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandExecutor;
// import org.bukkit.command.CommandSender;
//
// public interface SenderCommand extends CommandExecutor {
//    default boolean onCommand(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String label, @Nonnull String[] args) {
//       try {
//          this.onCommand(sender, args);
//       } catch (Exception var6) {
//          sender.sendMessage(Prefix.CHALLENGES + "§cSomething went wrong while executing the command");
//          Logger.error("Something went wrong while processing the command '{}'", label, var6);
//       }
//
//       return true;
//    }
//
//    void onCommand(@Nonnull CommandSender var1, @Nonnull String[] var2) throws Exception;
// }
//
