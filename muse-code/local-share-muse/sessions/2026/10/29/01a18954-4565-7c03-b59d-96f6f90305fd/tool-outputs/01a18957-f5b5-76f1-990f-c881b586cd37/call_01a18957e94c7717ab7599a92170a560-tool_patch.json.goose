// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-f5b5-76f1-990f-c881b586cd37/call_01a18957e94c7717ab7599a92170a560-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-f5b5-76f1-990f-c881b586cd37/call_01a18957e94c7717ab7599a92170a560-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-f5b5-76f1-990f-c881b586cd37/call_01a18957e94c7717ab7599a92170a560-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":244,"oldLines":7,"newStart":244,"newLines":9,"lines":["         return 0;","     }","     case N_FOR: {","-        indent(out, ind); fputs(\"{ long _from = \", out);","+        indent(out, ind); fputs(\"{ TlVal \", out); emit_ident(out, s->name);","+        fputs(\"; tl_val_init(&\", out); emit_ident(out, s->name); fputs(\");\\n\", out);","+        indent(out, ind); fputs(\"long _from = \", out);","         if (gen_expr(s->left, out, err)) return -1;","         fputs(\"; long _to = \", out);","         if (gen_expr(s->right, out, err)) return -1;"]}]}]}
