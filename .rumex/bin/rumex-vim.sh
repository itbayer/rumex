#!/bin/bash

# Pfad der Rumex Installation
#PFAD=~/sbgit/github/rumex
# Pfad auslesen um symbolische Links verwenden zu können
PFAD=`readlink -f $0| perl  -ne 'chop; $_ =~ m/(.*)\/\.rumex.*/; print $1;'`

# Verzeichnis wechseln
cd $PFAD/.rx

# moot.it Konto Name aus der .rx/confik.mk lesen
MOOTIT=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^MOOTIT.*?=.*?"(.*)"/)'`

# Autor für einen Weblog Eintrag aus der .rx/config.mk lesen
WEBLOGAUTOR=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^WEBLOGAUTOR.*?=.*?"(.*)"/)'`


# VIM
VIM=/usr/bin/vim


# Repository neu landen / aktualisieren
# Diesen Schritt muss man eigentlich nicht machen
# da ich aber an verschiedenen Rechnern Rumex bearbeite
# und es mir schon oft passiert ist diese Befehl zu vergessen
# wurde dieser hier eingebaut.
git pull

# Auf der Konsole funktioniert die Tastenkombination C-s für das Speichern 
# nicht. Dieser Befehl macht diese Tastenkombination wieder möglich.
/bin/stty -ixon


# VIM mit rumex Erweiterung laden
$VIM -S ../.rumex/bin/rumex.vim -c ":let mootit_konto='$MOOTIT'" -c ":let weblog_autor='$WEBLOGAUTOR'"
