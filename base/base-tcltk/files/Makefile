include tcltkversion.mk
include systemsubdir.mk

.PHONY: all
all: tcl tk

.PHONY: tcl
tcl:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR)

configure-tk.ok: tcl
	./configure-tk

.PHONY: tk
tk: tcl configure-tk.ok
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR)

.PHONY: clean
clean:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) clean
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) clean

.PHONY: install
install:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) install
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) install

.PHONY: distclean
distclean: clean
	rm configure-tk.inc
	rm configure-tk.ok
