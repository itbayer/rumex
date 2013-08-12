#!/bin/bash



#
# update.sh
#
# update.sh ist die Vorstufe des Rumex updates.
# Sie überprüft, anhand der Versionsnummer, ob ein Update Sinn macht,
# übergibt noch offenen Dateien dem repro und setzt einen TAG
# für die alte Version.
# Anschließend wird dass eigentliche update Programm update2.sh
# geholt und gestartet.
#

echo "Rumex updaten"
echo "-------------"
echo ""

# Testen ob sich ein update lohnt.
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

# Dateien die noch offen sind ins Repor legen
git add ../.
git commit -a -m"...."


# TAG der alten Version setzen
git tag -a rx$AVERSION -m "Rumex $AVERSION vor Update auf Rumex $GVERSION"

exit

# hole die neue update2.sh Datei von github und das
# eigentliche Update ausführen zu können.
wget -o /dev/null -O ../.rumex/bin/update2.sh https://raw.github.com/itbayer/rumex/gh-pages/.rumex/bin/update2.sh

# ...und starten
bash ../.rumex/bin/update2.sh

exit


