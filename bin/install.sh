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

if ((i)); then
  echo "Lösche alle rx* Daten aus dem rumex Verzeichnis"
  echo ""
  ls *.rx*

  echo ""
  echo "Kopiere die Vorlagen aus dem template Verzeichnis"
  cp ../template/*.vorlage .

  echo ""
  echo "...und benenne sie um:"
  echo ""
  for d in $(ls -1 *.vorlage 2>/dev/null) ;do 
	  z=${d#*} 
	  echo $z ${z%.*} 
  done

  echo ""
  echo "Diese Dateien müssen jetzt noch angepasst werden"
  echo "...und schon kann es los gehen mit"
  echo ""
  echo "make all"
  echo "make show"
  echo ""
  echo ""
  echo "Viel Spass mit rumex wuenscht dir der IT-Bayer."
  
else
  echo "Ok ...dann bleibt alles beim alten."
  echo ""
fi
