Installation und Einrichten des Rumex Baukastens
========================================================

Vorbereitung des Rechners
--------------------------------------

Rumex ist auf ein *nix System ausgerichtet. Auf diesem sollten folgende
Programme installiert sein:

- bash
- make
- perl
- git
- pandoc
- imagemagick
- wget
- ~~wput~~
- sitecopy
- rsync
- vim (g)vim
- texlive

Wobei `bash`, `make` und `perl` eigentlich bei jeder `*nix` Installation
bereits vorhanden sein dürft. Die restlichen Programme müssen nach
installiert werden.

Wer mit dem Editor `vim` zurecht kommt sollte sich auch `(g)vim`
installieren. Rumex besitzt eine `gvim` Erweiterung die, die Arbeit bzw.
die Suche nach dem richtigen Befehl am Anfang um einiges erleichtert.

`texlive`[^texlive] wird nur gebraucht wenn man auch PDF Dateien erstellen
möchte.

[^texlive]: Die Funktion der PDF Erstellung ist zur Zeit noch nicht enthalten.

~~`wput`~~ `sitecopy` wird nur gebraucht wenn man die Daten per FTP hoch laden möchte.

`rsync` wird nur gebraucht wenn man die Daten per rsync hoch landen möchte.

    sudo apt-get install make perl

    sudo apt-get install git-core wget sitecopy rsync pandoc imagemagick

    sudo apt-get install gvim

    sudo apt-get install texlive

Installation von Rumex auf dem lokalen Arbeitsplatz
---------------------------------------------------

Für die Installation auf deinem Rechner musst du dir zu erst das ZIP
bzw. das tar.gz Archiv vom github Server holen und entpacken

    wget https://github.com/itbayer/rumex/archive/gh-pages.zip
    unzip gh-pages.zip

oder

    wget https://github.com/itbayer/rumex/archive/gh-pages.tar.gz
    tar -xzvf gh-pages.tar.gz

Jetzt wechsle in das Verzeichnis `rumex-gh-pages/.rx` und starte die
Befehle `make install` und `make show`.

    cd rumex-gh-pages/.rx/
    make install
    make show

Fertig :-)

Rumex auf dich einstellen
-------------------------

Nach der Installation muss Rumex noch auf dich eingestellt werden.
Genauer gesagt sollten folgende Angabe für deine neuen Seite angepasst
werden.

-   URL deiner Seite

-   Impressum

-   Kopf / Fusszeile

-   Logo

Eine Kurzbeschreibung findest du, nach der Installation, auf der
Startseite von Rumex.
Diese Seite kannst du [auch hier](../istart.html) nochmal einsehen.

