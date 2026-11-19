// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-e1c4-7801-bf20-a00671a63c91/call_01a17a9fd8e872549004803b22230f66-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-e1c4-7801-bf20-a00671a63c91/call_01a17a9fd8e872549004803b22230f66-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9f-e1c4-7801-bf20-a00671a63c91/call_01a17a9fd8e872549004803b22230f66-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\lexer.c","hunks":[{"oldStart":130,"oldLines":12,"newStart":130,"newLines":7,"lines":["             continue;","         }","         int matched = 0;","-        /* TEMP-Namen sind kleinteilig: erst exakte Pruefung, dann Grossbuchstaben-Keywords. */","         for (size_t i = 0; i < sizeof KWS / sizeof KWS[0]; i++) {","-            int is_lower = (KWS[i].kw[0] >= 'a' && KWS[i].kw[0] <= 'z');","-            if (!is_lower) {","-                /* Nur an Wortgrenzen pruefen: Zeilen muessen am Token beginnen (nach Spaces). */","-            }","             if (kw_match_at(p, KWS[i].kw)) { push(out, KWS[i].kind, KWS[i].kw, line); p += strlen(KWS[i].kw); matched = 1; break; }","         }","         if (matched) continue;"]}]}]}
