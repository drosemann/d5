// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-9b4e-7b33-9226-b61b728ea8e2/call_01a189578ba2734b9c8632d34e3b8bbd-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-9b4e-7b33-9226-b61b728ea8e2/call_01a189578ba2734b9c8632d34e3b8bbd-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-9b4e-7b33-9226-b61b728ea8e2/call_01a189578ba2734b9c8632d34e3b8bbd-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":117,"oldLines":6,"newStart":117,"newLines":7,"lines":["     case N_IF: collect_uses_expr(s->cond, decl, imp); collect_uses_list(s->body, decl, imp, 0); collect_uses_list(s->else_body, decl, imp, 0); break;","     case N_WHILE: collect_uses_expr(s->cond, decl, imp); collect_uses_list(s->body, decl, imp, 0); break;","     case N_DIRECTIVE: collect_use_name(s->name, decl, imp); break;","+    case N_FUNCCALL: collect_uses_args(s->args, decl, imp); break;","     default: break;","     }"," }"]}]}]}
