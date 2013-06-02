% TODO
% Was ist noch alles zu machen bzw. welche Fehler sind noch offen.
% 2013, 

<!--

# TODO

-->

Mein Notiz Zettel über Ideen bzw. Änderungen dieser Seite.
Aber auch Fehler die noch nicht behoben sind findet man hier.

<!-- schnipp -->

---------------------------------------------------------------

**Übersicht**

* [Liste][]
* [Bugs][]

---------------------------------------------------------------


# Liste

Kleine Zusammenstellung über die Ideen die ich noch so habe.

Home Link
:	In den Seitenkopf muss noch ein HomeLink eingebaut werden.

Fusszeile überarbeiten
:	~~Bei der Fusszeile muss das Layout noch überarbeitet werden.~~

RSS Feed einbauen
:	Die Funktion des RSS Feeds muss noch eingebaut werden.

Inhaltsverzeichnis
:	Inhaltsverzeichnis in die einzelnen Seiten einbauen.
	Dabei sollte das Inhaltsverzeichnis nicht über die `pandoc` Funktion,
	sonder über ein externes Programm in das jeweilige Dokument eingefügt werden.
	So dass man, je nach Bedarf, dieses in die jeweilige Seite einbauen kann. Stichwort **make_toc**.

CSS, CSS, CSS
:	Hier muss noch einiges gemacht werden.
	
	- ~~Datum der Liste, `index.html` nach rechts legen.~~
	- ~~Fusszeile~~
	- Fixed DIV mit Link nach oben, Homepage Link.
	- ~~CSS der Definitionsliste, wie sie hier verwendet wird, erstellen.~~

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


Seite über einen externen Domain Namen ansprechen
:	~~Die Seite sollte über den externen Domain Namen
	[www.it-bayer.de/rumex](http://www.it-bayer.de/rumex)
	erreichbar sein.~~

	Infolink: <https://help.github.com/articles/setting-up-a-custom-domain-with-pages>

Makefile Variable index Seite einbinden
:	Die Variablen, die bei der Indexseite die Überschrift
	erstellen sollten nach `inc` gelegt werden.
	Einbindung in das `Makefile` dann per 
	`include inc/ueberschrift.makefile`.


# Bugs

Liste der Fehler 


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

CNAME
:	Der CNAME ist falsch gesetzt, Datei am besten ganz raus nehmen.
