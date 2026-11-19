// Goose-Port-Spiegel von: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/history/LoginHistory.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/history/LoginHistory.java");
}

// ---- Original-Code (projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/history/LoginHistory.java), unveraendert, als Inline-Doku ----
// public class LoginHistory {
//     private final Map<UUID, List<String>> loginAttempts = new HashMap<>();
//
//     public void recordLoginAttempt(UUID playerId, boolean success) {
//         String status = success ? "successful" : "failed";
//         String logEntry = String.format("Login %s at %s", status, LocalDateTime.now());
//         loginAttempts.computeIfAbsent(playerId, k -> new ArrayList<>()).add(logEntry);
//     }
//
//     public List<String> getLoginHistory(UUID playerId) {
//         return loginAttempts.getOrDefault(playerId, Collections.emptyList());
//     }
// } 
