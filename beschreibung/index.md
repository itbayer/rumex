% Rumex Beschreibung
% Stefan Blechschmidt
% 2013, 2014, 2015, 2016

------------------------------------------------------

Vorwort
=======

Die Beweggründe mit einem eigenen System eine Internet Seite zu
Verwalten sind mit der Zeit in mir gewachsen.

Es gibt immer mehr Systeme die zum Erstellen und Verwalten von
Internetseiten eingesetzt werden. Probiert habe ich schon viele und mit
den meisten war ich auch sehr zufrieden, wenn da nicht immer der Hacken
mit dem Updates wäre. Irgendwie, zumindest kommt es mir so vor, ist der
Aufwand das System der Seite auf dem aktuellen Stand zu halten größer
geworden als den Inhalt der eigentlichen Seite zu pflegen.

Ich wünschte mir wieder eine Internetseite wie in früheren Zeiten. Eine
Seite die aus einfachen HTML Seiten besteht.

Irgendwann bin ich dann auf `markdown` und `pandoc` gestoßen und die
Idee dieses Home Page Baukastens ist entstanden.


Rumex?
------

Rumex ist die lateinische Bezeichnung für den
[Ampfer](http://de.wikipedia.org/wiki/Ampfer) und dieser taucht in der
Natur dann auf, wenn der Boden Überdüngt, Verdichtung und Beschädigt
ist. Rumex gehört zu den sogenannten Pionier Pflanzen. Er ist ein
Lückenfüller.

Genau das soll Rumex auch sein “ein Lückenfüller” für alle die … Systeme
satt haben.

![Kleine Gedankenkarte der Rumex Beschreibung. Zur Zeit in
Arbeit.](../bilder/beschreibung-vym_800_.png)


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

Alle Rumex Kurztasten, für den Editor VIM, beginnen mit einem `,r`[^ausnahmen].
Für die Bedienung von Rumex braucht mein nur ein paar. Viele der
Kurztasten beinhalten eine Kombination einzelner Kurztasten bzw.
Befehle.

[^ausnahmen]: Ausnahmen bestätigen die Regel. So wurde für die zwei spaltige
    Darstellung\
    `,spn2` verwendet.

Am Anfang ist es sicher einfacher GVIM zu verwenden, da hier ein Menü
eingebaut ist welches unter anderem auch die Kurztasten anzeigt.

Wer jedoch mit der
[tilda](beschreibung.html#homepage-änderung-schnell-und-immer-aktuell)
Unterstützung arbeitet sollte sich schon ein paar Kurztasten einprägen.

Textbausteine
=============

Mittels dieser Kurztasten können Textbausteine eingebunden werden.

`,rnd` (RumexNeueDatei)
-----------------------

Erstellt ein neues Datei Gerüst. Dabei wird der Dateiname gleich mit
eingebunden.

**So schaut’s aus**

    % vim-kurztasten
    %
    %


    <!--

     [vim-kurztasten](vim-kurztasten.html)
     =======================================================

    Vortext INDEX

    -->

    Vortext INDEX und SEITE

    <!-- schnipp -->

    TEXT DER SEITE

    <!-- vim: set ft=pandoc: -->

`,rnn` (RumexNeueNachricht)
---------------------------

Erstellt einen neuen News Eintrag. Diese Kurztaste macht eigentlich nur
in der Datei `rss.rx0x` Sinn. Das Datum hinter dem Titel, Überschrift 1,
wird von Rumex gesetzt, ist also immer die aktuelle Systemzeit beim
ausführen von `,rnn`.

     # Neue Nachricht <!-- 2013/11/10 00:30 -->

    <!--
    !> Link: http://www.it-bayer.de/rumex/
    !> Autor: IT-Bayer
    !> Kategorie: Neues
    -->

    Ab hier geht die neuen Nachricht los.

`,rwl` (RumexWeiterLeitung)
---------------------------

Erstellt einen neue Weiterleitungsseite.

**So schaut’s aus**

    % Weiterleitung nach ....html
    %
    %


    <script language="javascript">
    <!--
    //window.location.href="....html";
    // -->
    </script>

Anmerkung: Die Zeile `window.location.href=....html;` wurde hier
Kommentiert da sonst die javascript Weiterleitung greift. Normalerweise
findet man kein `//` vor der Zeile `window.location.href=....html`.

`,rmk` (RumexMootitKommentar)
-----------------------------

Erstellt einen Moot.it Kommentar Abschnitt. Als Kennzeichnung wird der
Dateiname ohne `rx??` eingebaut / angehängt.

     # Kommentare

    <a class="moot" href="https://moot.it/i/rumex/blog/vim-kurztasten"></a>

`,rnb` (RumexNeuenweBlog)
-------------------------

Erstelle einen neuen Weblog Eintrag.

     # Rumex WebLog

    _am 09.09.2013 um 15:21 schrieb IT-Bayer_

    Text für den Eintrag

    <div class="weblog">
    Text der vorerst ausgeblendet ist.
    </div>

Git Kommandos
=============

`,rgp` (RumexGitPull)
---------------------

Git pull

`,rgs` (RumexGitStatus)
-----------------------

Git status

Text Formatierung
=================

`,rff` (RumexFormatFett)
------------------------

Markierte Textstelle fett darstellen

`,rfk` (RumexFormatKursiv)
--------------------------

Markierte Textstelle kursiv darstellen

`,rfl` (RumexFormatListe)
-------------------------

Markierte Zeilen in eine Liste wandeln

`,rfn` (RumexFormatNummernliste)
--------------------------------

Markierte Zeile in eine Nummernliste wandeln

`,rfb` (RumexFormatBlock)
-------------------------

Markierte Zeile in einen Block wandeln

,rfc
:   Markierte Zeile als Code darstellen

,spn2
:   Text mit 2er Spalten Formatierung umschließen

,spn3
:   Text mit 3er Spalten Formatierung umschließen

,spn4
:   Text mit 4er Spalten Formatierung umschließen

Make Befehle
============

`,rma` (RumexMakeAll)
---------------------

Speichert alle offenen Dokumente und erstellt daraus die HTML Datei.

`,rmb` (RumexMakeBild)
----------------------

Erstellt die unterschiedlichen Bildgrößen

`,rmca` (RumexMakeCleanAll)
---------------------------

Löscht alle html Dateien, alle Bildergrößen und alle xml Dateien.
beinhaltet die drei Befehle `make bclean`, `make hclean`, `make xclean`.

`,rmcb` (RumexMakeCleanBilder)
------------------------------

Löscht alle Bildgrößen aus dem `bilder/` Verzeichnis. Es werden nur die
Bilder gelöscht die von Rumex erstellt wurden siehe `make bilder`.

`,rmch` (RumexMakeCleanHtml)
----------------------------

Löscht alle `.html` Dateien die von Rumex erstellt wurden.

`,rmcx` (RumexMakeCleanXml)
---------------------------

Löscht alle `.xlm` Dateien die von Rumex erstellt wurden.

`,rmcf5` (RumexMakeCleanF8htm)
------------------------------

Löscht alle `.htm` Dateien die mittels der Gvim Taste F5, siehe [HTML
und PDF Dateine mit pandoc und gvim
erstellen](http://www.it-bayer.de/rumex/statik/index.htm), erstellt
wurden.

`,rmh` (RumexMakeHtml)
----------------------

Erstellt die `.html` Dateien.

`,rmi` (RumexMakeIndex)
-----------------------

Erstellt die index Datei.

`,rmm` (RumexMakesiteMap)
-------------------------

Erstellt die sitemap Datei.

`,rmo` (RumexMakeOnline)
------------------------

Speichert alle Dateien und stellt diese online.

`,rmr` (RumexMakeRss)
---------------------

Erstellt die rss Datei.

`,rms` (RumexMakeSuche)
-----------------------

Erstellt die Rumex Suche, bzw. die Dateiliste die für die Suche
verwendet werden soll.

Vorschau
========

`,rsf` (RumexShowFile)
----------------------

Zeigt eine Vorschau der Seite der Datei `file:///` im Standardbrowser.

`,rsw` (RumexShowWww)
---------------------

Zeigt eine Vorschau der Seite **Online** im Standardbrowser.

`,rsl` (RumexShowLocal)
-----------------------

Zeigt eine Vorschau der Seite auf dem eigenen Rechner. Diese Kurztaste
kann aber nur verwendet werden wenn auf dem Rechner der Apache
installiert und entsprechend eingerichtet ist.

Sonstiges
=========

`,rku`
------

Öffnet das Unterverzeichnis `.rx` in einem neuen VimTab Fenster. Keine
Ahnung warum ich diese Kurztaste so benannt habe.

`,ros` (RumexOpenStart)
-----------------------

Öffnet die `start.rx0s` in einen neuen VIM Tab Fenster.

`,ror` (RumexOpenRss)
---------------------

Öffnet die `rss.rx0x` in einen neuen VIM Tab Fenster.

# Makefiles

Der Rumex Baukasten wird mittels des Programms `make` gesteuert.
Die einzelne Befehle sind dabei in verschiedene Dateien aufgeteilt.

.rumex/makefile/config.mk
:	Einstellung der verschiedenen Parameter	

.rumex/makefile/main.mk
:	Befehle zum Erstellen der Baukastendaten.

.rumex/makefile/html.mk
:	Erstellt die einzelnen HTML Dateien

.rumex/makefile/bilder.mk
:	Erstellt die unterschiedlichen Bildgrößen	

.rumex/makefile/Makefile
:	Fügt die einzelnen Makefile Dateien zusammen.

.rumex/makefile/pdf.mk
:	Hier findet man die Befehle für die PDF Erstellung.
	_Wird zur zeit nicht verwendet._




.rx/config.mk
:	In dieser Datei werden die Benutzer spezifischen 
	Einstellungen gemacht. 
	Die Variablen in dieser Datei überschreiben die der
	Datei `.rumex/makefile/config.mk`.

.rx/Makefile
:	Diese Datei ist ein symbolischer Link auf 
	`Makefile -> ../.rumex/makefile/Makefile`.





## .rumex/makefile/config.mk

In dieser Datei befinden sich die Parameter um den rumex
Baukasten anpassen zu können.


### URL der Seite : ohne abschließenden /

	URL="http://www.it-bayer.de/rumex"

### Überschriften für die Index Seite

~~~
	INDEX_TITEL = "RUMEX Standard Installation"
	INDEX_AUTOR = " --- "
	INDEX_DATUM = $(shell ls index.rx0x -l --time-style=+%Y-%m-%d | awk '{print $$6}')
~~~

### RSS Überschrift (HTML)

	RSS_TITEL = "Neuigkeiten von rumex Baukasten"


### CSS, Template des Baukastens

	CSSALL = "rxtpl/css/all.css"
	CSSSCREEN = "rxtpl/css/screen.css"
	CSSPRINT = "rxtpl/css/print.css"
	CSSHANDHELD = "rxtpl/css/handheld.css"


### Bild für das Seitenbanner

	SEITENBANNER = "rxtpl/img/rumex.png"



### Moot.it Schalter

Schalter ob das externe Tool von moot.it eingebunden werden soll
Man sollte hier den Kontonamen angeben..
Wird moot.it nicht verwendet, den Parameter kommentiert
lassen.

	MOOTIT = "rumex"




###  Autor für den Weblog Eintrag

	WEBLOGAUTOR = "IT-Bayer"



### Autor Angaben für den HTML Kopf

	META_PUBLISHER = "IT-Bayer"
	META_CREATOR = "IT-Bayer (Stefan Blechschmidt)"



### Rumexsuche, Verzeichnis für die JavaScript Suchfunktion

	RUMEXSUCHE = "rxtpl/js"




### Favicon

	FAVICON = "favicon.gif"




### FTP Upload Funktion mit sitecopy

	SITECOPY = /usr/bin/sitecopy



### Rsync Schalter 

Schaltet die `rsync` Funktion ein.
	
	RSYNC = /usr/bin/rsync
	
### Rsync Musterdatei für Datei die nicht hoch geladen werden

	RSYNCEXCLUDE = rsync-exclude
	
### Rsync ssh Benutzername

	RSYNCUSER = USER
	
### Rsync Quellverzeichnis 

	RSYNCQUELLE = ../

### Rsync Zielverzeichnis auf dem Server

	RSYNCZIEL = $(RSYNCUSER):~/www.it-bayer.de/

### Rsync Parameter 
	
	RSYNCPARAMETER = -e "ssh" --checksum -rlvzu --delete-excluded --exclude-from=$(RSYNCEXCLUDE)



### Auswahl der Pandoc Vorlagen zur Seiten Erstellung

Ist im .rx/ Verzeichnis eine entsprechende Datei vorhanden wird diese verwendet.
Ansonst wird die Datei aus dem Verzeichnis .rumex/default verwendet.

	HTML_TEMPLATE = $(shell if [ -f ../.rx/html.template ];then echo \"../.rx/html.template\";else echo \"../.rumex/default/html.template\";fi)
	KOPF_TEMPLATE = $(shell if [ -f ../.rx/kopf.html ];then echo \"../.rx/kopf.html\";else echo \"../.rumex/default/kopf.html\";fi)
	HEADER_TEMPLATE = $(shell if [ -f ../.rx/header.html ];then echo \"../.rx/header.html\";else echo \"../.rumex/default/header.html\";fi)
	FUSS_TEMPLATE = $(shell if [ -f ../.rx/fuss.html ];then echo \"../.rx/fuss.html\";else echo \"../.rumex/default/fuss.html\";fi)



### META Angabe der unterschiedlichen Seitentypen

HTML Meta Angaben für die Seitenerstellung der Seitentypen
`rx?s, rx?v, rx?w`.

	META_ROBOTS_STANDARD = "all"
	META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
	META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"




### Programm zum erstellen der index.rx0x

	INDEX="../.rumex/bin/index.pl"




### Programm zum erstellen des RSS Feed

	RX2RSS = "../.rumex/bin/rx2rss.pl"

### Name der RSS Datei die in den Quelltext eingebaut wird

	RSS_FILE = "rss.xml"

### Externe RSS URL verwenden

Ist diese Variable gesetzt wird die interne RSS Verarbeitung, RSS_FILE, übersprungen
und die externe URL verwendet.

	RSS_EXTERN = "http://www.it-bayer.de/rss.xml"





### Programm zum erstellen der XML Sitemap Datei

	SITEMAP_XML = "../.rumex/bin/sitemap_xml.pl"

### Zieldatei der Sitemap Datei

	SITEMAP_XML_FILE = "../sitemap.xml"

### Programm zum erstellen der rx0v Sitemap Datei

	SITEMAP_RX = "../.rumex/bin/sitemap_rx.pl"

### Zieldatei der HTML Sitemap Datei

	SITEMAP_RX_FILE = "sitemap.rx0v"




### Verzeichnis in dem sich die Bilder befinden.

	BVZ="../bilder"




### Pandoc Programm

	PANDOC = /usr/bin/pandoc




### Programm zum Erstellen der rumexsuche_config.js

	SUCHE = "../.rumex/bin/suche.pl"


### Ziel Datei für die JavaScript Suche

	SUCHE_JS_CONFIG="../$(RUMEXSUCHE)/rumexsuche_config.js"




### Rumex Versionshinweis für die HTML Dateien

	META_GENERATOR = "rumex "$(shell cat ../.rumex/default/version.txt)






## .rumex/makefile/main.mk

In dieser Datei befinden sich die Befehle zur Erstellung 
der Dateien. Aufgerufen werden diesem mit `make BEFEHL`.

index
:	Erstellt die index.rx0x Datei und anschließend die .html
	Dateien.



all
:	Macht folgende Schritte
	- index 
	- suche
	- sitemap
	- rss
	- html 
	- bilder
	- robots



online
:	Erstellt die Seite, berücksichtigt alle Änderungen
	und lädt anschließend die Seite auf den Server.
	Hierbei werden die Schalter

	- SITECOPY
	- RSYNC
	
	berücksichtigt.
	Ist keiner dieser Schalter gesetzt wird `git` verwendet.




rss
:	Erstellt die RSS Datei.
	Es wird der Schalter `RSS_EXTERN`
	ausgewertet.
	Ist dieser gesetzt wird eine Meldung ausgegeben
	und der Wert aus `RSS_EXTERN` in die Seiten eingebunden.





# #######################################################
# alle XML und rs sitemap zusammen
sitemap:
	make -s sitemaprx
	make -s sitemapxml


# #######################################################
# Sitemap XML Datei erstellen
sitemapxml:
	$(SITEMAP_XML) $(URL) > $(SITEMAP_XML_FILE)


# #######################################################
# Sitemap rx?? Datei erstellen. Die eigentliche rss.html
# wird dann durch make html erstellt.
sitemaprx:
	$(SITEMAP_RX) $(URL) > $(SITEMAP_RX_FILE)
	make -s html


# #######################################################
# alle clean's auf einmal
clean:
	make -s hclean
	make -s xclean
	make -s bclean
	make -s statikclean


# #######################################################
# HTML Dateien aus dem root Verzeichnis löschen
hclean:
	rm -f ../*.html


# #######################################################
# XML aus dem root Verzeichnis löschen
xclean:
	rm -f ../*.xml


# #######################################################
# Bild Verzeichnis bereinigen
bclean: 
	rm -f ../bilder/*_???_.*

# #######################################################
# .htm Dateien die per F5, F6 oder F7 erstellt wurde aus dem .rx 
# 	Verzeichnis löschen. 
# 	Siehe dazu http://it-bayer.de/rumex/statik/.
statikclean: 
	rm -f *.htm
	rm -f *.pdf
	rm -f *.epub
	rm -f *.odt
	rm -f *.mobi

# #######################################################
# rumex Installieren
install:
	../.rumex/bin/install.sh

# #######################################################
# rumex Updaten
update:
	../.rumex/bin/update.sh

# #######################################################
# index.html im Standard Browser öffnen
show:
	x-www-browser ../index.html 2>/dev/null

# ######################################################
# Online Seite öffnen
showwww:
	x-www-browser $(URL) 2>/dev/null

# ######################################################
# localhost öffnen
showlocal:
	x-www-browser localhost 2>/dev/null


# ######################################################
# Konfigurationsdatei für die JavaScript Suche erstellen
suche:
	$(SUCHE) > $(SUCHE_JS_CONFIG)

# ######################################################
# robots.txt updaten
robots: 
	../.rumex/bin/robots.txt_update.pl


RSS Feed Funktion
=================

TODO

Wird nicht aus den einzelnen Dateien erstellt sondern muss manuell
editiert werden, Datei `.rx/rss.rx0x`.

Jede Überschrift eines Eintrags muss mit einem `{.nn1}` enden.

Danach kommen die Angaben zu:

**Link:** *Verweis zur Seite mit weiteren Informationen*\
**Autor:** *Autor der den Eintrag geschrieben hat*\
**Kategorie:** *Kategoie des Eintrags*\
**Datum:** *Datum des Eintrags.* Das richtige Format bekommt man mit dem
Befehl `date -R`.

die in HTML Kommentar Marker eingeschlossen sind.

Anschließend folgt die Meldung. Zur Zeit werden folgende `pandoc`
Formatierungen unterstützt.

-   Überschriften ab der Stufe 3 `###`

-   Aufzählungen `-`

-   Aufzählungen `*`

-   Zitate `>`

-   Links `[Link](http://muster.tdl)`. Diese dürfen nicht am Anfang
    einer Zeile stehen.

-   Bilder `![Bild](../bilder/muster.png muster.png)`, Diese dürfen
    nicht am Anfang einer Zeile stehen.

-   Code \`Code\`.

Beispiel einer RSS Feed Seite
-----------------------------

RSS Dateiname
-------------

Der Dateiname ist mit `rss.xml` vorbelegt und kann über die Variable
`RSS_FILE` in der `config.md` geändert werden.

RSS Titel
---------

Der Title des RSS Feed wird durch die Variable `RSS_TITEL` angepasst.

    RSS_TITEL = "Neuigkeiten von rumex Baukasten"

RSS auslagern
-------------

Den RSS Link kann man auch auslagern so dass dieser auf eine andere
Seite zeigt. Dazu setzt man die Variable `RSS_EXTERN` mit dem
entsprechenden Link. Die Variabel `RSS_FILE` wird dadurch nicht mehr
verwendet. Auch der RSS Lauf wird dadurch ausgeschaltet und durch eine
Meldung ersetzt.

RSS Kurztaste
-------------

Für die einzelnen Einträge steht auch eine Kurztaste `.rnn` zur
Verfügung.\
In Gvim unter

    Rumex -> TextBausteine -> NeuerNews Eintrag

Eingefügt wird dann folgende Vorgabe. Der Wert hinter Datum wird von
System ausgelesen und entsprechende gesetzt.

     # Neue Nachricht{.nn1}

    <!--
    | Link: http://www.it-bayer.de/rumex/
    | Autor: IT-Bayer
    | Kategorie: Neues
    | Datum: Mon, 28 Oct 2013 07:36:56 +0100
    -->

    Ab hier geht die neue Nachricht los.

Interna
-------

Durch die beschriebenen RSS Variablen wird die Erstellung des RSS Feed
gesteuert. Es wird in jede HTML Datei nachfolgender Header Abschnitt
eingebaut wenn die `RSS_TITLE` Variable gesetzt wurde. `RSS_FILE` bzw.
`RSS_EXTERN` steuern den `href` Eintrag.
Upload mit rsync
================================

Ab der Version `0.8.5.1` wird ein Upload mittels `rsync` unterstützt.
Für diese Funktion ist ein `SSH` Zugang zum Server erforderlich.


Die entsprechenden Variablen findet man in der Datei
`.rumex/makefile/config.mk`.



**Ausschnitt aus der Datei `.rumex/makefile/main.mk`**

~~~
#-------------------------------------------------------------------------------
# Upload mit rsync
# 
# Variable für die Aktualisierung
#
# Schalter für die rsync Funktion.
#RSYNC = /usr/bin/rsync
#
# Datei mit den Mustern die nicht hoch geladen werden.
RSYNCEXCLUDE = rsync-exclude
# ssh Benutzername
RSYNCUSER = USER
# Quellverzeichnis ab dem rsync arbeiten soll
RSYNCQUELLE = ../
# Zielverzeichnis auf dem Server
RSYNCZIEL = $(RSYNCUSER):~/www.it-bayer.de/
# Parameter für Rsync
RSYNCPARAMETER = -e "ssh" --checksum -rlvzu --delete-excluded --exclude-from=$(RSYNCEXCLUDE)
#
~~~





Beschreibung der Makefile Schalter
------------------------------------------------------------

RSYNC
:	Diese Variable hat zwei Funktionen

	1. Pfadangabe des `rsync` Programms
	2. Schalter ob diese Funktion verwendet wird.
	_Dieser Schalter ist per Standard kommentiert._

	Vorgabe: \
	`/usr/bin/rsync`


RSYNCEXCLUDE
:	Datei in der die Muster definiert werden die **nicht**
	synchronisiert werden. Die Datei findet man im `.rx/`
	Verzeichnis.
	
	Vorgabe: \
	`rsync-exclude`


RSYNCUSER
:	Benutzername des SSH Zugangs 
	
	Vorgabe: \
	`USER`

RSYNCQUELLE 
:	Quelle ab dem `rsync` die Dateien berücksichtigen soll.
	_Da das Programm `make` im `.rx` Verzeichnis ausgeführt
	wird ist die Vorgabe ein Verzeichnis tiefer._
	Diese Variable braucht normal nicht geändert werden.
	
	Vorgabe: \
	`../`

RSYNCZIEL 
:	Zeilverzeichnis auf dem Server.
	Das Verzeichnis muss vorhanden und beschreibbar sein.
	
	Vorgabe: \
	`$(RSYNCUSER):~/www.it-bayer.de/`

RSYNCPARAMETER
:	Parameter für den rsync Lauf.
	Dieser Parameter braucht normal nicht geändert werden.
	
	Vorgabe: \
	`-e "ssh" --checksum -rlvzu --delete-excluded --exclude-from=$(RSYNCEXCLUDE)`


Statik Funktion
==================================

Rumex verwendet pandocs markdown weil man damit sehr einfach und schnell
Text erstellen und in verschiedenen Formate wandeln kann. Für die
Erstellung von Denkschriften[^neudeutsch] wurde zusätzlich eine, ich nenne sie
*statik Funktion* eingebaut. Mit dieser Funktion ist es möglich
innerhalb eines Unterverzeichnisses verschiedenen Ausgabe Formate zu
erstellen. Zur Zeit werden, von Rumex, folgenden Formate unterstützt:

[^neudeutsch]: Im Neudeutschen würde man die Denkschrift als Memorandum
    bezeichnen.

-   .html
-   .pdf
-   .odt OpenDokument
-   .epub E-Book
-   .mobi E-Book (Kindle)

Erstellt werden die einzelnen Formate über die innerhalb (g)vim[^funktionstasten] zur
Verfügung stehen.~~Eine Besonderheit ist dass die `.htm` Datei auch ohne
die zusätzlichen Dateien wie~~ ~~Bilder oder die CSS Datei
funktionieren. Alle Daten werden in die `.htm` Datei eingebunden.~~[^ladezeit]\
Auch wurde die von Pandoc eingebaut sodass Verweise auf anderen Quellen
in den Denkschriften verwendet werden können.

[^funktionstasten]: Die Funktionstasten sind im gvim Rumex Menü nicht eingebaut. Man
    sollte sie sich also merken :-).

[^ladezeit]: Diese Eigenschaft wurde wieder entfernt da eine Datei mit sehr
    vielen Bildern oder gar Videos, die alle in die HTML Datei
    eingebunden werden, sehr groß wird. Dieses erhöht die Ladezeit der
    HTM Datei. Bei der Verwaltung durch git wirkt sich diese Eigenschaft
    auch ungünstig aus.

Wer sich Rumex nicht installieren möchte aber dennoch eine einfache
Möglichkeit sucht HTML Seiten zu erstellen, kann sich einmal
[cirsium](http://www.it-bayer.de/cirsium) anschauen. Cirsium ist eine
Auskopplung aus Rumex, unterteilt aber die Quelltextdatei in
verschiedene Abschnitte. Am besten einfach mal auf
[github.com](http://www.github.com/itbayer/cirsium) anschauen.

Ab der Rumex Version 0.8.2 sind die Funktionstasten in Rumex enthalten.
Folgende F-Tasten wurden belegt.

**F5**
:   Erstellt die `.htm` Datei ohne Inhaltsverzeichnis.

**Shift+F5**
:   Erstellt die `.htm` Datei mit Inhaltsverzeichnis bis zur Ebene 3.

**Alt+F5**
:   Erstellt die `.htm` Datei mit kompletten Inhaltsverzeichnis bzw. bis
    Ebene 5 da LaTeX auch nicht mehr Ebenen unterstützt und die beiden
    Ausgabe Format annähernd identisch sein sollten.

**Ctrl+F5**
:   Öffnet die `.htm` Datei.

**F6**
:   Erstellt die `.pdf` Datei ohne Inhaltsverzeichnis.

**Shift+F6**
:   Erstellt die `.pdf` Datei mit Inhaltsverzeichnis bis zur Ebene 3.

**Alt+F6**
:   Erstellt die `.pdf` Datei mit kompletten Inhaltsverzeichnis. Hier
    ist anzumerken dass LaTeX nur Inhaltsverzeichnisse bis zur Ebene 5
    unterstützt. Das HTML Format wurde entsprechend angepasst, siehe
    oben.

**Ctrl+F6**
:   Öffnet die `.pdf` Datei. Zur Zeit wird nur zathura unterstützt.

**F7**
:   Erstellt die restlichen Formate, `.epub`, `.odt` und `.mobi`.
    Voraussetzung für das `.mobi` Format ist `calibre`.

**Ctrl-F7**
:   Öffnet die Literatur Verwaltung `rumex.bib`. Voraussetzung, `jabref`
    ist installiert.

HTML Formatierung
=================

Die erzeugte HTML Datei besitzt Standardmäßig keine Formatierung bzw.
verwendet die Standard Darstellung des Browsers.

Kopf- und Fusszeile werden dadurch nicht, vom restlichen Text,
unterschieden. Auch das Inhaltsverzeichnis ist im ersten Moment als
solches nicht gleich zu erkennen. Dieses kann mit ein wenig CSS geändert
werden. Diese CSS Datei ist ab Rumex Version 0.8.2 enthalten muss aber
unter Umständen noch eingerichtet werden.

    cd .rx
    ln -s ../.rumex/default/statik.css statik.css

Beim Lesen des Artikels *“PDF-Dokumente schreiben mit Pandoc und
Markdown” <span>[</span>@stenderprolinux<span>]</span>* ist mir die Idee
gekommen die Rumex *statik Funktion* mit einem Literaturverzeichnis, die
ja auch in pandoc zur Verfügung steht, zu versehen.

Installation pandoc manuell
===========================

Für die Verwendung der Literaturfunktion muss pandoc um das
Zusatzprogramm `pandoc-citeproc` erweitert werden. Wer Pandoc über die
Paketverwaltung installiert hat braucht hier nichts zu machen. Wer
Pandoc manuell, so wie ich, installiert hat muss dieses Programm
nachinstallieren.

Dazu erweitert man die Installationszeile um das neue Programm

    cabal update
    cabal install pandoc pandoc-citeproc

Zu guter Letzt erstellt man noch die symbolischen Links der beiden
Programme.

    sudo ln -s /home/USER/.cabal/bin/pandoc /usr/local/bin/.
    sudo ln -s /home/USER/.cabal/bin/pandoc-citeproc /usr/local/bin/.

### Nachinstallation Rumex

Wer Rumex schon im Einsatz hat muss für die Erweiterung ein wenig Hand
anlegen. Zu erste holt man sich die neue Version[^literatur] von rumex.

[^literatur]: Die Literatur Erweiterung ist ab der Rumex Version 0.8.2
    enthalten.

Dann braucht man noch drei zusätzliche Dateien im Verzeichnis `.rx`.

-   `rumex.bib`

-   `rumex.csl`

-   `statik.css`

Wobei der und die CSS Datei nur verlinkt wird. In der `rumex.bib` werden
dann die Literatur Verweise verwaltet.

    cd .rx
    touch rumex.bib
    ln -s ../.rumex/default/din-1505-2.csl rumex.csl
    ln -s ../.rumex/default/statik.css statik.css

Als Literatur Stil kommt `din-1505-2.csl` zum Einsatz. Andere Stile
findet man im git Repository
<https://github.com/citation-style-language/styles.git>. Als Name für
die Stil Vorlage wurde `rumex.csl` gewählt damit mit eine Änderung des
Stils einfach über den Symlink gemacht werden kann.

### Literatur Verwaltung

Für die Verwaltung der Literatur Datenbank verwende ich
[Jabref](http://jabref.sourceforge.net/).

    sudo apt-get install jabref

Der Aufruf des Programms wurde auch auf einen F Taste gelegt. Wer eine
anderes Programm verwenden will muss diesen entsprechend anpassen.

### Tipps

-   Auf @wiki:bibtex findet man eine schöne Beschreibung über die
    Literatur Verwaltung mit BibTex.

-   Die BibTex Einträge muss man sich unter Umständen nicht einmal
    selber erstellen. Da verschiedene Seiten entsprechende Dienste
    anbieten. Gelungen finde ich die Seite von
    <http://www.literatur-generator.de/> aber auch auf
    <http://lead.to/amazon/en/?op=bt> findet man BibTeX Einträge. Zwar
    muss man diese unter Umständen noch ein wenig überarbeiten aber das
    Grund Gerüst wird einem sozusagen frei Haus geliefert.\
    Wer einen Wikipedia Artikel zitieren dem wird unter
    `Werkzeuge -> Seite zitieren` weiter geholfen.

-   Für das zitieren von Internetseiten verwende ich folgende Formate,
    siehe dazu Abschnitt .

<!-- -->

        @ELECTRONIC{ wiki:bibtex,
            author = "Wikipedia",
            title = "BibTeX --- Wikipedia{,} Die freie Enzyklopädie",
            year = "2013",
            url = "http://de.wikipedia.org/w/index.php?title=BibTeX&oldid=124228120", 
            note = "[Online; Stand 18. Dezember 2013]"
        }

> …oder
>
> **Achtung:** Das Formate `@WWW` wird von jabref nicht unterstützt und
> gegen ein anders ausgetauscht. Bei dem Einsatz von Jabref am besten
> `@ELECTRONIC` verwenden.

        @WWW{ wiki:bibtex,
            author = "Wikipedia",
            title = "BibTeX --- Wikipedia{,} Die freie Enzyklopädie",
            year = "2013",
            url = "http://de.wikipedia.org/w/index.php?title=BibTeX&oldid=124228120", 
            note = "[Online; Stand 18. Dezember 2013]"
        }

Verwendung in- und außerhalb von Rumex? {#verwendung-in--und-auuxdferhalb-von-rumex}
=======================================

Innerhalb von Rumex erstellt man in einem separatem Unterverzeichnis die
entsprechende markdown Datei und dann kann es auch schon los gehen.

Außerhalb von Rumex kann man diese Funktion natürlich auch verwenden.
Mit Außerhalb meine ich Denkschriften die nicht veröffentlicht werden.
Dazu gibt es zwei Möglichkeiten.

1.  Die Datei bzw. das Verzeichnis in `.gitignore` hinterlegen. Somit
    wird diese nicht verwaltet und auch nicht, bei einem `make online`,
    hoch geladen.

2.  Eine zweite lokale Rumex Installation die nur für Denkschriften
    verwendet wird.

3.  …und dann wäre da noch
    [Cirsium](https://github.com/itbayer/cirsium), eine Auskopplung aus
    Rumex, mit der man einfache html und pdf Seiten erstellen kann. Die
    Literaturverzeichnisoption ist auch enthalten. Die Formate odt, epub
    und mobi sind jedoch nicht eingebaut.

Setzen der Überschrift für das Literaturverzeichnis {#setzen-der-uxfcberschrift-fuxfcr-das-literaturverzeichnis}
---------------------------------------------------

Die Überschrift für das Literaturverzeichnis muss immer am Ende des
Artikels gesetzt werden.

**Beispiel**

    # Literaturverzeichnis

Einbinden von Bildern
---------------------

Bei dem Einbinden der Bilder muss man beachten dass die Erstellung der
statik Datei vom Verzeichnis `.rx` ausgeht.

Will man also ein Bild, dass im Ordner der Statik Datei liegt einbinden
so muss auch auf das Bild aus der Sicht des `.rx` Verzeichnisses
eingebunden werden.

Beispiel:

Das Bild liegt im Ordner `statik` somit müsste der Markdown Befehl so
aussehen.

    ![Beispielbild](../statik/beispiel.png)

In Rumex kann man diese Funktion natürlich auch verwenden. Am besten
erstellt man sich dazu ein eigenes Unterverzeichnis und dort die Datei
`index.md` mit den Texten.

Statik Dateien im `.rx` Verzeichnis
-----------------------------------

Es wird sicher passieren dass man die Funktionstasten der Statik Seiten
auch bei der Bearbeitung der eigentlichen Rumex Dateien drückt. Durch
entsprechende Einträge in der `.gitignore` Datei werden solche Dateien
von einem Upload ausgeschlossen. Mit den Aufruf von `make statikclean`
können die erstellten statik Dateien Schlussendliche aus dem `.rx`
Verzeichnis entfernt werden. Dieser Befehl wird auch bei `make clean`
ausgeführt.

Tipps
-----

Das PDF Programm `zathura` hat die Eigenschaft dass wenn sich die Datei
ändert diese automatisch nachgeladen wird. Eine schöne Funktion wenn man
seinen Text, an dem man gerade arbeitet, immer wieder einmal im Ausgabe
Format betrachten will. Einfach die Taste F6 drücken, die Datei wird
auch gleich gespeichert, und mit ALT-TAB das Programm Fenster wechseln.

Bei Format HTML geht das natürlich auch. Nur muss hier eine Erweiterung
installiert werden. Für die Browser Chromium und Firefox habe ich mit
`Auto Refresh Plus`$^{Chromium}$ bzw. `Tab Auto Reload`$^{FireFox}$ gute
Erfahrungen gemacht.

* * * * *

Die PDF Datei dieser Beschreibung kann man sich [hier](index.pdf)
ansehen. Die Markdown Quelldatei kann man sich [hier](index.md) holen.

* * * * *




