#pragma once
#ifndef TL_PARSER_H
#define TL_PARSER_H
#include "lexer.h"
#include "ast.h"

typedef struct {
    TlToken *toks;
    int count, pos;
    char *error;
    int error_line;
} TlParser;

TlNode *tl_parse(TlTokVec *vec, char **err_out, int *err_line);
void tl_parse_error_free(char *e);

#endif
