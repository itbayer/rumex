# 
# .bin/config.makefile
#
# -----------------------------------------------------

# =====================================================
#
# Hier findest du die Variable die man evtl. anpassen muss.
#
# Am besten kopierst du die Variablen, die du änderst
# in die Datei ./inc/user/config.makefile.
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

# Bild für das Seitenbanner
SEITENBANNER = "css/rumex.png"

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
# Ist im .inc/user Verzeichnis eine entsprechende Datei vorhanden
# wird diese verwendet.
# Wenn nicht wird die Datei aus .inc/default verwendet.
#
HTML_TEMPLATE = $(shell if [ -f ../.inc/user/html.template ];then echo \"../.inc/user/html.template\";else echo \"../.inc/default/html.template\";fi)
KOPF_TEMPLATE = $(shell if [ -f ../.inc/user/kopf.html ];then echo \"../.inc/user/kopf.html\";else echo \"../.inc/default/kopf.html\";fi)
HEADER_TEMPLATE = $(shell if [ -f ../.inc/user/header.html ];then echo \"../.inc/user/header.html\";else echo \"../.inc/default/header.html\";fi)
FUSS_TEMPLATE = $(shell if [ -f ../.inc/user/fuss.html ];then echo \"../.inc/user/fuss.html\";else echo \"../.inc/default/fuss.html\";fi)

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
INDEX="../.bin/index.pl"


# #####################################################
# RSS Feed 

# Name der RSS Feed Datei
RSS_FILE = "rss.xml"

# Programm zum erstellen des RSS Feed
RX2RSS = "../.bin/rx2rss.pl"


# #####################################################
# XML Sitemap

# Programm zum erstellen der XML Sitemap Datei
SITEMAP_XML = "../.bin/sitemap_xml.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "../sitemap.xml"

# Programm zum erstellen der rx0v Sitemap Datei
SITEMAP_RX = "../.bin/sitemap_rx.pl"

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
SUCHE = "../.bin/suche.pl"

# Ziel Datei für die JavaScript Suche
SUCHE_JS_CONFIG="../css/rumexsuche_config.js"

# #####################################################
# Rumex Versionshinweis für die HTML Dateien
META_GENERATOR = "rumex 0.7.0"
