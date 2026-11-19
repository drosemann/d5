// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/dashboard/PlotAuditEvent.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/dashboard/PlotAuditEvent.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/dashboard/PlotAuditEvent.java), unveraendert, als Inline-Doku ----
// package de.streuland.dashboard;
//
// import java.time.Instant;
// import java.util.Collections;
// import java.util.LinkedHashMap;
// import java.util.Map;
//
// public class PlotAuditEvent {
//     private final String eventId;
//     private final String plotId;
//     private final String action;
//     private final String actor;
//     private final Instant timestamp;
//     private final Map<String, Object> metadata;
//
//     public PlotAuditEvent(String eventId,
//                           String plotId,
//                           String action,
//                           String actor,
//                           Instant timestamp,
//                           Map<String, Object> metadata) {
//         this.eventId = eventId;
//         this.plotId = plotId;
//         this.action = action;
//         this.actor = actor;
//         this.timestamp = timestamp;
//         this.metadata = metadata == null
//                 ? Collections.emptyMap()
//                 : Collections.unmodifiableMap(new LinkedHashMap<String, Object>(metadata));
//     }
//
//     public String getEventId() {
//         return eventId;
//     }
//
//     public String getPlotId() {
//         return plotId;
//     }
//
//     public String getAction() {
//         return action;
//     }
//
//     public String getActor() {
//         return actor;
//     }
//
//     public Instant getTimestamp() {
//         return timestamp;
//     }
//
//     public Map<String, Object> getMetadata() {
//         return metadata;
//     }
// }
//
