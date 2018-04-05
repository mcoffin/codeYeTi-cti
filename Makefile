M4_INCLUDES=$(shell find m4 -type f -name '*.m4')

.PHONY: default

default: dialogs/hud.hpp

%: $(M4_INCLUDES) %.m4
	m4 $^ > $@
