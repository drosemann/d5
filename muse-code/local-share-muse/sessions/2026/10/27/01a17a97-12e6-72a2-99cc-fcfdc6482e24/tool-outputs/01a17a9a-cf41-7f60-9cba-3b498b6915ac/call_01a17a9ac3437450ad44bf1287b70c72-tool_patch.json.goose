// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf41-7f60-9cba-3b498b6915ac/call_01a17a9ac3437450ad44bf1287b70c72-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf41-7f60-9cba-3b498b6915ac/call_01a17a9ac3437450ad44bf1287b70c72-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf41-7f60-9cba-3b498b6915ac/call_01a17a9ac3437450ad44bf1287b70c72-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\runtime.h","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":25,"lines":["+#pragma once","+#ifndef TL_RUNTIME_H","+#define TL_RUNTIME_H","+","+/* Zentrale Runtime-Deklarationen. Wird auch in generierten C-Code eingebettet (siehe runtime.c). */","+void tl_startup_banner(void);","+void tl_sync_wait(void);","+void tl_print_str(const char *s);","+void tl_print_long(long v);","+void tl_slack_str(const char *s);","+void tl_slack_long(long v);","+void tl_datadog_str(const char *s);","+void tl_cloud_str(const char *s);","+void tl_grafana_str(const char *s);","+void tl_escalate_str(const char *s);","+void tl_legacy_str(const char *s);","+int  tl_cab_open(void);","+int  tl_prob(int percent);","+void tl_chaos(void);","+void tl_leak_once(void);","+void tl_governance_wrap(void (*f)(void));","+long tl_metrics_counter(void);","+void tl_metrics_inc(void);","+","+#endif"]}]}]}
