// Goose-Port-Spiegel von: projects/learning-projects-traumalang/src/parser.h
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/src/parser.h");
}

// ---- Original-Code (projects/learning-projects-traumalang/src/parser.h), unveraendert, als Inline-Doku ----
// #pragma once
// #ifndef TL_PARSER_H
// #define TL_PARSER_H
// #include "lexer.h"
// #include "ast.h"
//
// typedef struct {
//     TlToken *toks;
//     int count, pos;
//     char *error;
//     int error_line;
// } TlParser;
//
// TlNode *tl_parse(TlTokVec *vec, char **err_out, int *err_line);
// void tl_parse_error_free(char *e);
//
// #endif
//
