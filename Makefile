VERSION=$(shell cat version)

ifndef ($(PREFIX))
	PREFIX=/usr/local
endif

ifndef ($(PREFIX))
	PREFIX=/usr/local
endif

ifndef ($(INCLUDE_PATH))
	INCLUDE_PATH=$(PREFIX)/include/apq
endif

ifndef ($(LIB_PATH))
	LIB_PATH=$(PREFIX)/lib
endif

ifndef ($(GPR_PATH))
	GPR_PATH=$(LIB_PATH)/gnat 
endif


all:
	@echo setting up GPR file
	gnatprep "-Dversion=\"$(VERSION)\"" kow_framework_setup.gpr{.in,}

install:
	install -d $(GPR_PATH)
	install kow_framework_setup.gpr -t $(GPR_PATH)
