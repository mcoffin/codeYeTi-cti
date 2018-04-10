M4_FLAGS ?= -I m4

.PHONY: default

default: dialogs/hud.hpp

%: %.m4
	m4 $(M4_FLAGS) $^ > $@
