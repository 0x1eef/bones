PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
LIBEXECDIR = $(PREFIX)/libexec/bones
SHAREDIR = $(PREFIX)/share/bones
MANDIR = $(PREFIX)/man

install:
	@find bin/ libexec/ share/ man/ -type d -exec install -m 0755 -d $(PREFIX)/"{}" \;
	@find bin/ libexec/ -type f -exec install -m 0755 "{}" $(PREFIX)/"{}" \;
	@find share/ -type f -exec install -m 0644 "{}" $(PREFIX)/"{}" \;
	@find man/ -type f -exec install -m 0644 "{}" $(PREFIX)/"{}" \;

deinstall:
	rm -rf $(BINDIR)/bones
	rm -rf $(LIBEXECDIR)
	rm -rf $(SHAREDIR)
	rm -rf $(MANDIR)/man1/bones.1

shellcheck:
	find libexec/ bin/ -type f -exec shellcheck {} +
