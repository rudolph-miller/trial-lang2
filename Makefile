all: build run

build:
	cd src; yacc -d parse.y; lex scan.l
	clang -o bin/trial-lang2 -I./include -ledit src/main.c src/y.tab.c src/lex.yy.c

run:
	bin/trial-lang2
