// Goose-Port-Spiegel von: projects/learning-projects-traumalang/src/rewrite.c
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-traumalang/src/rewrite.c");
}

// ---- Original-Code (projects/learning-projects-traumalang/src/rewrite.c), unveraendert, als Inline-Doku ----
// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <ctype.h>
// #include "rewrite.h"
//
// static int starts(const char *line, const char *p) {
//     while (*p && *line == *p) { line++; p++; }
//     return *p == '\0';
// }
// static const char *ltrim(const char *s) { while (*s==' '||*s=='\t'||*s=='\r') s++; return s; }
// static int contains(const char *h, const char *n) { return strstr(h, n) != NULL; }
//
// /* Extrahiert das erste "druckbare" Argument: String-Literal oder Bezeichner. */
// static void pick_arg(const char *line, char *out, size_t cap) {
//     const char *q = strchr(line, '"');
//     if (q) {
//         const char *e = strchr(q+1, '"');
//         size_t n = e ? (size_t)(e - q + 1) : strlen(q);
//         if (n >= cap) n = cap - 1;
//         memcpy(out, q, n); out[n] = '\0'; return;
//     }
//     /* letztes Wort als Variablenname */
//     const char *t = ltrim(line);
//     const char *last = NULL;
//     while (*t) {
//         while (*t==' '||*t=='\t') t++;
//         if (!*t) break;
//         last = t;
//         while (*t && *t!=' ' && *t!='\t' && *t!=';' && *t!='\r' && *t!='\n') t++;
//     }
//     if (last) {
//         const char *e = last;
//         while (*e && *e!=' ' && *e!='\t' && *e!=';' && *e!='\r' && *e!='\n') e++;
//         size_t n = (size_t)(e - last);
//         if (n >= cap) n = cap - 1;
//         memcpy(out, last, n); out[n] = '\0';
//         /* Funktionsklammern entfernen */
//         char *pp = strchr(out, '(');
//         if (pp) *pp = '\0';
//         /* in valides Ident saeubern */
//         for (size_t k = 0; out[k]; k++) if (!isalnum((unsigned char)out[k]) && out[k]!='_') out[k] = '_';
//         if (out[0]=='\0') snprintf(out, cap, "\"?\"");
//         return;
//     }
//     snprintf(out, cap, "\"?\"");
// }
//
// static void emit_var(FILE *o, const char *name, int *sync_added) {
//     (void)sync_added;
//     fprintf(o, "    WE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS %s\n", name);
// }
//
// int tl_rewrite_file(const char *from, const char *in_path, const char *out_path, int roast, char **warn_out) {
//     FILE *in = fopen(in_path, "r");
//     if (!in) return -1;
//     FILE *o = fopen(out_path, "w");
//     if (!o) { fclose(in); return -2; }
//     char *warn = (char*)calloc(1, 1);
//     size_t wlen = 0;
//     int srcline = 0, warns = 0, need_sync = 0;
//
//     fprintf(o, "IT'S SHOWTIME\n");
//     fprintf(o, "  WE NEED TO TAKE THIS OFFLINE main\n");
//
//     char line[2048];
//     while (fgets(line, sizeof line, in)) {
//         srcline++;
//         const char *t = ltrim(line);
//         char arg[512]; pick_arg(t, arg, sizeof arg);
//         /* Kommentare -> JIRA */
//         if (t[0]=='#' || starts(t, "//")) {
//             char cmt[512]; snprintf(cmt, sizeof cmt, "comment_%d", srcline);
//             fprintf(o, "    PUT IT IN JIRA %s\n", cmt);
//             continue;
//         }
//         if (t[0]=='\0' || t[0]=='\n') continue;
//         int handled = 0;
//         if (!strcmp(from, "rust")) {
//             if (contains(t, "fn main")) { handled = 1; }
//             else if (contains(t, "println!")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (starts(t, "let mut ") || starts(t, "let ")) {
//                 char name[128]; sscanf(t + (starts(t,"let mut ")?8:4), "%127[A-Za-z_0-9]", name);
//                 emit_var(o, name[0]?name:"v", NULL);
//                 fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s %s\n", name[0]?name:"v", "0");
//                 handled = 1;
//             }
//             else if (contains(t, "=") && !contains(t, "==")) { fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s\n", arg); handled = 1; }
//         } else if (!strcmp(from, "go")) {
//             need_sync = 1;
//             if (contains(t, "func main")) handled = 1;
//             else if (contains(t, "fmt.Println")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (starts(t, "var ") || contains(t, ":=")) {
//                 char name[128] = "v"; sscanf(t, "var %127[A-Za-z_0-9]", name);
//                 if (contains(t, ":=")) sscanf(t, " %127[A-Za-z_0-9]", name);
//                 emit_var(o, name, NULL);
//                 handled = 1;
//             }
//             else if (contains(t, "=") && !contains(t, "==")) { fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s\n", arg); handled = 1; }
//         } else if (!strcmp(from, "python")) {
//             if (starts(t, "def ")) {
//                 char name[128]="f"; sscanf(t+4, "%127[A-Za-z_0-9]", name);
//                 fprintf(o, "    WE NEED TO TAKE THIS OFFLINE %s\n", name);
//                 fprintf(o, "    THIS COULD HAVE BEEN AN EMAIL\n");
//                 handled = 1;
//             }
//             else if (starts(t, "print")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (starts(t, "if ")) { fprintf(o, "    DO IT FOR THE METRICS %s\n", arg); fprintf(o, "    YOU HAVE BEEN TERMINATED\n"); handled = 1; }
//             else if (starts(t, "else")) { fprintf(o, "    BLUE IS BROKEN GREEN IS WORSE\n"); handled = 1; }
//             else if (contains(t, "=") && !contains(t, "==")) {
//                 char name[128]="v"; sscanf(t, "%127[A-Za-z_0-9]", name);
//                 emit_var(o, name, NULL);
//                 fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s %s\n", name, arg);
//                 handled = 1;
//             }
//         } else if (!strcmp(from, "javascript") || !strcmp(from, "typescript")) {
//             if (contains(t, "console.log")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (contains(t, "async function")) { fprintf(o, "    I WAS DOUBLE-BOOKED ON 2 OFFSITES\n"); handled = 1; }
//             else if (contains(t, "function ")) {
//                 char name[128]="f"; const char *f = strstr(t, "function")+8; sscanf(f, " %127[A-Za-z_0-9]", name);
//                 fprintf(o, "    WE NEED TO TAKE THIS OFFLINE %s\n", name);
//                 fprintf(o, "    THIS COULD HAVE BEEN AN EMAIL\n");
//                 handled = 1;
//             }
//             else if (starts(t, "let ") || starts(t, "const ") || starts(t, "var ")) {
//                 char name[128]="v"; const char *sp = strchr(t, ' '); if (sp) sscanf(sp+1, "%127[A-Za-z_0-9]", name);
//                 emit_var(o, name, NULL); handled = 1;
//             }
//             else if (contains(t, "=") && !contains(t, "==")) { fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s\n", arg); handled = 1; }
//         } else if (!strcmp(from, "java")) {
//             need_sync = 1;
//             if (contains(t, "class ") || contains(t, "main(")) handled = 1;
//             else if (contains(t, "System.out.println")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (contains(t, "int ") || contains(t, "String ")) {
//                 char name[128]="v";
//                 const char *sp = strrchr(t, ' ');
//                 if (sp) sscanf(sp+1, "%127[A-Za-z_0-9]", name);
//                 emit_var(o, name, NULL); handled = 1;
//             }
//         } else if (!strcmp(from, "c") || !strcmp(from, "cpp")) {
//             if (contains(t, "int main")) handled = 1;
//             else if (contains(t, "printf")) { fprintf(o, "    TALK TO THE HAND %s\n", arg); handled = 1; }
//             else if (starts(t, "int ") || starts(t, "char ") || starts(t, "long ")) {
//                 char name[128]="v"; const char *sp = strrchr(t, ' '); if (sp) sscanf(sp+1, "%127[A-Za-z_0-9]", name);
//                 emit_var(o, name, NULL); handled = 1;
//             }
//             else if (contains(t, "=") && !contains(t, "==")) { fprintf(o, "    I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE %s\n", arg); handled = 1; }
//         } else { fclose(in); fclose(o); free(warn); return -3; }
//
//         if (!handled) {
//             warns++;
//             size_t need = strlen(t) + 64;
//             warn = (char*)realloc(warn, wlen + need);
//             char tmp[2200];
//             snprintf(tmp, sizeof tmp, "Zeile %d: Konstrukt nicht vollstaendig unterstuetzt: %s", srcline, t);
//             strcpy(warn + wlen, tmp); wlen += strlen(tmp);
//         }
//     }
//     if (need_sync) fprintf(o, "    WE NEED TO SYNC\n");
//     if (roast) {
//         fprintf(o, "    PUT IT IN JIRA THIS IS BLOCKED BY ANOTHER TEAM\n");
//         fprintf(o, "    /* THE CHANGE ADVISORY BOARD IS ON TUESDAYS MOST TUESDAYS */\n");
//         fprintf(o, "    WE RESERVED INSTANCES FOR A PROJECT THAT GOT CANCELLED\n");
//         fprintf(o, "    KNOWLEDGE GOES IN DOESNT COME OUT\n");
//         fprintf(o, "    /* JOB SECURITY IS MORE IMPORTANT THAN REDUNDANCY */\n");
//     }
//     fprintf(o, "  THIS COULD HAVE BEEN AN EMAIL\n");
//     fprintf(o, "YOU HAVE BEEN TERMINATED\n");
//     fclose(in); fclose(o);
//     if (warn_out) *warn_out = warn; else free(warn);
//     (void)warns;
//     return 0;
// }
//
