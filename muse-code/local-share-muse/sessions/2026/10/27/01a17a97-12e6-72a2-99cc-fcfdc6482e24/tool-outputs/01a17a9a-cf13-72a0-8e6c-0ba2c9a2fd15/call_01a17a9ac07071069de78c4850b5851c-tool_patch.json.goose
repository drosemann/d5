// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf13-72a0-8e6c-0ba2c9a2fd15/call_01a17a9ac07071069de78c4850b5851c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf13-72a0-8e6c-0ba2c9a2fd15/call_01a17a9ac07071069de78c4850b5851c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9a-cf13-72a0-8e6c-0ba2c9a2fd15/call_01a17a9ac07071069de78c4850b5851c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\src\\parser.h","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":17,"lines":["+#pragma once","+#ifndef TL_PARSER_H","+#define TL_PARSER_H","+#include \"lexer.h\"","+#include \"ast.h\"","+","+typedef struct {","+    TlToken *toks;","+    int count, pos;","+    char *error;","+    int error_line;","+} TlParser;","+","+TlNode *tl_parse(TlTokVec *vec, char **err_out, int *err_line);","+void tl_parse_error_free(char *e);","+","+#endif"]}]}]}
