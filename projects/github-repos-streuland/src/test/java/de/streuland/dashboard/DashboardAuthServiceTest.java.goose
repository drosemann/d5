// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/dashboard/DashboardAuthServiceTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/dashboard/DashboardAuthServiceTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/dashboard/DashboardAuthServiceTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.dashboard;
//
// import com.sun.net.httpserver.Headers;
// import com.sun.net.httpserver.HttpExchange;
// import org.bukkit.configuration.file.FileConfiguration;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.junit.jupiter.api.Test;
// import org.mockito.Mockito;
//
// import static org.junit.jupiter.api.Assertions.assertFalse;
// import static org.junit.jupiter.api.Assertions.assertTrue;
// import static org.mockito.Mockito.when;
//
// class DashboardAuthServiceTest {
//
//     @Test
//     void authorizesByRoleUsingBearerToken() {
//         JavaPlugin plugin = Mockito.mock(JavaPlugin.class);
//         FileConfiguration config = Mockito.mock(FileConfiguration.class);
//         when(plugin.getConfig()).thenReturn(config);
//         when(config.getString("dashboard.auth.tokens.viewer", "")).thenReturn("viewer-token");
//         when(config.getString("dashboard.auth.tokens.operator", "")).thenReturn("operator-token");
//         when(config.getString("dashboard.auth.tokens.admin", "")).thenReturn("admin-token");
//         when(config.getString("dashboard.auth.token", "")).thenReturn("");
//         when(config.getString("web.token", "")).thenReturn("");
//
//         DashboardAuthService authService = new DashboardAuthService(plugin);
//         HttpExchange viewer = exchange("Bearer viewer-token");
//         HttpExchange operator = exchange("Bearer operator-token");
//
//         assertTrue(authService.isAuthorized(viewer, DashboardRole.VIEWER));
//         assertFalse(authService.isAuthorized(viewer, DashboardRole.ADMIN));
//         assertTrue(authService.isAuthorized(operator, DashboardRole.OPERATOR));
//     }
//
//     private HttpExchange exchange(String authHeader) {
//         HttpExchange exchange = Mockito.mock(HttpExchange.class);
//         Headers headers = new Headers();
//         headers.add("Authorization", authHeader);
//         when(exchange.getRequestHeaders()).thenReturn(headers);
//         return exchange;
//     }
// }
//
