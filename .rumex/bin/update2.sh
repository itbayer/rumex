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
	echo "....kopiere die neuen Dateien: Verzeichnis .rumex/bin"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/bin ../.rumex/.

	echo ""
	echo "....kopiere die neuen Dateien: Verzeichnis .rumex/makefile"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/makefile ../.rumex/.
	
	echo ""
	echo "....kopiere die neuen Dateien: Verzeichnis .rumex/default"
    cp -a ../.rumex/tmp/rumex-gh-pages/.rumex/default ../.rumex/.
	
	echo ""
	echo "....kopiere die neuen Dateien: Verzeichnis rxtpl"
    cp -a ../.rumex/tmp/rumex-gh-pages/rxtpl ../.
	
	echo ""
	echo "....jetzt noch aufräumen..."

	# Update Daten loeschen
	rm -f ../.rumex/tmp/rumex.tar.gz
	rm -fr ../.rumex/tmp/rumex-gh-pages


	# Alte Dateien aus vorherigen Versionen loeschen
	# ----------------------------------------------------------------------
	# Datei blind.png loeschen -- Update bis 0.8.0
	[ -e ../rxtpl/img/blind.png ] && rm -f ../rxtpl/img/blind.png
	# Dateien im /bin Verzeichnis loeschen -- Update bis 0.8.1
	[ -e ../.rumex/bin/rumex.sh ] && rm -f ../.rumex/bin/rumex.sh
	[ -e ../.rumex/bin/update_robots.txt.pl ] && rm -f ../.rumex/bin/update_robots.txt.pl
	# wput.sh loeschen -- Update bis 0.8.1
	[ -e ../.rumex/bin/wput.sh ] && rm -f ../.rumex/bin/wput.sh
	# ttytter.pl loeschen -- Update bis 0.8.1 (wurde nach tmp verschoben
	[ -e ../.rumex/bin/ttytter.pl ] && rm -f ../.rumex/bin/ttytter.pl
	

	echo ""
	echo ""
	echo "Viel Spass mit der neuen Version Rumex Version $GVERSION."
	echo ""
	echo ""


	# ...wenn nein
else
	echo "Ok ...dann bleibt alles beim alten."
	echo ""
fi
