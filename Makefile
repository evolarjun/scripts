
INSTALL=install
.PHONY: install

PREFIX ?= $(HOME)
INSTALL_DIR ?= $(PREFIX)/bin
BINARIES = d2l d2f N50.pl fagrep fan50 fasta_count.pl delim2fixed

install: 
	@if [ ! -e $(INSTALL_DIR) ]; \
	then \
		mkdir -p $(INSTALL_DIR) ]; \
	fi
	$(INSTALL) -b -D -m 755 $(BINARIES) $(INSTALL_DIR)
