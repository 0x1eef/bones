PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
LIBEXECDIR = $(PREFIX)/libexec/bones
SHAREDIR = $(PREFIX)/share/bones

install:
	@find bin/ libexec/ share/ -type d -exec install -v -d $(PREFIX)/"{}" \;
	@find bin/ libexec/ -type f -exec install -v -m 0755 "{}" $(PREFIX)/"{}" \;
	@find share/ -type f -exec install -v -m 0644 "{}" $(PREFIX)/"{}" \;

deinstall:
	rm -rf $(BINDIR)/bones
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)

shellcheck:
	find libexec/ bin/ -type f -exec shellcheck {} +
