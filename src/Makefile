SHELL = /bin/bash
PREFIX = ..
CC = gcc
OPTS = -Wall -g -lm 
BIN = $(PREFIX)/bin

all: angle install 

angle: angle.o 
	$(CC) angle.o $(OPTS) -o $@

install: ang.bash degrhms.pl angle  
	mkdir -p $(BIN)
	cp  ang.bash degrhms.pl angle $(BIN)
# Creating Symbolic links
	pushd $(BIN); ln -sf ang.bash ang; ln -sf degrhms.pl degrhms; popd

uninstall:
	pushd $(BIN); rm -f ang.bash ang degrhms.pl degrhms angle; popd 

clean:
	rm -f *.o angle

