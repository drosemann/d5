// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/SearchCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/SearchCommand.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/spigot/command/SearchCommand.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.spigot.command;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.stream.Collectors;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.misc.StringUtils;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.blocks.BlockDropManager;
// import net.codingarea.challenges.plugin.utils.bukkit.command.Completer;
// import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
// import net.codingarea.challenges.plugin.utils.item.ItemUtils;
// import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
// import net.codingarea.challenges.plugin.utils.misc.Utils;
// import org.bukkit.Material;
// import org.bukkit.command.CommandSender;
//
// public class SearchCommand implements SenderCommand, Completer {
//    public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
//       if (args.length == 0) {
//          Message.forName("syntax").send(sender, Prefix.CHALLENGES, "search <item>");
//       } else {
//          String input = String.join("_", args).toUpperCase();
//          Material material = Utils.getMaterial(input);
//          if (material == null) {
//             Message.forName("no-such-material").send(sender, Prefix.CHALLENGES);
//          } else if (!material.isItem()) {
//             Message.forName("not-an-item").send(sender, Prefix.CHALLENGES, material);
//          } else {
//             Map allDrops = Challenges.getInstance().getBlockDropManager().getRegisteredDrops();
//             List blocks = new ArrayList(1);
//             Iterator var7 = allDrops.entrySet().iterator();
//
//             while(var7.hasNext()) {
//                Entry entry = (Entry)var7.next();
//                List drops = (List)((BlockDropManager.RegisteredDrops)entry.getValue()).getFirst().orElse(new ArrayList());
//                if (drops.contains(material)) {
//                   blocks.add((Material)entry.getKey());
//                }
//             }
//
//             if (blocks.isEmpty()) {
//                Message.forName("command-search-nothing").send(sender, Prefix.CHALLENGES, material);
//             } else {
//                Message.forName("command-search-result").send(sender, Prefix.CHALLENGES, material, StringUtils.getIterableAsString(blocks, ", ", StringUtils::getEnumName));
//             }
//
//          }
//       }
//    }
//
//    @Nullable
//    public List onTabComplete(@Nonnull CommandSender sender, @Nonnull String[] args) {
//       return args.length != 1 ? null : (List)Arrays.stream(ExperimentalUtils.getMaterials()).filter(ItemUtils::isObtainableInSurvival).filter(Material::isItem).map((material) -> {
//          return material.name().toLowerCase();
//       }).collect(Collectors.toList());
//    }
// }
//
