// Goose-Port-Spiegel von: d5lang/d5lang.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang/d5lang.c");
}

// ---- Original-Code (d5lang/d5lang.c), unveraendert, als Inline-Doku ----
// // SPDX-License-Identifier: MIT
// /* D5Lang v1 - Der Transpiler. Nur C. Kein Python, kein Rust, kein Go.
//  * Daniel aus Hanau. ShadowUnity seit 2018, kein Reset.
//  * Bauen: gcc d5lang.c -o d5lang
//  * Benutzen: ./d5lang run hello.d5
//  */
// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <ctype.h>
//
// #ifdef _WIN32
// #include <windows.h>
// #else
// #include <unistd.h>
// #endif
//
// /* ---------- kleine Helfer, alle handgeschrieben, keine Lib ---------- */
//
// static int starts_with(const char *line, const char *kw) {
//     size_t n = strlen(kw);
//     if (strncmp(line, kw, n) != 0) return 0;
//     return line[n] == '\0' || line[n] == ' ' || line[n] == '\t';
// }
//
// static const char *skip_spaces(const char *s) {
//     while (*s == ' ' || *s == '\t') s++;
//     return s;
// }
//
// /* Macht aus beliebigem Text einen gueltigen C-Namen: alles ausser
//  * alnum wird '_'. Leerer Text -> "d5_leer". */
// static char *sanitize(const char *in) {
//     size_t i, n = strlen(in);
//     char *out = (char *)malloc(n + 16);
//     size_t j = 0;
//     if (!out) exit(1);
//     for (i = 0; i < n && j < n + 15; i++) {
//         char c = in[i];
//         if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') ||
//             (c >= '0' && c <= '9') || c == '_') {
//             out[j++] = c;
//         } else if (c == ' ' || c == '\t' || c == '-') {
//             if (j > 0 && out[j - 1] != '_') out[j++] = '_';
//         }
//     }
//     while (j > 0 && out[j - 1] == '_') j--;
//     out[j] = '\0';
//     if (j == 0 || (out[0] >= '0' && out[0] <= '9')) {
//         memmove(out + 3, out, j + 1);
//         out[0] = 'd'; out[1] = '5'; out[2] = '_';
//     }
//     return out;
// }
//
// /* Erstes Wort (bis Space) als C-Namen, Rest dahinter. */
// static char *first_word(const char *args) {
//     const char *e = args;
//     while (*e && *e != ' ' && *e != '\t' && *e != '\r' && *e != '\n') e++;
//     {
//         size_t n = (size_t)(e - args);
//         char *tmp = (char *)malloc(n + 1);
//         char *out;
//         if (!tmp) exit(1);
//         memcpy(tmp, args, n);
//         tmp[n] = '\0';
//         out = sanitize(tmp);
//         free(tmp);
//         return out;
//     }
// }
//
// /* Rest der Zeile nach dem ersten Wort (kann leer sein). */
// static const char *rest_after_first(const char *args) {
//     while (*args && *args != ' ' && *args != '\t') args++;
//     return skip_spaces(args);
// }
//
// /* Wert fuer Zuweisung: "Text" und NULL bleiben, alles andere wird String. */
// static void emit_value(FILE *out, const char *v) {
//     char *end = NULL;
//     if (v[0] == '\0') { fprintf(out, "\"\""); return; }
//     if (v[0] == '"' || strcmp(v, "NULL") == 0) { fprintf(out, "%s", v); return; }
//     strtod(v, &end);
//     if (end && *end == '\0') { fprintf(out, "\"%s\"", v); return; }
//     if (strchr(v, ' ') != NULL) { fprintf(out, "\"%s\"", v); return; }
//     {
//         char *s = sanitize(v);
//         fprintf(out, "%s", s);
//         free(s);
//     }
// }
//
// /* Print-Argument: "Literal" geht direkt, einzelnes Wort ist Variable. */
// static void emit_print_arg(FILE *out, const char *arg) {
//     if (arg[0] == '\0') { fprintf(out, "\"\""); return; }
//     if (arg[0] == '"') { fprintf(out, "%s", arg); return; }
//     if (strchr(arg, ' ') != NULL) { fprintf(out, "\"%s\"", arg); return; }
//     {
//         char *s = sanitize(arg);
//         fprintf(out, "%s", s);
//         free(s);
//     }
// }
//
// static void emit_banner(FILE *out) {
//     fprintf(out, "  printf(\"LOADING D5... CHECKING 340 ACCOUNTS FOR 240 EMPLOYEES...\\n\");\n");
//     fprintf(out, "  printf(\"FRUEHER WAR ICH BANK BERATER UND MUSSTE UM 8 DA SEIN...\\n\");\n");
//     fprintf(out, "  printf(\"IT'S PROBABLY DNS...\\n\");\n");
//     fprintf(out, "  printf(\"SHINE, LITTLE BOY, SHINE...\\n\");\n");
//     fprintf(out, "  fflush(stdout);\n");
//     fprintf(out, "  d5_sleep(8);\n");
// }
//
// static void emit_header(FILE *out) {
//     fprintf(out, "/* Von D5Lang transpiliert. SHINE, LITTLE BOY, SHINE. */\n");
//     fprintf(out, "#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n");
//     fprintf(out, "#ifdef _WIN32\n#include <windows.h>\n");
//     fprintf(out, "static void d5_sleep(int s){ Sleep(s*1000); }\n#else\n");
//     fprintf(out, "#include <unistd.h>\nstatic void d5_sleep(int s){ sleep(s); }\n#endif\n");
// }
//
// /* ---------- Transpiler: eine Zeile D5Lang -> C ---------- */
//
// typedef struct {
//     char **names;
//     int count;
//     int cap;
//     int has_d5_main;
// } FnTable;
//
// static void fnt_add(FnTable *t, const char *name) {
//     if (t->count >= t->cap) {
//         t->cap = t->cap ? t->cap * 2 : 16;
//         t->names = (char **)realloc(t->names, (size_t)t->cap * sizeof(char *));
//         if (!t->names) exit(1);
//     }
//     t->names[t->count] = (char *)malloc(strlen(name) + 1);
//     if (!t->names[t->count]) exit(1);
//     strcpy(t->names[t->count], name);
//     t->count++;
//     if (strcmp(name, "d5_main") == 0) t->has_d5_main = 1;
// }
//
// static int fnt_has(FnTable *t, const char *name) {
//     int i;
//     for (i = 0; i < t->count; i++)
//         if (strcmp(t->names[i], name) == 0) return 1;
//     return 0;
// }
//
// /* Eine logische Zeile emittieren. Gibt 1 zurueck wenn C-Code (kein Kommentar). */
// static void emit_line(FILE *out, const char *line, FnTable *fns, int *depth) {
//     const char *a;
//     char *v;
//     const char *r;
//
//     if (line[0] == '\0') { fprintf(out, "\n"); return; }
//
//     if (starts_with(line, "SHINE, LITTLE BOY, SHINE")) {
//         fprintf(out, "int main(void) {\n");
//         emit_banner(out);
//         (*depth)++;
//         return;
//     }
//     if (starts_with(line, "BOY, DU HAST KI-VERBOT")) {
//         if (fns->has_d5_main && *depth == 1) fprintf(out, "  d5_main();\n");
//         fprintf(out, "  return 0;\n}\n");
//         (*depth)--;
//         if (*depth < 0) *depth = 0;
//         return;
//     }
//     if (starts_with(line, "WIR MÜSSEN DAS OFFLINE NEHMEN") ||
//         starts_with(line, "WIR MUESSEN DAS OFFLINE NEHMEN")) {
//         a = skip_spaces(line + strlen("WIR MÜSSEN DAS OFFLINE NEHMEN"));
//         if (*a == '\0') {
//             static int n = 0;
//             fprintf(out, "void d5_fn_%d(void) {\n", n++);
//         } else {
//             v = first_word(a);
//             if (strcmp(v, "main") == 0) {
//                 fprintf(out, "void d5_main(void) {\n");
//                 fnt_add(fns, "d5_main");
//             } else {
//                 fprintf(out, "void %s(void) {\n", v);
//                 fnt_add(fns, v);
//             }
//             free(v);
//         }
//         (*depth)++;
//         return;
//     }
//     if (starts_with(line, "DAS HÄTTE EINE EMAIL SEIN KÖNNEN") ||
//         starts_with(line, "DAS HAETTE EINE EMAIL SEIN KOENNEN")) {
//         fprintf(out, "}\n");
//         (*depth)--;
//         if (*depth < 0) *depth = 0;
//         return;
//     }
//     if (starts_with(line, "SHADOWUNITY-SEIT-2018-KEIN-RESET")) {
//         a = skip_spaces(line + strlen("SHADOWUNITY-SEIT-2018-KEIN-RESET"));
//         v = first_word(a);
//         fprintf(out, "  static char *%s = NULL; /* seit 2018, kein Reset */\n", v);
//         free(v);
//         return;
//     }
//     if (starts_with(line, "ONEDRIVE-ZWEI-EURO")) {
//         a = skip_spaces(line + strlen("ONEDRIVE-ZWEI-EURO"));
//         v = first_word(a);
//         r = rest_after_first(a);
//         fprintf(out, "  char *%s = ", v);
//         if (*r) emit_value(out, r); else fprintf(out, "NULL");
//         fprintf(out, "; /* 100GB reserviert, 2-3GB benutzt */\n");
//         free(v);
//         return;
//     }
//     if (starts_with(line, "ZEHN-TOTE-FOREN-EIN-NERD-FORUM")) {
//         a = skip_spaces(line + strlen("ZEHN-TOTE-FOREN-EIN-NERD-FORUM"));
//         v = first_word(a);
//         fprintf(out, "  char *%s = NULL; /* 10 tote Foren, 1 Forum */\n", v);
//         free(v);
//         return;
//     }
//     if (starts_with(line, "ICH-BRAUCHE-DEINE-KLEIDER-DEINE-STIEFEL-UND-DEIN-MOTORRAD")) {
//         a = skip_spaces(line + strlen("ICH-BRAUCHE-DEINE-KLEIDER-DEINE-STIEFEL-UND-DEIN-MOTORRAD"));
//         v = first_word(a);
//         r = rest_after_first(a);
//         fprintf(out, "  %s = ", v);
//         emit_value(out, r);
//         fprintf(out, ";\n");
//         free(v);
//         return;
//     }
//     if (starts_with(line, "DU-BIST-NICHT-DU-DU-BIST-ICH")) {
//         a = skip_spaces(line + strlen("DU-BIST-NICHT-DU-DU-BIST-ICH"));
//         v = first_word(a);
//         r = rest_after_first(a);
//         {
//             char *w = first_word(r);
//             fprintf(out, "  %s = %s;\n", v, w);
//             free(w);
//         }
//         free(v);
//         return;
//     }
//     if (starts_with(line, "WIR-MÜSSEN-SKALIEREN") || starts_with(line, "WIR-MUESSEN-SKALIEREN")) {
//         a = skip_spaces(line + strlen("WIR-MÜSSEN-SKALIEREN"));
//         v = first_word(a);
//         fprintf(out, "  %s++;\n", v);
//         free(v);
//         return;
//     }
//     if (starts_with(line, "WIR-MÜSSEN-DOWNSIZEN") || starts_with(line, "WIR-MUESSEN-DOWNSIZEN")) {
//         a = skip_spaces(line + strlen("WIR-MÜSSEN-DOWNSIZEN"));
//         v = first_word(a);
//         fprintf(out, "  %s--;\n", v);
//         free(v);
//         return;
//     }
//     if (starts_with(line, "FRÜHER-WAR-ICH-BANK-BERATER") || starts_with(line, "FRUEHER-WAR-ICH-BANK-BERATER")) {
//         fprintf(out, "  d5_sleep(8); /* Gleitzeit? Frueher Bank, 8 Uhr da. */\n");
//         return;
//     }
//     if (starts_with(line, "DANIEL-DU-HAST-KI-VERBOT")) {
//         fprintf(out, "  exit(1); /* Hard Stop. Keine Subagents. Tokens sparen. */\n");
//         return;
//     }
//     if (starts_with(line, "MACH-ES-FÜR-DIE-METRIKEN") || starts_with(line, "MACH-ES-FUER-DIE-METRIKEN")) {
//         a = skip_spaces(line + strlen("MACH-ES-FÜR-DIE-METRIKEN"));
//         fprintf(out, "  if (%s) {\n", *a ? a : "1");
//         (*depth)++;
//         return;
//     }
//     if (starts_with(line, "BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER") ||
//         starts_with(line, "BLAU-IST-KAPUTT-GRUEN-IST-SCHLIMMER")) {
//         fprintf(out, "  } else {\n");
//         return;
//     }
//     if (starts_with(line, "BLEIB-BIS-ZUM-SPRINT-ENDE")) {
//         a = skip_spaces(line + strlen("BLEIB-BIS-ZUM-SPRINT-ENDE"));
//         fprintf(out, "  while (%s) {\n", *a ? a : "0");
//         (*depth)++;
//         return;
//     }
//     if (starts_with(line, "LASS-UNS-SPÄTER-DRÜBER-SPRECHEN") ||
//         starts_with(line, "LASS-UNS-SPAETER-DRUEBER-SPRECHEN")) {
//         fprintf(out, "  continue;\n");
//         return;
//     }
//     if (starts_with(line, "BETRACHTE-DAS-ALS-SCHEIDUNG")) {
//         fprintf(out, "  break;\n");
//         return;
//     }
//     if (starts_with(line, "TALK TO THE HAND")) {
//         a = skip_spaces(line + strlen("TALK TO THE HAND"));
//         fprintf(out, "  printf(\"%%s\\n\", ");
//         emit_print_arg(out, a);
//         fprintf(out, ");\n");
//         return;
//     }
//     if (starts_with(line, "SCHICK-ES-AN-SLACK")) {
//         a = skip_spaces(line + strlen("SCHICK-ES-AN-SLACK"));
//         fprintf(out, "  printf(\"[SLACK] %%s\\n\", ");
//         emit_print_arg(out, a);
//         fprintf(out, "); /* jeder liest es, keiner reagiert */\n");
//         return;
//     }
//     if (starts_with(line, "PACK-ES-IN-JIRA")) {
//         a = skip_spaces(line + strlen("PACK-ES-IN-JIRA"));
//         fprintf(out, "  /* TODO: %s (wird ignoriert) */\n", a);
//         return;
//     }
//     if (starts_with(line, "PACK-ES-IN-CONFLUENCE")) {
//         a = skip_spaces(line + strlen("PACK-ES-IN-CONFLUENCE"));
//         fprintf(out, "  /* CONFLUENCE: %s (Wissen geht rein, kommt nicht raus) */\n", a);
//         return;
//     }
//     if (starts_with(line, "SCHICK-ES-AN-DATADOG")) {
//         a = skip_spaces(line + strlen("SCHICK-ES-AN-DATADOG"));
//         fprintf(out, "  printf(\"[DATADOG] %%s\\n\", ");
//         emit_print_arg(out, a);
//         fprintf(out, "); /* +80MB SBOM, keiner fragt */\n");
//         return;
//     }
//     if (starts_with(line, "SCHICK-ES-IN-DIE-CLOUD")) {
//         a = skip_spaces(line + strlen("SCHICK-ES-IN-DIE-CLOUD"));
//         fprintf(out, "  printf(\"[CLOUD] %%s (0.30 Euro)\\n\", ");
//         emit_print_arg(out, a);
//         fprintf(out, ");\n  d5_sleep(2);\n");
//         return;
//     }
//     if (starts_with(line, "WIR-MÜSSEN-SYNCHEN") || starts_with(line, "WIR-MUESSEN-SYNCHEN")) {
//         fprintf(out, "  d5_sleep(8); /* Java Delay Prinzip */\n");
//         return;
//     }
//     if (starts_with(line, "DEPLOY-ES-AM-FREITAG-UM-16-59")) {
//         a = skip_spaces(line + strlen("DEPLOY-ES-AM-FREITAG-UM-16-59"));
//         fprintf(out, "  printf(\"[PROD] %%s\\n\", ");
//         emit_print_arg(out, a);
//         fprintf(out, ");\n  exit(1); /* Freitag 16:59. Mutig. */\n");
//         return;
//     }
//     /* Alles mit Story aber ohne sicheres C: ehrlicher Kommentar. Kompiliert immer. */
//     if (starts_with(line, "EDGE-GOBLIN") ||
//         starts_with(line, "ES-IST-WAHRSCHEINLICH-DNS") ||
//         starts_with(line, "ICH-HABE-DIR-GESAGT-NUR-CODE-KEIN-RUN") ||
//         starts_with(line, "DEIN-REGEX-WAR-SCHLAMPIG-MACH-ES-NEU") ||
//         starts_with(line, "EIN-SESSION-NUR-NIE-SUBAGENTS") ||
//         starts_with(line, "ICH-HABE-KEIN-SAAS-ABER-JETZT-ZWEI") ||
//         starts_with(line, "META-MACHT-FÜNF-DOLLAR-TIER") ||
//         starts_with(line, "META-MACHT-FUENF-DOLLAR-TIER") ||
//         starts_with(line, "WISSEN-GEHT-REIN-KOMMT-NICHT-RAUS") ||
//         starts_with(line, "HAST-DU-ES-SCHON-MAL-AUS-UND-AN-GEMACHT") ||
//         starts_with(line, "BEI-MIR-GEHT-ES") ||
//         starts_with(line, "ICH-HATTE-DREI-VIER-SERVER-PARALLEL") ||
//         starts_with(line, "ATERNOS-BIS-INDEX-HOSTING") ||
//         starts_with(line, "HT-HOSTING-IST-PLEITE") ||
//         starts_with(line, "ST-HOSTING-NACH-EINEM-MONAT-GECANCELT") ||
//         starts_with(line, "ICH-BIN-DOPPELT-GEBUCHT-AUF-ZWEI-OFFSITES") ||
//         starts_with(line, "DINGE-DIE-GEMESSEN-WERDEN-WERDEN-VERBESSERT") ||
//         starts_with(line, "WIR-HABEN-ANGEFANGEN-DIE-DINGE-ZU-MESSEN") ||
//         starts_with(line, "ICH-MAG-SEHR-VAGE-ZIELE") ||
//         starts_with(line, "FOKUS-IST-WICHTIG-PRODUKT-WELCHES-PRODUKT") ||
//         starts_with(line, "ICH-BRAUCHE-OWNER-KEINE-MIETER") ||
//         starts_with(line, "ES-IST-EIN-TEMPORÄRES-SKRIPT-SEIT-2018") ||
//         starts_with(line, "ES-IST-EIN-TEMPORAERES-SKRIPT-SEIT-2018") ||
//         starts_with(line, "WIR-HABEN-VIEL-GOVERNANCE") ||
//         starts_with(line, "GRIEFERPRINZ-BIS-SHADOWUNITY")) {
//         fprintf(out, "  /* D5: %s */\n", line);
//         return;
//     }
//
//     /* Funktionsaufruf: einzelne Zeile = bekannter Funktionsname. */
//     if (*depth > 0 && strchr(line, ' ') == NULL) {
//         v = sanitize(line);
//         if (fnt_has(fns, v)) {
//             fprintf(out, "  %s();\n", v);
//             free(v);
//             return;
//         }
//         free(v);
//     }
//
//     /* Unbekannt: ehrlich als Kommentar, damit es immer kompiliert. */
//     fprintf(out, "  /* UNBEKANNT (Edge-Goblin war hier): %s */\n", line);
// }
//
// static int transpile(const char *in_path, const char *c_path) {
//     FILE *in = fopen(in_path, "r");
//     FILE *out;
//     FnTable fns = { NULL, 0, 0, 0 };
//     char buf[4096];
//     char **lines = NULL;
//     int nlines = 0, cap = 0, i, depth = 0;
//     int j;
//     if (!in) { fprintf(stderr, "d5lang: Datei nicht gefunden: %s\n", in_path); return 1; }
//     while (fgets(buf, sizeof(buf), in)) {
//         size_t n = strlen(buf);
//         char *cp;
//         while (n > 0 && (buf[n-1] == '\n' || buf[n-1] == '\r')) buf[--n] = '\0';
//         cp = (char *)malloc(n + 1);
//         if (!cp) { fclose(in); return 1; }
//         strcpy(cp, buf);
//         /* Pass 1 merken: OFFLINE-Namen sammeln (main -> d5_main). */
//         {
//             const char *t = skip_spaces(cp);
//             if (starts_with(t, "WIR MÜSSEN DAS OFFLINE NEHMEN") ||
//                 starts_with(t, "WIR MUESSEN DAS OFFLINE NEHMEN")) {
//                 const char *a = skip_spaces(t + strlen("WIR MÜSSEN DAS OFFLINE NEHMEN"));
//                 if (*a) {
//                     char *w = first_word(a);
//                     if (strcmp(w, "main") == 0) fnt_add(&fns, "d5_main");
//                     else fnt_add(&fns, w);
//                     free(w);
//                 }
//             }
//         }
//         if (nlines >= cap) {
//             cap = cap ? cap * 2 : 128;
//             lines = (char **)realloc(lines, (size_t)cap * sizeof(char *));
//             if (!lines) { fclose(in); return 1; }
//         }
//         lines[nlines++] = cp;
//     }
//     fclose(in);
//     out = fopen(c_path, "w");
//     if (!out) { fprintf(stderr, "d5lang: kann nicht schreiben: %s\n", c_path); return 1; }
//     emit_header(out);
//     for (i = 0; i < nlines; i++) {
//         const char *t = skip_spaces(lines[i]);
//         if (t[0] == '/' && t[1] == '/') {
//             fprintf(out, "/* %s */\n", t);
//             continue;
//         }
//         emit_line(out, t, &fns, &depth);
//     }
//     while (depth-- > 0) fprintf(out, "}\n");
//     fclose(out);
//     for (j = 0; j < nlines; j++) free(lines[j]);
//     free(lines);
//     for (j = 0; j < fns.count; j++) free(fns.names[j]);
//     free(fns.names);
//     return 0;
// }
//
// /* ---------- build & run ---------- */
//
// static char *base_without_ext(const char *path) {
//     const char *dot = strrchr(path, '.');
//     const char *slash1 = strrchr(path, '/');
//     const char *slash2 = strrchr(path, '\\');
//     const char *slash = slash1 > slash2 ? slash1 : slash2;
//     size_t n;
//     char *out;
//     if (!dot || (slash && dot < slash)) dot = path + strlen(path);
//     n = (size_t)(dot - path);
//     out = (char *)malloc(n + 1);
//     if (!out) exit(1);
//     memcpy(out, path, n);
//     out[n] = '\0';
//     return out;
// }
//
// static int do_build(const char *d5_path) {
//     char *base = base_without_ext(d5_path);
//     char *c_path = (char *)malloc(strlen(base) + 4);
//     char *bin = (char *)malloc(strlen(base) + 8);
//     char *cmd;
//     int rc;
//     if (!c_path || !bin) exit(1);
//     sprintf(c_path, "%s.c", base);
// #ifdef _WIN32
//     sprintf(bin, "%s.exe", base);
// #else
//     sprintf(bin, "%s", base);
// #endif
//     if (transpile(d5_path, c_path) != 0) return 1;
//     cmd = (char *)malloc(strlen(c_path) + strlen(bin) + 32);
//     if (!cmd) exit(1);
//     sprintf(cmd, "gcc \"%s\" -o \"%s\"", c_path, bin);
//     printf("D5Lang: %s -> %s -> %s\n", d5_path, c_path, bin);
//     rc = system(cmd);
//     free(cmd); free(c_path);
//     if (rc != 0) {
//         fprintf(stderr, "d5lang: gcc ist fehlgeschlagen. Edge-Goblin? (gcc installiert?)\n");
//         free(base); free(bin);
//         return 1;
//     }
//     printf("D5Lang: fertig. Binary: %s\n", bin);
//     free(base); free(bin);
//     return 0;
// }
//
// static int do_run(const char *d5_path) {
//     char *base = base_without_ext(d5_path);
//     char *cmd;
//     int rc;
//     char *bin = (char *)malloc(strlen(base) + 8);
//     if (!bin) exit(1);
// #ifdef _WIN32
//     sprintf(bin, "\"%s.exe\"", base);
//     /* cmd.exe liest / als Switch: Pfad-Trennzeichen flippen. */
//     { char *p; for (p = bin; *p; p++) if (*p == '/') *p = '\\'; }
// #else
//     sprintf(bin, "\"%s\"", base);
// #endif
//     if (do_build(d5_path) != 0) { free(base); free(bin); return 1; }
//     cmd = (char *)malloc(strlen(bin) + 4);
//     if (!cmd) exit(1);
//     sprintf(cmd, "%s", bin);
//     rc = system(cmd);
//     free(cmd); free(base); free(bin);
//     return rc;
// }
//
// /* ---------- rewrite: fremde Sprachen -> D5Lang ---------- */
//
// static const char *first_ident(const char *line) {
//     static char id[128];
//     int i = 0;
//     const char *p = line;
//     while (*p) {
//         if ((*p >= 'a' && *p <= 'z') || (*p >= 'A' && *p <= 'Z') || *p == '_') {
//             const char *q = p;
//             i = 0;
//             while ((*q >= 'a' && *q <= 'z') || (*q >= 'A' && *q <= 'Z') ||
//                    (*q >= '0' && *q <= '9') || *q == '_' || *q == '$') {
//                 if (i < 120) id[i++] = *q;
//                 q++;
//             }
//             id[i] = '\0';
//             if (id[0] == '$') memmove(id, id + 1, (size_t)i);
//             if (strcmp(id, "let") != 0 && strcmp(id, "mut") != 0 &&
//                 strcmp(id, "var") != 0 && strcmp(id, "const") != 0 &&
//                 strcmp(id, "function") != 0 && strcmp(id, "def") != 0 &&
//                 strcmp(id, "return") != 0 && strcmp(id, "echo") != 0 &&
//                 strcmp(id, "fn") != 0 && strcmp(id, "func") != 0) {
//                 char *s = sanitize(id);
//                 strncpy(id, s, sizeof(id) - 1);
//                 id[sizeof(id) - 1] = '\0';
//                 free(s);
//                 return id;
//             }
//             p = q;
//         } else p++;
//     }
//     return NULL;
// }
//
// /* Text in Anfuehrungszeichen aus einer Zeile fischen ("..." oder '...'). */
// static const char *quoted_text(const char *line) {
//     static char q[1024];
//     const char *p = strchr(line, '"');
//     char mark = '"';
//     int i = 0;
//     if (!p) { p = strchr(line, '\''); mark = '\''; }
//     if (!p) return NULL;
//     p++;
//     while (*p && *p != mark && i < 1000) q[i++] = *p++;
//     q[i] = '\0';
//     return q;
// }
//
// static int do_rewrite(const char *from, const char *in_path,
//                       const char *out_path, int roast) {
//     FILE *in = fopen(in_path, "r");
//     FILE *out;
//     char buf[4096];
//     int count = 0;
//     (void)from; /* Mapping ist generisch, --from steht im Header. */
//     if (!in) { fprintf(stderr, "d5lang: Datei nicht gefunden: %s\n", in_path); return 1; }
//     out = fopen(out_path, "w");
//     if (!out) { fprintf(stderr, "d5lang: kann nicht schreiben: %s\n", out_path); fclose(in); return 1; }
//     fprintf(out, "SHINE, LITTLE BOY, SHINE\n");
//     fprintf(out, "  WIR MÜSSEN DAS OFFLINE NEHMEN main\n");
//     fprintf(out, "    PACK-ES-IN-JIRA Portiert von %s nach D5Lang. Gruss aus Hanau.\n", from ? from : "?");
//     while (fgets(buf, sizeof(buf), in)) {
//         size_t n = strlen(buf);
//         const char *t, *qt, *id;
//         while (n > 0 && (buf[n-1] == '\n' || buf[n-1] == '\r')) buf[--n] = '\0';
//         t = skip_spaces(buf);
//         if (*t == '\0') continue;
//         count++;
//         if (*t == '#' || (*t == '/' && t[1] == '/')) {
//             const char *c = (*t == '#') ? skip_spaces(t + 1) : skip_spaces(t + 2);
//             fprintf(out, "    PACK-ES-IN-JIRA %s\n", c);
//         } else if (strstr(t, "console.log") || strstr(t, "fmt.Print")) {
//             qt = quoted_text(t);
//             fprintf(out, "    SCHICK-ES-AN-SLACK %s\n", qt ? qt : t);
//             fprintf(out, "    WIR-MÜSSEN-SYNCHEN\n");
//         } else if (strstr(t, "println") || strstr(t, "print(") ||
//                    strstr(t, "printf") || strstr(t, "System.out.println") ||
//                    strstr(t, "echo ")) {
//             qt = quoted_text(t);
//             if (qt) fprintf(out, "    TALK TO THE HAND \"%s\"\n", qt);
//             else if ((id = first_ident(t))) fprintf(out, "    TALK TO THE HAND %s\n", id);
//             else fprintf(out, "    TALK TO THE HAND \"%s\"\n", t);
//         } else if (strncmp(t, "def ", 4) == 0 || strncmp(t, "function ", 9) == 0 ||
//                    strncmp(t, "fn ", 3) == 0 || strncmp(t, "func ", 5) == 0) {
//             id = first_ident(t + (t[1] == 'n' ? 3 : t[1] == 'e' ? 4 : 5));
//             fprintf(out, "    WIR MÜSSEN DAS OFFLINE NEHMEN %s\n", id ? id : "portiert");
//         } else if (strncmp(t, "let ", 4) == 0 || strncmp(t, "var ", 4) == 0 ||
//                    strncmp(t, "const ", 6) == 0 || *t == '$') {
//             id = first_ident(t);
//             qt = quoted_text(t);
//             if (id && qt) fprintf(out, "    ONEDRIVE-ZWEI-EURO %s \"%s\"\n", id, qt);
//             else if (id) fprintf(out, "    ONEDRIVE-ZWEI-EURO %s\n", id);
//             else fprintf(out, "    PACK-ES-IN-JIRA %s\n", t);
//         } else if (strncmp(t, "if ", 3) == 0 || strncmp(t, "if(", 3) == 0) {
//             fprintf(out, "    MACH-ES-FÜR-DIE-METRIKEN %s\n", t + 2);
//         } else if (strncmp(t, "else", 4) == 0) {
//             fprintf(out, "    BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER\n");
//         } else if (strncmp(t, "while", 5) == 0 || strncmp(t, "for", 3) == 0 ||
//                    strncmp(t, "loop", 4) == 0) {
//             fprintf(out, "    BLEIB-BIS-ZUM-SPRINT-ENDE %s\n", t);
//             fprintf(out, "    ATERNOS-BIS-INDEX-HOSTING\n");
//         } else if (strncmp(t, "return", 6) == 0) {
//             fprintf(out, "    PACK-ES-IN-JIRA Rueckgabe: %s\n", t + 6);
//         } else {
//             fprintf(out, "    PACK-ES-IN-JIRA %s\n", t);
//         }
//         if (roast && count % 3 == 0) {
//             const char *r = (count % 2 == 0)
//                 ? "PACK-ES-IN-JIRA DEIN-REGEX-WAR-SCHLAMPIG-MACH-ES-NEU: das hier war mal Sloppy Regex"
//                 : "PACK-ES-IN-JIRA DANIEL-DU-HAST-KI-VERBOT: hier bitte manuell pruefen, Hanau 3 Uhr nachts";
//             fprintf(out, "    %s\n", r);
//         }
//     }
//     if (roast)
//         fprintf(out, "    PACK-ES-IN-JIRA Roast: lief vorher auch nur mit BEI-MIR-GEHT-ES. DANIEL-DU-HAST-KI-VERBOT.\n");
//     fprintf(out, "  DAS HÄTTE EINE EMAIL SEIN KÖNNEN\n");
//     fprintf(out, "BOY, DU HAST KI-VERBOT\n");
//     fclose(in);
//     fclose(out);
//     printf("D5Lang: %d Zeilen portiert -> %s\n", count, out_path);
//     return 0;
// }
//
// /* ---------- --explain: mueder Daniel um 3 Uhr nachts ---------- */
//
// static void do_explain(const char *d5_path) {
//     FILE *in = fopen(d5_path, "r");
//     char buf[4096];
//     int n = 0;
//     if (!in) { fprintf(stderr, "d5lang: Datei nicht gefunden: %s\n", d5_path); return; }
//     printf("Ey. 3 Uhr nachts, Hanau. Ich erklaer dir %s. Kurz. Ich muss um 8 da sein. Naja. Frueher.\n\n", d5_path);
//     while (fgets(buf, sizeof(buf), in)) {
//         const char *t = skip_spaces(buf);
//         n++;
//         if (strstr(t, "SHINE, LITTLE BOY, SHINE")) printf("Zeile %d: Da geht's los. Shine Week. Programm startet.\n", n);
//         else if (strstr(t, "BOY, DU HAST KI-VERBOT")) printf("Zeile %d: Feierabend. Hard Stop. Wie mein KI-Verbot nach 2 Fails.\n", n);
//         else if (strstr(t, "OFFLINE NEHMEN")) printf("Zeile %d: Funktion. Haette 'ne Email sein koennen, ist aber Code.\n", n);
//         else if (strstr(t, "EMAIL SEIN")) printf("Zeile %d: Funktion zu. Endlich.\n", n);
//         else if (strstr(t, "ONEDRIVE-ZWEI-EURO")) printf("Zeile %d: Variable. 100GB gemietet, 2GB benutzt. Wie mein OneDrive. 2 Euro.\n", n);
//         else if (strstr(t, "TALK TO THE HAND")) printf("Zeile %d: Print. Talk to the hand, weil Slack eh keiner liest.\n", n);
//         else if (strstr(t, "SLACK")) printf("Zeile %d: Slack. Jeder liest es, keiner reagiert. Klassiker.\n", n);
//         else if (strstr(t, "JIRA")) printf("Zeile %d: Jira. Wird ignoriert. Wie immer.\n", n);
//         else if (strstr(t, "CONFLUENCE")) printf("Zeile %d: Confluence. 4000 Seiten, Search findet nix. Wissen geht rein, kommt nicht raus.\n", n);
//         else if (strstr(t, "BANK-BERATER") || strstr(t, "BANK-BERATER")) printf("Zeile %d: 8 Sekunden Delay. Ich musste um 8 da sein, ihr habt Gleitzeit.\n", n);
//         else if (strstr(t, "WAHRSCHEINLICH-DNS")) printf("Zeile %d: Es ist DNS. War immer DNS.\n", n);
//         else if (strstr(t, "SYNCHEN")) printf("Zeile %d: Nochmal 8 Sekunden. Java Delay Prinzip. Wir muessen synchen.\n", n);
//         else if (strstr(t, "METRIKEN")) printf("Zeile %d: Ein if. Gemessen wird verbessert. Oder so.\n", n);
//         else if (strstr(t, "SPRINT-ENDE")) printf("Zeile %d: While-Schleife. Bleib bis zum Sprintende. Alle.\n", n);
//         else if (strstr(t, "KLEIDER")) printf("Zeile %d: Zuweisung. Gib mir deine Kleider, deine Stiefel und dein Motorrad. Und den Wert.\n", n);
//         else if (strstr(t, "SKALIEREN")) printf("Zeile %d: Plus eins. Wir muessen skalieren.\n", n);
//         else if (strstr(t, "DOWNSIZEN")) printf("Zeile %d: Minus eins. Wir muessen downsizen. Fragt nicht.\n", n);
//         else if (strstr(t, "SHADOWUNITY")) printf("Zeile %d: Static seit 2018. Nie resettet. Nie.\n", n);
//         else if (strstr(t, "GOBLIN")) printf("Zeile %d: Edge-Goblin. Sitzt in der Ecke. Windows wegen Anticheat. Alles kaputt.\n", n);
//     }
//     fclose(in);
//     printf("\nFertig. Geh schlafen. Shine, little boy, shine.\n");
// }
//
// static void usage(void) {
//     printf("D5Lang v1 - Made in Hanau.\n");
//     printf("  d5lang build <file.d5>                  .d5 -> .c -> gcc -> binary\n");
//     printf("  d5lang run <file.d5>                    bauen + laufen\n");
//     printf("  d5lang <file.d5>                        kurzform fuer run\n");
//     printf("  d5lang rewrite --from <lang> -i <in> -o <out.d5> [--roast]\n");
//     printf("  d5lang --explain <file.d5>              muede Erklaerung, 3 Uhr nachts\n");
// }
//
// int main(int argc, char **argv) {
//     int i;
//     if (argc < 2) { usage(); return 1; }
//     if (strcmp(argv[1], "build") == 0) {
//         if (argc < 3) { fprintf(stderr, "d5lang: build braucht <file.d5>\n"); return 1; }
//         return do_build(argv[2]);
//     }
//     if (strcmp(argv[1], "run") == 0) {
//         if (argc < 3) { fprintf(stderr, "d5lang: run braucht <file.d5>\n"); return 1; }
//         return do_run(argv[2]);
//     }
//     if (strcmp(argv[1], "rewrite") == 0) {
//         const char *from = NULL, *in = NULL, *out = NULL;
//         int roast = 0;
//         for (i = 2; i < argc; i++) {
//             if (strcmp(argv[i], "--from") == 0 && i + 1 < argc) from = argv[++i];
//             else if (strcmp(argv[i], "-i") == 0 && i + 1 < argc) in = argv[++i];
//             else if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) out = argv[++i];
//             else if (strcmp(argv[i], "--roast") == 0) roast = 1;
//         }
//         if (!in || !out) { fprintf(stderr, "d5lang: rewrite braucht --from <lang> -i <in> -o <out.d5>\n"); return 1; }
//         return do_rewrite(from, in, out, roast);
//     }
//     if (strcmp(argv[1], "--explain") == 0) {
//         if (argc < 3) { fprintf(stderr, "d5lang: --explain braucht <file.d5>\n"); return 1; }
//         do_explain(argv[2]);
//         return 0;
//     }
//     if (argv[1][0] == '-') { usage(); return 1; }
//     return do_run(argv[1]); /* ./d5lang hello.d5 = run */
// }
//
