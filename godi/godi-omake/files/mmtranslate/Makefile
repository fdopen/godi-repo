#ANNOTATE = yes
#OCAMLFLAGS = -w A

PACKS = str cygwinpath
SOURCES = ohelper.mli ohelper.ml

RESULT  = mmtranslate

all: nc


distclean: clean
	rm -f *~


OCAMLMAKEFILE?=$(shell echo `godi_confdir`/../share/OCamlMakefile)

include $(OCAMLMAKEFILE)
