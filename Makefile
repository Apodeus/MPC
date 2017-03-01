CC = gcc
CFLAGS=-g -Wall -std=c99
LDFLAGS=-lm
FFLAG=-lfl
FLEX = flex
BFLAGS=-d --report=all

#TD1/exo1

.c.o :
	gcc -c -o $@ $<


.y.c :
	yacc --file-prefix=$* -d $<
	mv $*.tab.c $*.c
	mv $*.tab.h $*.h

.l.c :
	lex -o $@ $<


imp : imp.yacc.o imp.lex.o
	gcc -o $@ $^
