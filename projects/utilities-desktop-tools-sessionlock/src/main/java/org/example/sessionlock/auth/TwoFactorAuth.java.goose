// Goose-Port-Spiegel von: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/auth/TwoFactorAuth.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/auth/TwoFactorAuth.java");
}

// ---- Original-Code (projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/auth/TwoFactorAuth.java), unveraendert, als Inline-Doku ----
// public class TwoFactorAuth {
//     private final Map<UUID, String> verificationCodes = new HashMap<>();
//
//     public String generateVerificationCode(UUID playerId) {
//         String code = String.valueOf(new Random().nextInt(999999));
//         verificationCodes.put(playerId, code);
//         // Send code to player's email or mobile device
//         return code;
//     }
//
//     public boolean verifyCode(UUID playerId, String code) {
//         return verificationCodes.getOrDefault(playerId, "").equals(code);
//     }
//
//     public void clearCode(UUID playerId) {
//         verificationCodes.remove(playerId);
//     }
// } 
