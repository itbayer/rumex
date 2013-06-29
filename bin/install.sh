#!/bin/bash

echo "Rumex neue Installation"
echo "-----------------------"
echo ""
echo -n "Willst du wirklich den Inhalt des rumex Verzeichnisses löschen [jn]?"

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

	echo "Lösche die readme.md aus dem root Verzeichnis"
	rm ../readme.md
	echo ""

	echo "Lösche alle .rx* Daten aus dem rumex Verzeichnis"
	rm *.rx*
	echo ""

	echo "Kopiere die Vorlagen aus dem template Verzeichnis"
	cp ../template/rx/*.rx* .
	echo ""

	echo "Dateien anpassen und dann ..."
	echo ""
	echo "make clean"
	echo "make all"
	echo "make show"
	echo ""
	echo ""
	echo "Viel Spass mit rumex wuenscht dir der IT-Bayer."
	echo ""

# ...wenn nein
else
	echo "Ok ...dann bleibt alles beim alten."
	echo ""
fi
