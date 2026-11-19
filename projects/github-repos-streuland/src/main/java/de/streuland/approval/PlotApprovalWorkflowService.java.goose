// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/approval/PlotApprovalWorkflowService.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/approval/PlotApprovalWorkflowService.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/approval/PlotApprovalWorkflowService.java), unveraendert, als Inline-Doku ----
// package de.streuland.approval;
//
// import org.bukkit.entity.Player;
//
// import java.util.Collections;
// import java.util.List;
// import java.util.Map;
//
// /**
//  * Workflow façade around PlotApprovalService so command/UI layers remain thin.
//  */
// public class PlotApprovalWorkflowService {
//     private final PlotApprovalService approvalService;
//
//     public PlotApprovalWorkflowService(PlotApprovalService approvalService) {
//         this.approvalService = approvalService;
//     }
//
//     public PlotApprovalRequest submit(Player requester,
//                                       PlotApprovalActionType actionType,
//                                       String plotId,
//                                       Map<String, String> details) {
//         return approvalService.request(
//                 requester,
//                 actionType,
//                 plotId,
//                 details == null ? Collections.emptyMap() : details
//         );
//     }
//
//     public List<PlotApprovalRequest> listPendingForReview() {
//         return approvalService.listPending();
//     }
//
//     public boolean approve(String requestId, Player reviewer, String comment) {
//         return approvalService.approve(requestId, reviewer, comment);
//     }
//
//     public boolean deny(String requestId, Player reviewer, String reason) {
//         return approvalService.deny(requestId, reviewer, reason);
//     }
// }
//
