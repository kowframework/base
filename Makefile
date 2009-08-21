VERSION=1.0

ifndef ($(PREFIX))
	PREFIX=/usr/local
endif
INCLUDE_PREFIX=$(PREFIX)/include
LIB_PREFIX=$(PREFIX)/lib
GPR_PREFIX=$(LIB_PREFIX)/gnat


all:
	@echo setting up GPR file
	gnatprep "-Dversion=\"$(VERSION)\"" kow_framework_setup.gpr{.in,}

install:
	install -d $(GPR_PREFIX)
	install kow_framework_setup.gpr -t $(GPR_PREFIX)
