#
# beschreibung/makefile
#
# Erstellt die rumex Beschreibung (beschreibung/index.html)


rumex:
	cat kopf.md \
	vorwort.md \
	installation.md \
	vim-kurztasten.md \
	makefiles.md \
	rss-feed.md \
	rsync.md \
	statik-funktion.md \
	> index.md
	pandoc -s \
	--toc \
	--css ../rxtpl/css/statik.css \
	-o index.html index.md

# Aufräumen
# - löschen der .htm Dateien (vim-F8)
clean:
	rm *.htm
