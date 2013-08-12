#!/bin/bash

#
# update2.sh
#
# Die zweite Stufe des Rumex updates.
# Diese Datei wird vor jedem update frisch von github
# geholt und dann über update.sh ausgeführt.
#

echo ""
echo "Letzte Chance -- Willst du Rumex wirklich aktualisieren [jn]?"

while ((!x)); do
	read -sn1 x
	case "$x" in
		[JjYy])    i=1; x=1 ;;
	[Nn])      i=0; x=1 ;;
*)         x=0 ;;
  esac
done

echo ""
echo ""

# Wenn ja
if ((i)); then

	echo ""
	echo -n "....hole die neue Rumex Version vom GitHub Server "
	 wget -o /dev/null -O ../.rumex/tmp/rumex.tar.gz https://github.com/itbayer/rumex/archive/gh-pages.tar.gz
	
	echo "und packe sie aus"
	echo ""
	tar -xzvf ../.rumex/tmp/rumex.tar.gz -C ../.rumex/tmp/
	
	echo ""
	echo "....kopiere die neue Version von .rumex/bin"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/bin /tmp/rumextest/.rumex/.

	echo ""
	echo "....kopiere die neue Version von .rumex/makefile"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/makefile /tmp/rumextest/.rumex/.
	
	echo ""
	echo "....kopiere die neue Version von .rumex/default"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/default /tmp/rumextest/.rumex/.
	
	echo ""
	echo "....kopiere die neue Version von rxtpl"
    cp -a ../.rumex/tmp/rumex-gh-pages/rxtpl /tmp/rumextest/.
	
	
	
	echo ""
	echo "....jetzt noch aufräumen und"
	rm -f ../.rumex/tmp/rumex.tar.gz
	rm -fr ../.rumex/tmp/rumex-gh-pages

	echo ""
	echo ""
	echo "viel Spass mit der neuen Version Rumex Version $GVERSION."

	echo ""
	echo "Leider ist die Update Funktion noch nicht fertig."
	echo "Alle Dateien wurden in das /tmp/ Verzeichnis installiert."

	# ...wenn nein
else
	echo "Ok ...dann bleibt alles beim alten."
	echo ""
fi
