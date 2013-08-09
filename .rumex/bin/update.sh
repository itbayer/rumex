#!/bin/bash

echo "Rumex updaten"
echo "-------------"
echo ""

AVERSION=`cat ../.rumex/default/version.txt`
AVERSION="0.7.3"
echo -n "Du hast die Version $AVERSION installiert, "

GVERSION=`wget -O - -o /dev/null https://raw.github.com/itbayer/rumex/gh-pages/.rumex/default/version.txt`
echo  "auf github befindet sich die Version $GVERSION."

if [ $AVERSION == $GVERSION ]; then
	echo ""
	echo -n "Ein Update würde keine Sinn machen. "
	echo "Am besten du versuchte es später noch einmal."
	echo ""
	exit
fi

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
	echo "....jetzt nur aufräumen und"
	rm -f ../.rumex/tmp/rumex.tar.gz
	rm -fr ../.rumex/tmp/rumex-gh-pages

	echo ""
	echo "....Fertig."
	echo ""
	echo ""
	echo "Viel Spass mit der neuen Version Rumex Version $GVERSION."

	echo ""
	echo "Leider ist die Update Funktion noch nicht fertig."
	echo ""

	# ...wenn nein
else
	echo "Ok ...dann bleibt alles beim alten."
	echo ""
fi
