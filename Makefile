SUBDIRS = src

PREFIX = /usr/local
GROUP  = autosshfs

all:
	@echo
	@echo autosshfs is based on the article and code at
	@echo http://pturing.firehead.org/software/autofs_sshfs/
	@echo
	@echo License: see COPYING file, or make license
	@echo
	@echo sudo make [un]install  -- Install or uninstall autosshfs
	@echo
 
install:
	@cd src && make
	@addgroup --system ${GROUP} 2>/dev/null
	@install -o root -g root     -m 0750 src/autosshfs-user ${PREFIX}/sbin/
	@install -o root -g ${GROUP} -m 0750 src/autosshfs-map  ${PREFIX}/sbin/
	@install -o root -g ${GROUP} -m 0750 src/autosshfs-ssh  ${PREFIX}/sbin/
	@install -o root -g root     -m 0755 bin/keychain-ring  ${PREFIX}/bin/
	@install -o root -g root     -m 0755 -d ${PREFIX}/share/doc/autosshfs/
	@install -o root -g root     -m 0644 doc/* ${PREFIX}/share/doc/autosshfs

uninstall:
	@rm -rf ${PREFIX}/sbin/autosshfs-* ${PREFIX}/bin/autosshfs-as-* ${PREFIX}/bin/keychain-ring ${PREFIX}/share/doc/autosshfs
	@delgroup ${GROUP} 2>/dev/null
	@cd src && make clean

license:
	@rm -f COPYING
	@wget -q -OCOPYING http://www.gnu.org/licenses/agpl.txt
