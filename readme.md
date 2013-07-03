# github HomePage Sand(Bau)kasten


Ziel des Projektes ist es eine Homepage die auf [github.com](http://github.com) 
gehostet werden kann zu erstellen.
Als Seiten Sprache wird `pandocs markdown` verwendet.
Die Steuerung des Systems übernimmt `make` und `perl`.

Den aktuelle Stand kann sich auf 
[www.it-bayer.de/rumex](http://www.it-bayer.de/rumex) 
ansehen.

## Newsletter

Rumex besitzt eine RSS Feed Funktion der  
[über diesern Link](http://www.it-bayer.de/rumex/rss.xml) 
abonnieren werden kann.

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
Die HTML Dateien funktionieren aber auf jedem andern Server,
siehe [rumex.html-5.me](http://rumex.html-5.me).

Wer einen Server mit installiertem `git` sein eigen nennt 
kann Rumex auch auf diesen installieren. 
Eine Beschreibung dazu findet man auf [rumex.it-bayer.de](http://rumex.it-bayer.de).

### System Voraussetzung

Der Rumex Baukasten ist auf *nix Systeme ausgerichtet.

------------------------------------------------------------

\(c) 2013- Stefan Blechschmidt (sb at it-bayer dot de). Released under the GPL, version 2 or greater. This software carries no warranty of any kind. 
