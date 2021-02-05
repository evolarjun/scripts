
INSTALL=install
.PHONY: install

PREFIX ?= $(HOME)
INSTALL_DIR ?= $(PREFIX)/bin
BINARIES = d2l d2f

install: 
	@if [ ! -e $(INSTALL_DIR) ]; \
	then \
		mkdir -p $(INSTALL_DIR) ]; \
	fi
	$(INSTALL) -b -d -m 755 $(BINARIES) $(INSTALL_DIR)
