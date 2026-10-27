#include <stdlib.h>
#include <string.h>
#include "ast.h"

static char *xstrdup(const char *s) {
    if (!s) return NULL;
    size_t n = strlen(s) + 1;
    char *p = (char*)malloc(n);
    if (p) memcpy(p, s, n);
    return p;
}

TlNode *tl_node_new(TlNodeKind kind, int line) {
    TlNode *n = (TlNode*)calloc(1, sizeof(TlNode));
    if (n) { n->kind = kind; n->line = line; }
    return n;
}

void tl_body_free(TlNodeList *list) {
    while (list) { TlNodeList *nx = list->next; tl_node_free(list->node); free(list); list = nx; }
}

void tl_node_free(TlNode *n) {
    if (!n) return;
    free(n->name); free(n->name2); free(n->sval);
    tl_node_free(n->cond); tl_node_free(n->left); tl_node_free(n->right);
    tl_body_free(n->body); tl_body_free(n->else_body);
    free(n);
}

void tl_body_append(TlNodeList **list, TlNode *n) {
    TlNodeList *e = (TlNodeList*)calloc(1, sizeof(TlNodeList));
    if (!e) return;
    e->node = n;
    if (!*list) { *list = e; return; }
    TlNodeList *t = *list;
    while (t->next) t = t->next;
    t->next = e;
}

TlNode *tl_expr_var(int line, const char *name) {
    TlNode *n = tl_node_new(N_EXPR_VAR, line); n->name = xstrdup(name); return n;
}
TlNode *tl_expr_num(int line, long v) {
    TlNode *n = tl_node_new(N_EXPR_NUM, line); n->ival = v; return n;
}
TlNode *tl_expr_str(int line, const char *s) {
    TlNode *n = tl_node_new(N_EXPR_STR, line); n->sval = xstrdup(s); return n;
}
TlNode *tl_expr_binop(int line, const char *op, TlNode *l, TlNode *r) {
    TlNode *n = tl_node_new(N_EXPR_BINOP, line);
    n->sval = xstrdup(op); n->left = l; n->right = r; return n;
}
TlNode *tl_expr_null(int line) {
    return tl_node_new(N_EXPR_NULL, line);
}
