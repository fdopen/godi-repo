SOURCES   = expat_stubs.c expat.mli expat.ml
CFLAGS    := $(CFLAGS) -fPIC -DPIC
CLIBS	  = expat
RESULT    = expat
#CC        = gcc
LIBINSTALL_FILES = \
  expat.cmi \
  expat.mli \
  expat.cma libexpat_stubs.a \
  $(wildcard dllexpat_stubs.*) \
  $(wildcard expat.cmxa) $(wildcard expat.a)

all:

-include $(OCAMLMAKEFILE)
