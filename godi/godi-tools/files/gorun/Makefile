ANNOTATE = yes

SOURCES	= run.c main.ml

PACKS	= unix

RESULT	= gorun

OCAMLFLAGS=-g -w A

OCAMLLDFLAGS=-ccopt '-subsystem windows'

CFLAGS=-Wall -Wextra -std=gnu99 -pedantic -Wunused-macros -Wshadow -Wmissing-prototypes -Wunused-parameter \
 -Wmissing-declarations -Wnested-externs -Wunreachable-code -Winline -Wcast-qual -Wcast-align -Wconversion \
 -Waggregate-return -Wstrict-prototypes -Wold-style-definition -Wnested-externs -Wredundant-decls -Wundef \
 -Wformat=2 -Wbad-function-cast
export CFLAGS


all: nc
-include $(OCAMLMAKEFILE)
