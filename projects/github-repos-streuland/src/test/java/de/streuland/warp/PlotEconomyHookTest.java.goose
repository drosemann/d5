// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/warp/PlotEconomyHookTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/warp/PlotEconomyHookTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/warp/PlotEconomyHookTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.warp;
//
// import net.milkbowl.vault.economy.Economy;
// import net.milkbowl.vault.economy.EconomyResponse;
// import org.bukkit.OfflinePlayer;
// import org.bukkit.entity.Player;
// import org.junit.Assert;
// import org.junit.Test;
//
// import static org.mockito.Mockito.*;
//
// public class PlotEconomyHookTest {
//
//     @Test
//     public void chargeAndPayoutShouldUseEconomyProvider() {
//         Economy economy = mock(Economy.class);
//         Player player = mock(Player.class);
//         OfflinePlayer owner = mock(OfflinePlayer.class);
//         when(economy.withdrawPlayer(player, 25.0)).thenReturn(new EconomyResponse(25.0, 75.0, EconomyResponse.ResponseType.SUCCESS, "ok"));
//
//         PlotEconomyHook hook = new PlotEconomyHook(economy);
//         Assert.assertTrue(hook.charge(player, 25.0));
//
//         hook.payout(owner, 25.0);
//         verify(economy).depositPlayer(owner, 25.0);
//     }
// }
//
