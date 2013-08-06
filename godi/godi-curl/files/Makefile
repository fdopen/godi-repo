SOURCES   = curl-helper.c curl.mli curl.ml
CLIBFLAGS = $(shell $(CURL_CONFIG) --libs)
CFLAGS    = -O2 -fPIC -DPIC  $(shell $(CURL_CONFIG) --cflags) -DHAVE_CONFIG_H
RESULT    = curl
CLIBS     = curl
CC        ?= gcc
LIBINSTALL_FILES = \
  curl.cmi \
  curl.mli \
  curl.cma libcurl_stubs.a \
  $(wildcard dllcurl_stubs.*) \
  $(wildcard curl.cmxa) $(wildcard curl.a)

export CLIBFLAGS
# Shouln't CLIBFLAGS be exported in OCamlMakefile ?

all:

-include $(OCAMLMAKEFILE)
