public class TwoFactorAuth {
    private final Map<UUID, String> verificationCodes = new HashMap<>();

    public String generateVerificationCode(UUID playerId) {
        String code = String.valueOf(new Random().nextInt(999999));
        verificationCodes.put(playerId, code);
        // Send code to player's email or mobile device
        return code;
    }

    public boolean verifyCode(UUID playerId, String code) {
        return verificationCodes.getOrDefault(playerId, "").equals(code);
    }

    public void clearCode(UUID playerId) {
        verificationCodes.remove(playerId);
    }
} 