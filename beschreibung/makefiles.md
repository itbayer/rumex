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


