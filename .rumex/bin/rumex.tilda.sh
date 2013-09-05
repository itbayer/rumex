#!/bin/bash

# Pfad 
PFAD=~/sbgit/github/rumex

# moot.it Konto Name
MOOTIT="rumex"

# VIM
VIM=/usr/bin/vim

# Verzeichnis wechseln
cd $PFAD/.rx

# Repository neu landen / aktualisieren
# Diesen Schritt muss man eigentlich nicht machen
# da ich aber an verschiedenen Rechnern Rumex bearbeite
# und es mir schon oft passiert ist diese Befehl zu vergessen
# wurde dieser hier eingebaut.
git pull

# VIM mit rumex Erweiterung laden
$VIM -S ../.rumex/bin/rumex.vim -c ":let mootit_konto='$MOOTIT'"
