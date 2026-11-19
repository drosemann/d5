// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ebab-76e1-8cea-68cbceb258d1/call_01a18957e43671d3855dbd656bcb18f5-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ebab-76e1-8cea-68cbceb258d1/call_01a18957e43671d3855dbd656bcb18f5-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18957-ebab-76e1-8cea-68cbceb258d1/call_01a18957e43671d3855dbd656bcb18f5-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\codegen.c","hunks":[{"oldStart":107,"oldLines":7,"newStart":107,"newLines":7,"lines":["         else collect_uses_expr(s->left, decl, imp);","         break;","     case N_FOR:","-        collect_use_name(s->name, decl, imp);","+        set_add(decl, s->name);","         collect_uses_expr(s->left, decl, imp); collect_uses_expr(s->right, decl, imp);","         collect_uses_list(s->body, decl, imp, 0); break;","     case N_COPY: collect_use_name(s->name, decl, imp); collect_use_name(s->name2, decl, imp); break;"]}]}]}
