# github HomePage Sand(Bau)kasten

Ziel des Projektes ist es einen einfachen Homepage Baukasten zur Verfügung zu stellen.
Als Seiten Sprache wird `pandocs markdown` verwendet.
Die Steuerung des Systems übernimmt `make`, `bash` und `perl`.
Für Seiten die nicht auf github gehostet werden
übernimmt `sitecopy` den Upload per FTP.

Den aktuelle Stand kann man sich auf 
[www.it-bayer.de/rumex](http://www.it-bayer.de/rumex) 
ansehen.

## Newsletter

Rumex besitzt eine RSS Feed Funktion.
Den RSS Feed des Rumex Baukastens kann man 
[über diesern Link](http://www.it-bayer.de/rumex/rss.xml) 
abonnieren.

## Weblog

Rumex ist auch mit einer einfachen Weblog Funktion ausgestattet.

## Kurz Übersicht 

### Seitenmenü

Es gibt kein Seitenmenü. `index.html` 
liefert eine Übersicht der einzelnen Seiten.
In den einzelnen Seiten kann dazu ein Kurztext / Vortext 
eingebaut werden.
Die Übersicht der Seiten wird chronologisch sortiert.

### Struktur durch Unterordner

Die einzelnen Seiten werden nicht durch Unterornder strukturiert.
Alle `html` Seiten liegen im root Verzeichnis.
**Also eher ein System für kleine Projekte.**

### Layout

Das Layout ist sehr einfach gehalten und besteht lediglich
aus ein paar `CSS` Anpassungen.

### Hosting

Das Hosting der Seite übernimmt [github.com](http://github.com).
Das Hosting auf einem Server mit FTP Zugang funktionieren auch
siehe [rumex.html-5.me](http://rumex.html-5.me) und [localstuff.zxq.net](http://localstuff.zxq.net/)

Wer einen Server mit installiertem `git` sein eigen nennt 
kann Rumex auch auf diesen installieren. 
Eine Beschreibung dazu findet man auf [rumex.it-bayer.de](http://rumex.it-bayer.de).

### Twitter

Eine Twitter Funktion ist auch eingebaut. 
Diese funktioniert mit (g)vim und dem Programm ttytter.pl.
Mit dieser Funktion können Texte, die in (g)vim geschrieben wurden 
über eine Kurztaste an twitter gesendet werden.

### System Voraussetzung

Der Rumex Baukasten ist auf *nix Systeme ausgerichtet.

------------------------------------------------------------

\(c) 2013,2014 - Stefan Blechschmidt (sb at it-bayer dot de). Released under the GPL, version 2 or greater. This software carries no warranty of any kind. 
