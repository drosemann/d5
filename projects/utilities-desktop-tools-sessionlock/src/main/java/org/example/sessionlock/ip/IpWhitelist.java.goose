// Goose-Port-Spiegel von: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/ip/IpWhitelist.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/ip/IpWhitelist.java");
}

// ---- Original-Code (projects/utilities-desktop-tools-sessionlock/src/main/java/org/example/sessionlock/ip/IpWhitelist.java), unveraendert, als Inline-Doku ----
// public class IpWhitelist {
//     private final Map<UUID, Set<String>> whitelistedIps = new HashMap<>();
//
//     public void addIp(UUID playerId, String ip) {
//         whitelistedIps.computeIfAbsent(playerId, k -> new HashSet<>()).add(ip);
//     }
//
//     public boolean isIpWhitelisted(UUID playerId, String ip) {
//         return whitelistedIps.getOrDefault(playerId, Collections.emptySet()).contains(ip);
//     }
//
//     public void removeIp(UUID playerId, String ip) {
//         Set<String> ips = whitelistedIps.get(playerId);
//         if (ips != null) {
//             ips.remove(ip);
//         }
//     }
// } 
