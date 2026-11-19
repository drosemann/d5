// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/ModifyBlockAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/ModifyBlockAction.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/rules/actions/ModifyBlockAction.java), unveraendert, als Inline-Doku ----
// package de.streuland.rules.actions;
//
// import de.streuland.rules.RuleAction;
// import de.streuland.rules.RuleContext;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.block.Block;
// import org.bukkit.event.block.BlockPlaceEvent;
//
// public class ModifyBlockAction implements RuleAction {
//     private final Material material;
//     private final String blockData;
//
//     public ModifyBlockAction(Material material, String blockData) {
//         this.material = material;
//         this.blockData = blockData;
//     }
//
//     @Override
//     public void execute(RuleContext context) {
//         if (context.getEvent() instanceof BlockPlaceEvent) {
//             BlockPlaceEvent event = (BlockPlaceEvent) context.getEvent();
//             Block block = event.getBlockPlaced();
//             block.setType(material, false);
//             if (blockData != null) {
//                 try {
//                     block.setBlockData(Bukkit.createBlockData(blockData), false);
//                 } catch (IllegalArgumentException ignored) {
//                 }
//             }
//         }
//     }
// }
//
