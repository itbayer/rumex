# 
# .bin/config.makefile
#
# -----------------------------------------------------

# =====================================================
#
# Hier findest du die Variable die man evtl. anpassen muss.
#
# Am besten kopierst du die Variablen, die du änderst
# in die Datei ./rumex/user/config.makefile.
#
# Diese Datei wird bei einem Update nicht überschrieben.
#
#

# URL der Seite : ohne abschließenden /
URL="http://www.it-bayer.de/rumex"

# Überschriften für die Index Seite
U1="IT Bayer's rumex"
U2="Der(Ein) HomePage Sand(Bau)kasten" 
U3="github.com Version"

# RSS Überschrift
RSS_TITEL = "Neuigkeiten von rumex Baukasten"

# CSS
CSSALL = "rxtpl/css/all.css"
CSSSCREEN = "rxtpl/css/screen.css"
CSSPRINT = "rxtpl/css/print.css"

# Bild für das Seitenbanner
SEITENBANNER = "rxtpl/img/rumex.png"

# Schalter ob das externe Tool von moot.it eingebunden werden soll
# ... wenn nicht den Parameter kommentieren. 
MOOTIT = "ein"

# Rumexsuche
RUMEXSUCHE = "rxtpl/js"

# #####################################################
# FTP URL / Zugangsdaten. Ist diese Variabel gesetzt wird das 
# Programm wput bzw. bin/wput.sh verwendet um die Daten auf
# den Server zu laden. Wenn die Variabel kommentiert ist (Standard)
# wird git verwendet.
#
# FTP = "ftp://USER:PASS@SERVER:PORT/WWW_DIR/"


# =====================================================
#  Die Variabel ab hier brauchst du nicht unbedingt anpassen.
# =====================================================


# #####################################################
# Auswahl der Pandoc Vorlagen / Setzen der Variable
#
# Ist im .rumex/user Verzeichnis eine entsprechende Datei vorhanden
# wird diese verwendet.
# Wenn nicht wird die Datei aus .rumex/default verwendet.
#
HTML_TEMPLATE = $(shell if [ -f ../.rx/html.template ];then echo \"../.rx/html.template\";else echo \"../.rumex/default/html.template\";fi)
KOPF_TEMPLATE = $(shell if [ -f ../.rx/kopf.html ];then echo \"../.rx/kopf.html\";else echo \"../.rumex/default/kopf.html\";fi)
HEADER_TEMPLATE = $(shell if [ -f ../.rx/header.html ];then echo \"../.rx/header.html\";else echo \"../.rumex/default/header.html\";fi)
FUSS_TEMPLATE = $(shell if [ -f ../.rx/fuss.html ];then echo \"../.rx/fuss.html\";else echo \"../.rumex/default/fuss.html\";fi)

# DEV Eintrag
#vorlagetest:
#	echo $(HTML_TEMPLATE)
#	echo $(KOPF_TEMPLATE)
#	echo $(HEADER_TEMPLATE)
#	echo $(FUSS_TEMPLATE)


# #####################################################
# META Angabe der unterschiedlichen Seitentypen
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"


# #####################################################
# Programm zum erstellen der index.rx0x
INDEX="../.rumex/bin/index.pl"


# #####################################################
# RSS Feed 

# Name der RSS Feed Datei
RSS_FILE = "rss.xml"

# Programm zum erstellen des RSS Feed
RX2RSS = "../.rumex/bin/rx2rss.pl"


# #####################################################
# XML Sitemap

# Programm zum erstellen der XML Sitemap Datei
SITEMAP_XML = "../.rumex/bin/sitemap_xml.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "../sitemap.xml"

# Programm zum erstellen der rx0v Sitemap Datei
SITEMAP_RX = "../.rumex/bin/sitemap_rx.pl"

# Zieldatei der HTML Sitemap Datei
SITEMAP_RX_FILE = "sitemap.rx0v"


# #####################################################
# Verzeichnis in dem sich die Bilder befinden.
BVZ="../bilder"


# #####################################################
# Pandoc Programm
PANDOC = pandoc
# PANDOC = /usr/bin/pandoc


# #####################################################
# Rumex Suche

# Programm zum erstellen der rumexsuche_config.js
SUCHE = "../.rumex/bin/suche.pl"

# Ziel Datei für die JavaScript Suche
SUCHE_JS_CONFIG="../rxtpl/js/rumexsuche_config.js"

# #####################################################
# Rumex Versionshinweis für die HTML Dateien
META_GENERATOR = "rumex "$(shell cat ../.rumex/default/version.txt)
