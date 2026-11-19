# nur gcc, sonst nichts. SHINE, LITTLE BOY, SHINE.
CC = gcc
CFLAGS = -O2 -std=c99 -Wall
BIN = d5lang

all: build

build: $(BIN)

$(BIN): d5lang.c
	$(CC) $(CFLAGS) -o $(BIN) d5lang.c

install: build
	cp $(BIN) /usr/local/bin/

hello: build
	./$(BIN) run examples/hello.d5

test: build
	./$(BIN) rewrite --from python -i tests/smoke.py -o smoke.d5
	./$(BIN) build examples/hello.d5

clean:
	rm -f $(BIN) $(BIN).exe smoke.d5
