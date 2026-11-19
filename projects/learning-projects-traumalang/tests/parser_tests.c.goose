// Goose-Port-Spiegel von: projects/learning-projects-traumalang/tests/parser_tests.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/tests/parser_tests.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/tests/parser_tests.c), unveraendert, als Inline-Doku ----
// #include <assert.h>
// #include <stdio.h>
// #include <string.h>
// #include <stdlib.h>
// #include "../src/lexer.h"
// #include "../src/parser.h"
// #include "../src/ast.h"
//
// static TlNode *parse_src(const char *src) {
//     TlTokVec v; tl_tokens_init(&v);
//     if (tl_lex(src, "t", &v)) { tl_tokens_free(&v); return NULL; }
//     char *err = NULL; int el = 0;
//     TlNode *p = tl_parse(&v, &err, &el);
//     free(err); tl_tokens_free(&v);
//     return p;
// }
//
// /* Parser/AST: Programmgeruest, Variablen, if/else, while+break/continue, Funktionen, Fehler mit Zeile. */
// int main(void) {
//     TlNode *p = parse_src("IT'S SHOWTIME\nYOU HAVE BEEN TERMINATED\n");
//     assert(p && p->kind == N_PROGRAM); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nWE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS x\nYOU HAVE BEEN TERMINATED\n");
//     assert(p); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nDO IT FOR THE METRICS x\nTALK TO THE HAND \"a\"\nBLUE IS BROKEN GREEN IS WORSE\nTALK TO THE HAND \"b\"\nYOU HAVE BEEN TERMINATED\nYOU HAVE BEEN TERMINATED\n");
//     assert(p); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nSTICK AROUND UNTIL THE SPRINT ENDS x\nCONSIDER THAT A DIVORCE\nLET'S CIRCLE BACK LATER\nYOU HAVE BEEN TERMINATED\nYOU HAVE BEEN TERMINATED\n");
//     assert(p); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE f\nTALK TO THE HAND \"x\"\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(p); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE add WITH x AND y\nGIVE IT BACK x\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(p && p->body->node->param_count == 2); tl_node_free(p);
//
//     p = parse_src("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE main\nDO SPRINT PLANNING i FROM 1 TO 3\nTALK TO THE HAND i\nYOU HAVE BEEN TERMINATED\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(p); tl_node_free(p);
//
//     /* Fehlerfaelle: fehlendes TERMINATED, falscher Blockabschluss */
//     p = parse_src("IT'S SHOWTIME\nTALK TO THE HAND \"x\"\n");
//     assert(!p);
//     p = parse_src("TALK TO THE HAND \"x\"\nYOU HAVE BEEN TERMINATED\n");
//     assert(!p);
//
//     printf("parser ok\n"); return 0;
// }
//
