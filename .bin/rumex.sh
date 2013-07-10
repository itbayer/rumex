#!/bin/bash

# Pfad 
PFAD=~/sbgit/github/rumex

# (G)VIM
GVIM=/usr/bin/gvim

# Verzeichnis wechseln
cd $PFAD/.rumex

# (G)VIM mit rumex Erweiterung laden
$GVIM -S ../.bin/rumex.vim
