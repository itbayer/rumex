#!/bin/bash

# Pfad der Rumex Installation
PFAD=~/sbgit/github/rumex

# moot.it Konto Name
MOOTIT="rumex"

# Autor für einen Weblog Eintrag
WEBLOGAUTOR="IT-Bayer"


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
$VIM -S ../.rumex/bin/rumex.vim -c ":let mootit_konto='$MOOTIT'" -c ":let weblog_autor='$WEBLOGAUTOR'"
