// Goose-Port-Spiegel von: projects/learning-projects-traumalang/src/runtime.h
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/src/runtime.h");
}

// ---- Original-Code (projects/learning-projects-traumalang/src/runtime.h), unveraendert, als Inline-Doku ----
// #pragma once
// #ifndef TL_RUNTIME_H
// #define TL_RUNTIME_H
//
// /* Zentrale Runtime-Deklarationen. Wird auch in generierten C-Code eingebettet (siehe runtime.c). */
// typedef enum { TL_NUM, TL_STR, TL_NULL } TlTag;
// typedef struct { TlTag tag; long num; const char *str; } TlVal;
// void tl_val_init(TlVal *v);
// void tl_val_set_num(TlVal *v, long n);
// void tl_val_set_str(TlVal *v, const char *s);
// void tl_val_set_null(TlVal *v);
// void tl_val_copy(TlVal *dst, const TlVal *src);
// void tl_val_print(const TlVal *v);
// void tl_startup_banner(void);
// void tl_sync_wait(void);
// void tl_print_str(const char *s);
// void tl_print_long(long v);
// void tl_slack_str(const char *s);
// void tl_slack_long(long v);
// void tl_datadog_str(const char *s);
// void tl_cloud_str(const char *s);
// void tl_grafana_str(const char *s);
// void tl_escalate_str(const char *s);
// void tl_legacy_str(const char *s);
// int  tl_cab_open(void);
// int  tl_prob(int percent);
// void tl_chaos(void);
// void tl_leak_once(void);
// void tl_governance_wrap(void (*f)(void));
// long tl_metrics_counter(void);
// void tl_metrics_inc(void);
//
// #endif
//
