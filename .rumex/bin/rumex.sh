#!/bin/bash


# Pfad 
PFAD=~/sbgit/github/rumex

# moot.it Konto Name
MOOTIT="rumex"

# (G)VIM
GVIM=/usr/bin/gvim

# Verzeichnis wechseln
cd $PFAD/.rx

# (G)VIM mit rumex Erweiterung laden
$GVIM -S ../.rumex/bin/rumex.vim -c ":let mootit_konto='$MOOTIT'"
