public class IpWhitelist {
    private final Map<UUID, Set<String>> whitelistedIps = new HashMap<>();

    public void addIp(UUID playerId, String ip) {
        whitelistedIps.computeIfAbsent(playerId, k -> new HashSet<>()).add(ip);
    }

    public boolean isIpWhitelisted(UUID playerId, String ip) {
        return whitelistedIps.getOrDefault(playerId, Collections.emptySet()).contains(ip);
    }

    public void removeIp(UUID playerId, String ip) {
        Set<String> ips = whitelistedIps.get(playerId);
        if (ips != null) {
            ips.remove(ip);
        }
    }
} 