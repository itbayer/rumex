#!/bin/bash

# Pfad zur Rumex Installation
#PFAD=~/sbgit/github/rumex
# Pfad auslesen um symbolische Links verwenden zu können
PFAD=`readlink -f $0| perl  -ne 'chop; $_ =~ m/(.*)\/\.rumex.*/; print $1;'`

# Verzeichnis wechseln
cd $PFAD/.rx

# moot.it Konto Name aus der .rx/confik.mk lesen
#MOOTIT="rumex"
MOOTIT=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^MOOTIT.*?=.*?"(.*)"/)'`

# Autor für einen Weblog Eintrag aus der .rx/config.mk lesen
#WEBLOGAUTOR="IT-Bayer"
WEBLOGAUTOR=`cat config.mk | perl -ne 'chomp;print $1 if ($_ =~ m/^WEBLOGAUTOR.*?=.*?"(.*)"/)'`


# (G)VIM
GVIM=/usr/bin/gvim

# Repository neu landen / aktualisieren
# Diesen Schritt muss man eigentlich nicht machen
# da ich aber an verschiedenen Rechnern Rumex bearbeite
# und es mir schon oft passiert ist diese Befehl zu vergessen
# wurde dieser hier eingebaut.
git pull

# (G)VIM mit rumex Erweiterung laden
$GVIM -S ../.rumex/bin/rumex.gvim -c ":let mootit_konto='$MOOTIT'" -c ":let weblog_autor='$WEBLOGAUTOR'"
