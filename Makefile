SRC=src
BUILD=build
CC=gcc
CFLAGS=-std=c99
USERDIR=${HOME}

strfetch: $(SRC)/strfetch.c $(SRC)/func.c
	@echo Compiling...
	@mkdir -p $(BUILD)
	$(CC) -o $(BUILD)/$@ $^ $(CFLAGS)
	@strip $(BUILD)/$@
	@echo Done!

install: $(BUILD)/strfetch
	@echo Installing...
	@mkdir -p /usr/local/bin
	@cp $< /usr/local/bin/
	@echo Installing configuration file...
	@mkdir -p $(USERDIR)/.config/strfetch/
	@cp conf $(USERDIR)/.config/strfetch/conf
	@echo Done!

clean: 
	rm -rf build/