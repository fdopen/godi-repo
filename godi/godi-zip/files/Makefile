SOURCES   = zlibstubs.c zlib.mli zip.mli gzip.mli zlib.ml zip.ml gzip.ml
CFLAGS    := $(CFLAGS) -fPIC -DPIC
CLIBS	  = z
RESULT    = zip
CC        ?= gcc
LIBINSTALL_FILES = \
  zip.cmi gzip.cmi zlib.cmi \
  zip.mli gzip.mli zlib.mli \
  zip.cma libzip_stubs.a \
  $(wildcard dllzip_stubs.so) \
  $(wildcard zip.cmxa) $(wildcard zip.a)

all:

-include  $(OCAMLMAKEFILE)
