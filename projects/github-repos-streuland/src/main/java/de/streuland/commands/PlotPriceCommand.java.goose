// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/commands/PlotPriceCommand.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/commands/PlotPriceCommand.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/commands/PlotPriceCommand.java), unveraendert, als Inline-Doku ----
// package de.streuland.commands;
//
// import de.streuland.pricing.PricingEngine;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// import java.util.Locale;
//
// public class PlotPriceCommand {
//     private final PricingEngine pricingEngine;
//
//     public PlotPriceCommand(PricingEngine pricingEngine) {
//         this.pricingEngine = pricingEngine;
//     }
//
//     public boolean handle(Player player, String[] args) {
//         if (args.length < 2) {
//             player.sendMessage("§cVerwendung: /plot price <plotId>");
//             player.sendMessage("§cAdmin: /plot price setfactor <name> <value>");
//             return true;
//         }
//
//         if ("setfactor".equalsIgnoreCase(args[1])) {
//             return handleSetFactor(player, args);
//         }
//
//         String plotId = args[1];
//         PricingEngine.PriceEstimate estimate = pricingEngine.buildEstimate(plotId);
//
//         player.sendMessage("§6=== Adaptive Preisbewertung ===");
//         player.sendMessage("§ePlot: §f" + estimate.getPlotId());
//         player.sendMessage("§ePreis: §a" + String.format(Locale.US, "%.2f", estimate.getEstimatedPrice()));
//         player.sendMessage("§7Basis: " + fmt(estimate.getBasePrice()));
//         player.sendMessage("§7NearbySales: x" + fmt(estimate.getNearbySalesMultiplier()) + " (" + (int) estimate.getRecentNearbySalesCount() + " Sales)");
//         player.sendMessage("§7Featured/Popularity: x" + fmt(estimate.getFeaturedBoostMultiplier()));
//         player.sendMessage("§7Spawn-Proximity: x" + fmt(estimate.getProximityMultiplier()));
//         player.sendMessage("§7Scarcity: x" + fmt(estimate.getScarcityMultiplier()));
//         return true;
//     }
//
//     private boolean handleSetFactor(CommandSender sender, String[] args) {
//         if (!sender.hasPermission("streuland.admin") && !sender.isOp()) {
//             sender.sendMessage("§cKeine Berechtigung.");
//             return true;
//         }
//         if (args.length < 4) {
//             sender.sendMessage("§cVerwendung: /plot price setfactor <name> <value>");
//             return true;
//         }
//
//         double value;
//         try {
//             value = Double.parseDouble(args[3]);
//         } catch (NumberFormatException ex) {
//             sender.sendMessage("§cUngültiger Wert.");
//             return true;
//         }
//
//         boolean updated = pricingEngine.setFactor(args[2], value);
//         if (!updated) {
//             sender.sendMessage("§cUnbekannter Faktor. Erlaubt: basePrice, nearbySalesDecay, featuredBoost, proximityToSpawn, scarcityFactor, lookbackDays");
//             return true;
//         }
//
//         sender.sendMessage("§aFaktor " + args[2] + " gesetzt auf " + value + ".");
//         return true;
//     }
//
//     private String fmt(double value) {
//         return String.format(Locale.US, "%.2f", value);
//     }
// }
//
