// Goose-Port-Spiegel von: projects/github-repos-streuland/src/test/java/de/streuland/dashboard/PlotBackupOperationsServiceTest.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/test/java/de/streuland/dashboard/PlotBackupOperationsServiceTest.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/test/java/de/streuland/dashboard/PlotBackupOperationsServiceTest.java), unveraendert, als Inline-Doku ----
// package de.streuland.dashboard;
//
// import de.streuland.backup.PlotBackupCoordinator;
// import org.junit.jupiter.api.Test;
// import org.mockito.Mockito;
//
// import java.util.List;
// import java.util.Map;
// import java.util.Optional;
// import java.util.UUID;
// import java.util.concurrent.CompletableFuture;
//
// import static org.junit.jupiter.api.Assertions.*;
// import static org.mockito.Mockito.when;
//
// class PlotBackupOperationsServiceTest {
//
//     @Test
//     void createBackupWritesVersionedAuditRecord() {
//         PlotBackupCoordinator coordinator = Mockito.mock(PlotBackupCoordinator.class);
//         PlotAuditLogService audit = new PlotAuditLogService(100);
//         when(coordinator.takeSnapshot(Mockito.eq("plot_1"), Mockito.any(), Mockito.anyString(), Mockito.anyString()))
//                 .thenReturn(CompletableFuture.completedFuture("snap_1"));
//         when(coordinator.resolvePlotId("plot_1")).thenReturn(Optional.of("plot_1"));
//
//         PlotBackupOperationsService service = new PlotBackupOperationsService(coordinator, audit);
//         Map<String, Object> payload = service.createBackup("plot_1", UUID.randomUUID(), "tester", "manual").join();
//
//         assertNotNull(payload);
//         assertEquals("backup-v1", payload.get("version"));
//         assertEquals("snap_1", payload.get("snapshotId"));
//         assertEquals(1, audit.listByPlot("plot_1", 10).size());
//     }
//
//     @Test
//     void restoreBackupCreatesPreRestoreRollbackPointAndMarksReversible() {
//         PlotBackupCoordinator coordinator = Mockito.mock(PlotBackupCoordinator.class);
//         PlotAuditLogService audit = new PlotAuditLogService(100);
//
//         when(coordinator.resolvePlotId("plot_1")).thenReturn(Optional.of("plot_1"));
//         when(coordinator.takeSnapshot(Mockito.eq("plot_1"), Mockito.any(), Mockito.anyString(), Mockito.startsWith("pre-restore:")))
//                 .thenReturn(CompletableFuture.completedFuture("rollback_1"));
//         when(coordinator.restore("plot_1", "snap_1")).thenReturn(CompletableFuture.completedFuture(true));
//
//         PlotBackupOperationsService service = new PlotBackupOperationsService(coordinator, audit);
//         Map<String, Object> payload = service.restoreBackup("plot_1", "snap_1", UUID.randomUUID(), "admin").join();
//
//         assertNotNull(payload);
//         assertEquals(true, payload.get("reversible"));
//         assertEquals("rollback_1", payload.get("rollbackSnapshotId"));
//
//         List<PlotAuditEvent> events = audit.listByPlot("plot_1", 10);
//         assertEquals("backup_restore", events.get(0).getAction());
//     }
// }
//
