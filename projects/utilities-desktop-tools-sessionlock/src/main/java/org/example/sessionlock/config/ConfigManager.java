public class ConfigManager {
    private final FileConfiguration config;

    public ConfigManager(FileConfiguration config) {
        this.config = config;
    }

    public String getLoginSuccessMessage() {
        return config.getString("messages.login-success", "Login successful!");
    }

    public String getLoginFailureMessage() {
        return config.getString("messages.login-failure", "Login failed!");
    }
} 