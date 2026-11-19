// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/admin/DailyPlotBackupService.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/admin/DailyPlotBackupService.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/admin/DailyPlotBackupService.java), unveraendert, als Inline-Doku ----
// package de.streuland.admin;
//
// import de.streuland.backup.SnapshotService;
// import org.bukkit.Bukkit;
// import org.bukkit.plugin.java.JavaPlugin;
// import org.bukkit.scheduler.BukkitTask;
//
// public class DailyPlotBackupService {
//     private final JavaPlugin plugin;
//     private final SnapshotService snapshotService;
//     private BukkitTask task;
//
//     public DailyPlotBackupService(JavaPlugin plugin, SnapshotService snapshotService) {
//         this.plugin = plugin;
//         this.snapshotService = snapshotService;
//     }
//
//     public void start() {
//         if (!plugin.getConfig().getBoolean("backups.enabled", true)) {
//             plugin.getLogger().info("Scheduled backups are disabled in config.");
//             return;
//         }
//         long hours = Math.max(1L, plugin.getConfig().getLong("backups.intervalHours", 24L));
//         long intervalTicks = hours * 60L * 60L * 20L;
//         long initialDelay = Math.max(20L, plugin.getConfig().getLong("backups.initialDelayTicks", 20L * 60L));
//         task = Bukkit.getScheduler().runTaskTimerAsynchronously(plugin, snapshotService::runScheduledBackups, initialDelay, intervalTicks);
//         plugin.getLogger().info("Scheduled backups enabled every " + hours + "h.");
//     }
//
//     public void stop() {
//         if (task != null) {
//             task.cancel();
//             task = null;
//         }
//     }
// }
//
