# strlx
# by stx3plus1

SRC=src
CC=cc
SOURCE=$(wildcard $(SRC)/*.c)
COMMIT="\"$(shell git rev-parse HEAD | head -c6)\""
CFLAGS=-w -O3 -std=c2x -Dcommit=$(COMMIT) 
PREFIX=/usr
.PHONY: strlx

strlx: ${SOURCE}
	@echo "[$(CC)] $^ -> $@"
	@$(CC) -o $@ $^ $(CFLAGS)
	@strip $@

# run install with sudo/doas.
install: strlx
	@echo "[in] $< -> $(PREFIX)/bin/$<"
	@cp $< $(PREFIX)/bin

clean: 
	@rm -f strlx

uninstall:
	@echo "rm $(PREFIX)/bin/strlx"
	@rm $(PREFIX)/bin/strlx
