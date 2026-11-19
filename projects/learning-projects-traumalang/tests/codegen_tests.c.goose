// Goose-Port-Spiegel von: projects/learning-projects-traumalang/tests/codegen_tests.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/tests/codegen_tests.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/tests/codegen_tests.c), unveraendert, als Inline-Doku ----
// #include <assert.h>
// #include <stdio.h>
// #include <string.h>
// #include <stdlib.h>
// #include "../src/lexer.h"
// #include "../src/parser.h"
// #include "../src/ast.h"
// #include "../src/codegen.h"
//
// /* Codegen-Tests: Startup-Banner, TlVal-Deklaration, String-Escaping, if/while-Verschachtelung. */
// static char *gen(const char *src) {
//     TlTokVec v; tl_tokens_init(&v);
//     if (tl_lex(src, "t", &v)) return NULL;
//     char *err = NULL; int el = 0;
//     TlNode *p = tl_parse(&v, &err, &el);
//     free(err);
//     if (!p) { tl_tokens_free(&v); return NULL; }
//     FILE *f = fopen("tests/_out.c", "w");
//     char *cerr = NULL;
//     int rc = tl_codegen(p, f, &cerr);
//     fclose(f);
//     tl_node_free(p); tl_tokens_free(&v);
//     if (rc) return NULL;
//     FILE *r = fopen("tests/_out.c", "r");
//     static char buf[65536];
//     size_t n = fread(buf, 1, sizeof buf - 1, r);
//     fclose(r); buf[n] = '\0';
//     return buf;
// }
//
// int main(void) {
//     char *c = gen("IT'S SHOWTIME\nWE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS x\nI NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE x \"A \\\"B\\\"\"\nYOU HAVE BEEN TERMINATED\n");
//     assert(c && strstr(c, "tl_startup_banner") && strstr(c, "TlVal x") && strstr(c, "A \\\"B\\\""));
//     c = gen("IT'S SHOWTIME\nSTICK AROUND UNTIL THE SPRINT ENDS x\nTALK TO THE HAND \"s\"\nYOU HAVE BEEN TERMINATED\nYOU HAVE BEEN TERMINATED\n");
//     assert(c && strstr(c, "while"));
//     c = gen("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE add WITH x AND y\nGIVE IT BACK x\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(c && strstr(c, "static TlVal tlf_add(TlVal x, TlVal y)") && strstr(c, "return x;"));
//     c = gen("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE main\nDO SPRINT PLANNING i FROM 1 TO 3\nTALK TO THE HAND i\nYOU HAVE BEEN TERMINATED\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(c && strstr(c, "for (i.num = _from;"));
//     c = gen("IT'S SHOWTIME\nWE NEED TO TAKE THIS OFFLINE main\nWE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS x\nHAVE YOU TRIED TURNING IT OFF AND ON AGAIN\nTHIS COULD HAVE BEEN AN EMAIL\nYOU HAVE BEEN TERMINATED\n");
//     assert(c && strstr(c, "tl_val_set_null(&x);"));
//     printf("codegen ok\n"); return 0;
// }
//
