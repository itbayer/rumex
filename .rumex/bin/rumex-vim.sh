#!/bin/bash

# Pfad der Rumex Installation
#PFAD=~/sbgit/github/rumex
# Pfad auslesen um symbolische Links verwenden zu können
PFAD=`readlink -f $0| perl  -ne 'chop; $_ =~ m/(.*)\/\.rumex.*/; print $1;'`


# moot.it Konto Name aus der .rx/confik.mk lesen
#MOOTIT="rumex"
MOOTIT=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^MOOTIT.*?=.*?"(.*)"/)'`

# Autor für einen Weblog Eintrag aus der .rx/config.mk lesen
#WEBLOGAUTOR="IT-Bayer"
WEBLOGAUTOR=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^WEBLOGAUTOR.*?=.*?"(.*)"/)'`


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
