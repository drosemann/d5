// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-babe-7d90-a882-c3aff90b5df0/call_01a17a9bb26e73b495d132340d00da24-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-babe-7d90-a882-c3aff90b5df0/call_01a17a9bb26e73b495d132340d00da24-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9b-babe-7d90-a882-c3aff90b5df0/call_01a17a9bb26e73b495d132340d00da24-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\runtime.h","hunks":[{"oldStart":3,"oldLines":6,"newStart":3,"newLines":14,"lines":[" #define TL_RUNTIME_H"," "," /* Zentrale Runtime-Deklarationen. Wird auch in generierten C-Code eingebettet (siehe runtime.c). */","+typedef enum { TL_NUM, TL_STR, TL_NULL } TlTag;","+typedef struct { TlTag tag; long num; const char *str; } TlVal;","+void tl_val_init(TlVal *v);","+void tl_val_set_num(TlVal *v, long n);","+void tl_val_set_str(TlVal *v, const char *s);","+void tl_val_set_null(TlVal *v);","+void tl_val_copy(TlVal *dst, const TlVal *src);","+void tl_val_print(const TlVal *v);"," void tl_startup_banner(void);"," void tl_sync_wait(void);"," void tl_print_str(const char *s);"]}]}]}
