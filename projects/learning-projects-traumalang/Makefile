CC      ?= gcc
CFLAGS  ?= -std=c11 -Wall -Wextra -O2
PREFIX  ?= $(HOME)/.local
BINDIR  ?= $(PREFIX)/bin

SRC = src/main.c src/cli.c src/lexer.c src/parser.c src/ast.c \
      src/codegen.c src/runtime.c src/rewrite.c src/explain.c
OBJ = $(SRC:.c=.o)
BIN = traumalang

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

install: $(BIN)
	mkdir -p "$(DESTDIR)$(BINDIR)"
	cp $(BIN) "$(DESTDIR)$(BINDIR)/traumalang"

clean:
	rm -f $(OBJ) $(BIN)

.PHONY: all install clean
