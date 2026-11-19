// Goose-Port-Spiegel von: projects/learning-projects-traumalang/tests/rewrite_tests.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/tests/rewrite_tests.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/tests/rewrite_tests.c), unveraendert, als Inline-Doku ----
// #include <assert.h>
// #include <stdio.h>
// #include <string.h>
// #include "../src/rewrite.h"
//
// /* Rewrite-Tests: alle acht Sprachen erzeugen gueltigen Rahmen; Roast fuegt Marker hinzu. */
// static int has(const char *path, const char *needle) {
//     FILE *f = fopen(path, "r");
//     static char buf[65536];
//     size_t n = f ? fread(buf, 1, sizeof buf - 1, f) : 0;
//     if (f) fclose(f);
//     buf[n] = '\0';
//     return strstr(buf, needle) != NULL;
// }
//
// static void write_in(const char *content) {
//     FILE *f = fopen("tests/_in.txt", "w");
//     fputs(content, f); fclose(f);
// }
//
// int main(void) {
//     char *w = NULL;
//     write_in("fn main() {\nlet x = 1;\nprintln!(\"hi\");\n}\n");
//     assert(tl_rewrite_file("rust", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//     assert(has("tests/_o.tl", "IT'S SHOWTIME"));
//
//     write_in("package m\nfunc main() {\nfmt.Println(\"hi\")\n}\n");
//     assert(tl_rewrite_file("go", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//     assert(has("tests/_o.tl", "WE NEED TO SYNC"));
//
//     write_in("def f():\n    print(\"hi\")\n");
//     assert(tl_rewrite_file("python", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//
//     write_in("async function f() {}\nconsole.log(\"hi\");\n");
//     assert(tl_rewrite_file("javascript", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//     assert(has("tests/_o.tl", "DOUBLE-BOOKED"));
//
//     write_in("async function f() {}\nconsole.log(\"hi\");\n");
//     assert(tl_rewrite_file("typescript", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//
//     write_in("class A { public static void main(String[] a) { System.out.println(\"hi\"); } }\n");
//     assert(tl_rewrite_file("java", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//
//     write_in("int main() { printf(\"hi\"); }\n");
//     assert(tl_rewrite_file("c", "tests/_in.txt", "tests/_o.tl", 0, &w) == 0);
//     assert(tl_rewrite_file("cpp", "tests/_in.txt", "tests/_o.tl", 1, &w) == 0);
//     assert(has("tests/_o.tl", "BLOCKED BY ANOTHER TEAM"));
//
//     printf("rewrite ok\n"); return 0;
// }
//
