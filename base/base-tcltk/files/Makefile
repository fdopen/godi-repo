include tcltkversion.mk
include systemsubdir.mk

.PHONY: all
all: tcl tk

.PHONY: tcl
tcl:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) all

configure-tk.ok: tcl
	./configure-tk

.PHONY: tk
tk: tcl configure-tk.ok
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) all

.PHONY: clean
clean:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) clean
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) clean

.PHONY: test
test: 
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) test
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) test


.PHONY: install
install:
	make -C tcl$(TCLTKVERSION)/$(SYSTEMSUBDIR) install-binaries install-libraries
	make -C tk$(TCLTKVERSION)/$(SYSTEMSUBDIR) install-binaries install-libraries

.PHONY: distclean
distclean: clean
	rm configure-tk.inc
	rm configure-tk.ok
