PREFIX  = /usr/local
GROUP   = autosshfs
RESTART = $(shell $(CURDIR)/../bin/which_restart)

SCRIPTS = autosshfs-map autosshfs-ssh autosshfs-user

mkscript = sed \
	-e "s|%PREFIX%|$(PREFIX)|" \
	-e "s|%GROUP%|$(GROUP)|" \
	-e "s|%RESTART%|$(RESTART)|" \
	$1.in

autosshfs-%: autosshfs-%.in
	$(call mkscript,$@) > $@

all: ${SCRIPTS}

clean:
	@rm ${SCRIPTS}
