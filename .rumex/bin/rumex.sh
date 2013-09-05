#!/bin/bash


# Pfad 
PFAD=~/sbgit/github/rumex

# moot.it Konto Name
MOOTIT="rumex"

# (G)VIM
GVIM=/usr/bin/gvim

# Verzeichnis wechseln
cd $PFAD/.rx

# Repository neu landen / aktualisieren
# Diesen Schritt muss man eigentlich nicht machen
# da ich aber an verschiedenen Rechnern Rumex bearbeite
# und es mir schon oft passiert ist diese Befehl zu vergessen
# wurde dieser hier eingebaut.
git pull

# (G)VIM mit rumex Erweiterung laden
$GVIM -S ../.rumex/bin/rumex.gvim -c ":let mootit_konto='$MOOTIT'"
