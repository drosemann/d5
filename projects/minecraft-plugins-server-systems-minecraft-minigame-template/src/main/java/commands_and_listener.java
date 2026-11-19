@Override
public void onEnable() {
    getLogger().info("Minigame Plugin aktiviert!");
    getCommand("set").setExecutor(new SetCommand());
    getCommand("lobby").setExecutor(new LobbyCommand());
    getServer().getPluginManager().registerEvents(new BlockBreakListener(), this);
    // Weitere Initialisierungen
}
