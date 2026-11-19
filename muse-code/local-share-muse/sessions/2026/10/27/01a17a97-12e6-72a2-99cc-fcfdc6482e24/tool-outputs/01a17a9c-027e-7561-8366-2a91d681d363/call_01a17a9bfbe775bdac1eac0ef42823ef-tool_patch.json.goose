// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9c-027e-7561-8366-2a91d681d363/call_01a17a9bfbe775bdac1eac0ef42823ef-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9c-027e-7561-8366-2a91d681d363/call_01a17a9bfbe775bdac1eac0ef42823ef-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9c-027e-7561-8366-2a91d681d363/call_01a17a9bfbe775bdac1eac0ef42823ef-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":38,"oldLines":7,"newStart":38,"newLines":7,"lines":["     case N_EXPR_STR: emit_cstr(out, e->sval); return 0;","     case N_EXPR_VAR:","         if (!is_valid_c_ident(e->name) && strcmp(e->name, \"TEMP_Access_Do_Not_Use\") != 0) { *err = \"ungueltiger Variablenname\"; return -1; }","-        emit_ident(out, e->name); return 0;","+        fputc('(', out); emit_ident(out, e->name); fputs(\").num\", out); return 0;","     case N_EXPR_NULL: fputs(\"NULL\", out); return 0;","     case N_EXPR_BINOP:","         fputc('(', out);"]}]}]}
