#pragma once
#ifndef TL_CODEGEN_H
#define TL_CODEGEN_H
#include "ast.h"
#include <stdio.h>

int tl_codegen(TlNode *prog, FILE *out, char **err_out);

#endif
