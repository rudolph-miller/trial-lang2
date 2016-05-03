all: build run

build:
	clang -o bin/trial-lang2 -I./include -ledit src/main.c

run:
	bin/trial-lang2
