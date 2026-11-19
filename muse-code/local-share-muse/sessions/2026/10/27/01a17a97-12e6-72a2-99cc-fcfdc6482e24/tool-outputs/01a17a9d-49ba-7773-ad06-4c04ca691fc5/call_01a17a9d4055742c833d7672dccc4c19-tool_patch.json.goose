// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9d-49ba-7773-ad06-4c04ca691fc5/call_01a17a9d4055742c833d7672dccc4c19-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9d-49ba-7773-ad06-4c04ca691fc5/call_01a17a9d4055742c833d7672dccc4c19-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/27/01a17a97-12e6-72a2-99cc-fcfdc6482e24/tool-outputs/01a17a9d-49ba-7773-ad06-4c04ca691fc5/call_01a17a9d4055742c833d7672dccc4c19-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\Makefile","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":26,"lines":["+CC      ?= gcc","+CFLAGS  ?= -std=c11 -Wall -Wextra -O2","+PREFIX  ?= $(HOME)/.local","+BINDIR  ?= $(PREFIX)/bin","+","+SRC = src/main.c src/cli.c src/lexer.c src/parser.c src/ast.c \\","+      src/codegen.c src/runtime.c src/rewrite.c src/explain.c","+OBJ = $(SRC:.c=.o)","+BIN = traumalang","+","+all: $(BIN)","+","+$(BIN): $(OBJ)","+\t$(CC) $(CFLAGS) -o $@ $(OBJ)","+","+%.o: %.c","+\t$(CC) $(CFLAGS) -c $< -o $@","+","+install: $(BIN)","+\tmkdir -p \"$(DESTDIR)$(BINDIR)\"","+\tcp $(BIN) \"$(DESTDIR)$(BINDIR)/traumalang\"","+","+clean:","+\trm -f $(OBJ) $(BIN)","+","+.PHONY: all install clean"]}]}]}
