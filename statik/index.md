% HTML, PDF, epub, odt und mobi
% mit pandocs markdown unter Rumex erstellen
% Stefan Blechschmidt, 2013


Rumex verwendet pandocs markdown weil man damit sehr einfach und schnell Text erstellen 
und in verschiedenen Formate wandeln kann.
Für die Erstellung von Denkschriften[^memorandum] wurde zusätzlich eine, ich nenne sie 
_statik Funktion_ eingebaut.
Mit dieser Funktion ist es möglich innerhalb eines Unterverzeichnisses 
verschiedenen Ausgabe Formate zu erstellen.
Zur Zeit werden, von Rumex, folgenden Formate unterstützt:

[^memorandum]: Neudeutsch würde man die Denkschrift als Memorandum bezeichnen.

- .html
- .pdf 
- .odt OpenDokument
- .epub E-Book
- .mobi E-Book (Kindle)

Erstellt werden die einzelnen Formate über [Funktionstasten](#rumex-kurztasten) die 
innerhalb (g)vim zur Verfügung stehen. \
~~Eine Besonderheit ist dass die `.htm` Datei auch ohne die zusätzlichen Dateien wie~~
~~Bilder oder die CSS Datei funktionieren. Alle Daten werden in die `.htm` Datei eingebunden.~~[^self-contained] \
Auch wurde die [Literaturfunktion](#litfunk) von Pandoc eingebaut sodass Verweise
auf anderen Quellen in den Denkschriften verwendet werden können.

[^self-contained]: Diese Eigenschaft wurde wieder entfernt da bei Dateien mit sehr 
vielen Bildern oder gar Videos, die auch in die HTML Datei eingebunden werden,
diese sehr groß wird. 
Bei der Verwaltung durch git wirkt sich diese Eigenschaft auch ungünstig aus.



# Die (g)vim statik Kurztaste in Rumex {#rumex-kurztasten}

Ab der Rumex Version 0.8.2 sind die Funktionstasten in Rumex enthalten.
Folgende F-Tasten wurden belegt.

F5
:	Erstellt die `.htm` Datei ohne Inhaltsverzeichnis.

Shift+F5
:	Erstellt die `.htm` Datei mit Inhaltsverzeichnis bin zur Ebene 3.

Alt+F5
:	Erstellt die `.htm` Datei mit kompletten Inhaltsverzeichnis
	bzw. bis Ebene 5 da LaTeX auch nicht mehr Ebenen unterstützt
	und die beiden Ausgabe Format annähernd identisch sein sollten.

Ctrl+F5
:	Öffnet die `.htm` Datei.

F6
:	Erstellt die `.pdf` Datei ohne Inhaltsverzeichnis.

Shift+F6
:	Erstellt die `.pdf` Datei mit Inhaltsverzeichnis bis zur Ebene 3.

Alt+F6
:	Erstellt die `.pdf` Datei mit kompletten Inhaltsverzeichnis.
	Hier ist anzumerken dass LaTeX nur Inhaltsverzeichnisse bis zur Ebene 5 unterstützt.
	Das HTML Format wurde entsprechend angepasst, siehe oben.

Ctrl+F6
:	Öffnet die `.pdf` Datei. Zur Zeit wird nur zathura unterstützt.

F7
:	Erstellt die restlichen Formate, `.epub`, `.odt` und `.mobi`.

Ctrl-F7
:	Öffnet die Literatur Verwaltung `rumex.bib`. Voraussetzung, jabref ist installiert. 



# HTML Formatierung

Die erzeugte HTML Datei besitzt Standardmäßig keine Formatierung bzw.
verwendet die Standard Darstellung des Browsers.

Kopf- und Fusszeile werden dadurch nicht, vom restlichen Text, unterschieden.
Auch das Inhaltsverzeichnis ist im ersten Moment als solches nicht 
gleich zu erkennen.
Dieses kann mit ein wenig CSS geändert werden.
Diese CSS Datei ist ab Rumex Version 0.8.2 enthalten muss aber unter
Umständen noch eingerichtet werden.

	cd .rx
	ln -s ../.rumex/default/statik.css statik.css



# Die Literaturverzeichnis Funktion {#litfunk}


Bei lesen des Artikels _"PDF-Dokumente schreiben mit Pandoc und Markdown"
[@stenderprolinux]_ ist mir die Idee gekommen die Rumex _statik Funktion_ mit einem 
Literaturverzeichnis, die ja auch in pandoc zur Verfügung steht, zu versehen.

#### Nachteil des Literaturverzeichnisses

Das Literaturverzeichnis wird immer gesetzt, auch dann wenn es nicht
verwendet wird.
Bedingt durch die CSS Formatierung 

~~~{.css}
.references:before {
	content: "Literaturverzeichnis";
~~~

wird somit die Überschrift _Literaturverzeichnis_ immer angezeigt.
Will man diese ausschalten kann man folgenden Trick verwenden.

Man schreibt dazu in die letzte Zeile des Dokuments die
HTML Anweisung

~~~{.html}
<div style="display:none;">
~~~

Diese Anweisung erstellt zwar eine fehlerhaften HTML Seite.
Der Browser wird aber diesen Fehler automatisch korrigieren.
Der div TAG, der das Literaturverzeichnis definiert, wird somit
von dem `display:none` div TAG umschlossen und ausgeblendet.


## Installation

Für die Verwendung der Literaturfunktion muss pandoc um das Zusatzprogramm 
`pandoc-citeproc` erweitert werden. 
Wer Pandoc über die Paketverwaltung installiert hat
braucht hier nichts zu machen.
Wer Pandoc manuell, so wie ich, installiert hat 
muss dieses Programm nachinstallieren.

Dazu erweitert man die Installationszeile um das neue Programm

	cabal update
	cabal install pandoc pandoc-citeproc

Zu guter Letzt erstellt man noch die symbolischen Links der 
beiden Programme.

	sudo ln -s /home/USER/.cabal/bin/pandoc /usr/local/bin/.
	sudo ln -s /home/USER/.cabal/bin/pandoc-citeproc /usr/local/bin/.


### Nachinstallation Rumex

Wer Rumex schon im Einsatz hat muss für die Erweiterung ein wenig
Hand anlegen.
Zu erste holt man sich die neue Version[^biberweiterung] von rumex. 

[^biberweiterung]: Die Literatur Erweiterung ist ab der Rumex Version 0.8.2 enthalten.

Dann braucht man noch drei zusätzliche Dateien im Verzeichnis `.rx`.

- `rumex.bib`
- `rumex.csl`
- `statik.css`

Wobei der [Literatur Vorlage Stiel][Literatur Stil] und die CSS Datei nur verlinkt wird. In der `rumex.bib` werden dann die Literatur Verweise verwaltet.

	cd .rx
	touch rumex.bib
	ln -s ../.rumex/default/din-1505-2.csl rumex.csl
	ln -s ../.rumex/default/statik.css statik.css



### Literatur Stil

Als Literatur Stil kommt `din-1505-2.csl` zum Einsatz.
Andere Stile findet man im git Repository 
<https://github.com/citation-style-language/styles.git>.
Als Name für die Stil Vorlage wurde `rumex.csl` gewählt damit 
mit eine Änderung des Stils einfach über den Symlink 
gemacht werden kann.


### Literatur Verwaltung

Für die Verwaltung der Literatur Datenbank verwende ich 
[Jabref](http://jabref.sourceforge.net/).

	sudo apt-get install jabref

Der Aufruf des Programms wurde auch auf einen F Taste gelegt.
Wer eine anderes Programm verwenden will muss diesen entsprechend anpassen.

### Tipps

- Auf @wiki:bibtex findet man eine schöne Beschreibung über die
Literatur Verwaltung mit BibTex.

- Die BibTex Einträge muss man sich unter Umständen 
nicht einmal selber erstellen.
Da verschiedene Seiten entsprechende Dienste anbieten.
Gelungen finde ich die Seite von <http://www.literatur-generator.de/>
aber auch auf <http://lead.to/amazon/en/?op=bt> findet 
man BibTeX Einträge.
Zwar muss man diese unter Umständen noch ein wenig überarbeiten
aber das Grund Gerüst wird einem sozusagen frei Haus geliefert. \
Wer einen Wikipedia Artikel zitieren dem wird unter
`"Werkzeuge -> Seite zitieren"` weiter geholfen.

- Für das zitieren von Internetseiten verwende ich folgende Formate.
Beide erzeugen dabei den Eintrag der auf dieser Seite im Literaturverzeichnis zu finden ist.

~~~
	@ELECTRONIC{ wiki:bibtex,
		author = "Wikipedia",
		title = "BibTeX --- Wikipedia{,} Die freie Enzyklopädie",
		year = "2013",
		url = "http://de.wikipedia.org/w/index.php?title=BibTeX&oldid=124228120", 
		note = "[Online; Stand 18. Dezember 2013]"
	}
~~~

>...oder 
<div style="padding-left:5em; font-size: .7em; color: blue; width: 60%;">
**Achtung:** Dieses Format wird von jabref nicht unterstützt 
und gegen ein anders ausgetauscht. 
Bei dem Einsatz von Jabref am besten ELECTRONIC verwenden.
</div>

~~~
	@WWW{ wiki:bibtex,
		author = "Wikipedia",
		title = "BibTeX --- Wikipedia{,} Die freie Enzyklopädie",
		year = "2013",
		url = "http://de.wikipedia.org/w/index.php?title=BibTeX&oldid=124228120", 
		note = "[Online; Stand 18. Dezember 2013]"
	}
~~~



# Verwendung in- und außerhalb von Rumex?

Innerhalb von Rumex erstellt man in einem separatem Unterverzeichnis 
die entsprechende markdown Datei und dann kann es auch schon los gehen.

Außerhalb von Rumex kann man diese Funktion natürlich auch verwenden.
Mit Außerhalb meine ich Denkschriften die nicht veröffentlicht werden.
Dazu gibt es zwei Möglichkeiten.

1. Die Datei bzw. das Verzeichnis in `.gitignore` hinterlegen.
Somit wird diese nicht verwaltet und auch nicht, bei
einem `make online`, hoch geladen.

2. Eine zweite lokale Rumex Installation die nur für Denkschriften
verwendet wird.



## Einbinden von Bildern

Bei dem Einbinden der Bilder muss man beachten dass die Erstellung 
der statik Datei vom Verzeichnis `.rx` ausgeht.

Will man also ein Bild, dass im Ordner der Statik Datei liegt einbinden
so muss auch auf das Bild aus der Sicht des `.rx` Verzeichnisses eingebunden
werden.

Beispiel:

Das Bild liegt im Ordner `statik` somit müsste der Markdown Befehl so aussehen.

	![Beispielbild](../statik/beispiel.png)

In Rumex kann man diese Funktion natürlich auch verwenden.
Am besten erstellt man sich dazu ein eigenes Unterverzeichnis und
dort die Datei `index.md` mit den Texten.


## Statik Dateien im `.rx` Verzeichnis

Es wird sicher passieren dass man die Funktionstasten der Statik Seiten
auch bei der Bearbeitung der eigentlichen Rumex Dateien drückt.
Durch entsprechende Einträge in der `.gitignore` Datei werden 
solche Dateien von einem Upload ausgeschlossen.
Mit den Aufruf von `make statikclean` können die erstellten 
statik Dateien Schlussendliche aus dem `.rx` Verzeichnis entfernt 
werden. Dieser Befehl wird auch bei `make clean` ausgeführt.

## Tipps 

Das PDF Programm `zathura` hat die Eigenschaft dass wenn sich die
Datei ändert diese automatisch nachgeladen wird.
Eine schöne Funktion wenn man seinen Text, an dem man gerade arbeitet,
immer wieder einmal im Ausgabe Format betrachten will.
Einfach die Taste F6 drücken, die Datei wird auch gleich gespeichert,
und mit ALT-TAB das Programm Fenster wechseln.

Bei Format HTML geht das natürlich auch. Nur muss hier eine Erweiterung
installiert werden.
Für die Browser Chromium und Firefox habe ich mit 
`Auto Refresh Plus`$^{Chromium}$ bzw.
`Tab Auto Reload`$^{FireFox}$ gute Erfahrungen gemacht.

----

Die PDF Datei dieser Beschreibung kann man sich [hier](index.pdf) ansehen.
Die Markdown Quelldatei kann man sich [hier](index.md) holen.

----



