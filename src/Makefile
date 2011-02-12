PREFIX = /usr/local
GROUP  = autosshfs

SCRIPTS = autosshfs-map autosshfs-ssh autosshfs-user

mkscript = sed \
	-e "s|%PREFIX%|$(PREFIX)|" \
	-e "s|%GROUP%|$(GROUP)|" \
	$1.in
 
autosshfs-%: autosshfs-%.in
	$(call mkscript,$@) > $@

all: ${SCRIPTS}

clean:
	@rm ${SCRIPTS}
