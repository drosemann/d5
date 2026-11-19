// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/admin/DiagnosticsReport.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/admin/DiagnosticsReport.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/admin/DiagnosticsReport.java), unveraendert, als Inline-Doku ----
// package de.streuland.admin;
//
// import java.util.ArrayList;
// import java.util.Collections;
// import java.util.EnumMap;
// import java.util.List;
// import java.util.Map;
//
// public class DiagnosticsReport {
//     private final List<DiagnosticsIssue> issues = new ArrayList<>();
//
//     public void addIssue(DiagnosticsIssue issue) {
//         issues.add(issue);
//     }
//
//     public List<DiagnosticsIssue> getIssues() {
//         return Collections.unmodifiableList(issues);
//     }
//
//     public int getTotalIssues() {
//         return issues.size();
//     }
//
//     public Map<DiagnosticsIssueType, Integer> issueCounts() {
//         Map<DiagnosticsIssueType, Integer> counts = new EnumMap<>(DiagnosticsIssueType.class);
//         for (DiagnosticsIssue issue : issues) {
//             counts.merge(issue.getType(), 1, Integer::sum);
//         }
//         return counts;
//     }
// }
//
