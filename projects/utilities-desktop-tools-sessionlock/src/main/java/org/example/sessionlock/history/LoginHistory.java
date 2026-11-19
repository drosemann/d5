public class LoginHistory {
    private final Map<UUID, List<String>> loginAttempts = new HashMap<>();

    public void recordLoginAttempt(UUID playerId, boolean success) {
        String status = success ? "successful" : "failed";
        String logEntry = String.format("Login %s at %s", status, LocalDateTime.now());
        loginAttempts.computeIfAbsent(playerId, k -> new ArrayList<>()).add(logEntry);
    }

    public List<String> getLoginHistory(UUID playerId) {
        return loginAttempts.getOrDefault(playerId, Collections.emptyList());
    }
} 