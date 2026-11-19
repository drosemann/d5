@Override
public void onEnable() {
    getLogger().info("Minigame Plugin aktiviert!");
    
    // Weitere Initialisierungen

    // Registriere den Event-Listener
    getServer().getPluginManager().registerEvents(this, this);
    
}