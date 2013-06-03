% ToDo
% Was ist noch alles zu machen 
% bzw. welche Fehler sind noch offen

<!--

# ToDo

-->

Mein Notizzettel über Ideen bzw. Änderungen dieses Home Page Baukastens.
Aber auch Fehler die noch nicht behoben sind notiere ich mir hier.

<!-- schnipp -->

---------------------------------------------------------------

**Übersicht**

* [Liste][]
* [Bugs][]

---------------------------------------------------------------


# Liste

Kleine Zusammenstellung über die Ideen die ich noch so habe.

~~Home Link~~
:	~~In den Seitenkopf muss noch ein HomeLink eingebaut werden.~~
	Wurde als Seitenbanner realisiert.

~~Fusszeile überarbeiten~~
:	~~Bei der Fusszeile muss das Layout noch überarbeitet werden.~~

RSS Feed einbauen
:	Die Funktion des RSS Feeds muss noch eingebaut werden.

Sitemap einbauen
:	Das Programm für die `sitemap.xml` muss noch erstellt werden.
	Der Eintrag in der `robots.txt` ist schon vorhanden.
	Derzeit aber noch kommentiert.

Inhaltsverzeichnis
:	Inhaltsverzeichnis in die einzelnen Seiten einbauen.
	Dabei sollte das Inhaltsverzeichnis nicht über die `pandoc` Funktion,
	sonder über ein externes Programm in das jeweilige Dokument eingefügt werden.
	So dass man, je nach Bedarf, dieses in die jeweilige Seite einbauen kann. Stichwort **make_toc**.

CSS, CSS, CSS
:	Hier muss noch einiges gemacht werden.
	Derzeit stehen folgende Arbeiten an.
	
	- ~~Datum der Liste, `index.html` nach rechts legen.~~
	- ~~Fusszeile Layout~~
	- ~~Fixed DIV mit Link nach oben, Homepage Link.~~
	- ~~CSS der Definitionsliste, wie sie hier verwendet wird, erstellen.~~
	- Fussnoten

Beschreibung der Seite
:	Die Beschreibung der Seite fehlt auch noch.
	
	- Warum diese Seite? Geschichte Beweggründe.
	- Installation, Einrichten auf github.com
	- Installation auf dem Arbeitsplatz, Grundprogramme
	- Installation dieses Systems, Grundseite
	- Aufbau der Einzelseiten, Stichpunkt *"Vortext"*.
	- Bedienung der Seite. Was muss man beachten.
	- Seite an einen externen Domain Namen binden. \
		**Achtung:** nach dem Einrichten kann es bis zu 10 Minuten dauern
		bis die Umleitung funktioniert. \
		Bis dahin bekommt man eine 404 Seite zu sehen. \
		Auch bei einer eine Änderung der Seite kann diese bis zu 10
		Minuten brauchen bis sie sichtbar wird.

Bild Bearbeitung
:	Die Bildbearbeitung mittels ImageMagick muss noch in das `Makefile` eingebaut werden.

Biographie 
:	Biographie Funktion einbauen.

VIM Helfer
:	Scripte für den Editor VIM

Favicon
:	`favicon.ico` fehlt noch.


~~Seite über einen externen Domain Namen ansprechen~~
:	~~Die Seite sollte über den externen Domain Namen
	[www.it-bayer.de/rumex](http://www.it-bayer.de/rumex)
	erreichbar sein.~~

	Infolink: <https://help.github.com/articles/setting-up-a-custom-domain-with-pages>

~~Makefile Variable index Seite einbinden~~
:	~~Die Variablen, die bei der Indexseite die Überschrift
	erstellen sollten nach `inc` gelegt werden.
	Einbindung in das `Makefile` dann per 
	`include inc/ueberschrift.makefile`.~~

Kurze Seiten
:	Bei sehr kurzen Seiten kommt einen die Fusszeile in die Quere.
	Hier muss ein `min-weight` eingebaut werden.

Klasse .footnotes
:	Die Klasse `.footnotes` könnte auch noch angepasst werden.

~~Makefile~~
:	~~Die root `Makefile` Datei sollte die entsprechenden Befehle
	aus dem `inc` Verzeichnis einbinden.
	Somit müsste müsste bei einer Aktualisierung diese 
	nicht mehr einbezogen werden.~~

HTML Includer
:	Die HTML Dateien die `pandoc` includiert sollten auch von `pandoc` erstellt werden.
	Dazu muss auch eine entsprechende Regel im `Makefile` erstellt werden.


make newrumex
:	Script zum erstellen eines leeren Baukastens.



# Bugs

~~Abstand Definitionsliste~~
:	~~Werden innerhalb einer Definitionsliste Aufzählungen verwendet
	stimmt der Abstand zur nächsten Definitionsliste nicht mehr
	bzw. es ist keiner vorhanden.
	Bei einer normalen Zeile schaut es aber normal aus.~~

## Extern VIM

pandoc.syntax
:	- Vim wird, bei größeren Dateien, sehr langsam.
	- An verschiedenen Stellen wird die VIM Rechtschreibung nicht verwendet.

Dateinamen mit `_`
:	github.com liefert keine Seiten die mit einem Unterstrich beginnen aus.
	Muss im Programm `make_index.pl` noch geändert werden.
	**Dateien mit Unterstrichen werden zur Zeit für Entwurf Dateien verwendet.**

CNAME
:	~~Der CNAME ist falsch gesetzt, Datei am besten ganz raus nehmen.~~
