public class SessionLogger {
    private final List<String> logEntries = new ArrayList<>();

    public void logLoginAttempt(UUID playerId, boolean success) {
        String status = success ? "successful" : "failed";
        String logEntry = String.format("Player %s attempted to log in: %s at %s", 
                          playerId.toString(), status, LocalDateTime.now());
        logEntries.add(logEntry);
        System.out.println(logEntry); // Output to console or log file
    }

    public void printLog() {
        for (String entry : logEntries) {
            System.out.println(entry);
        }
    }
} 