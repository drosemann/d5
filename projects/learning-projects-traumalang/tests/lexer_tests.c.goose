// Goose-Port-Spiegel von: projects/learning-projects-traumalang/tests/lexer_tests.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/tests/lexer_tests.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/tests/lexer_tests.c), unveraendert, als Inline-Doku ----
// #include <assert.h>
// #include <stdio.h>
// #include <string.h>
// #include "../src/lexer.h"
//
// /* Lexer-Tests: Mehrwort-Keywords, Strings, Zahlen, Zeilennummern. Nur schreiben, nicht ausfuehren. */
// static int t_multiword(void) {
//     TlTokVec v; tl_tokens_init(&v);
//     int rc = tl_lex("IT'S SHOWTIME\nYOU HAVE BEEN TERMINATED\n", "t", &v);
//     assert(rc == 0 && v.items[0].kind == T_SHOWTIME && v.items[2].kind == T_TERMINATED);
//     tl_tokens_free(&v); return 0;
// }
// static int t_enterprise(void) {
//     TlTokVec v; tl_tokens_init(&v);
//     int rc = tl_lex("WE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS x\n", "t", &v);
//     assert(rc == 0 && v.items[0].kind == T_VAR_ENTERPRISE && v.items[1].kind == T_IDENT);
//     tl_tokens_free(&v); return 0;
// }
// static int t_string(void) {
//     TlTokVec v; tl_tokens_init(&v);
//     int rc = tl_lex("TALK TO THE HAND \"Hi \\\"Welt\\\"\"\n", "t", &v);
//     assert(rc == 0 && v.items[1].kind == T_STRING);
//     tl_tokens_free(&v); return 0;
// }
// static int t_line(void) {
//     TlTokVec v; tl_tokens_init(&v);
//     int rc = tl_lex("TALK TO THE HAND x\n@" , "t", &v);
//     assert(rc != 0 && v.error_line == 2);
//     tl_tokens_free(&v); return 0;
// }
// int main(void) { t_multiword(); t_enterprise(); t_string(); t_line(); printf("lexer ok\n"); return 0; }
//
