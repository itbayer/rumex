# -----------------------------------------------------
# .rumex/makefile/config.mk
# -----------------------------------------------------

#-------------------------------------------------------------------------------
#
# Hier findest du die Grund Einstellung
# des Rumex Baukastens.
#
# Wenn du Variablen anpassen willst kopiere die 
# entsprechende Zeile nach .rx/config.mk
# und passe diese an.
#
# Eine Vorlage mit den Variablen die angepasst 
# werden müssen befindet sich bereits im Verzeichnis
# .rx/.
#
#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
# URL der Seite : ohne abschließenden /
#-------------------------------------------------------------------------------
URL="http://www.it-bayer.de/rumex"




#-------------------------------------------------------------------------------
# Überschriften für die Index Seite
#-------------------------------------------------------------------------------
U1="IT Bayer's rumex"
U2="Der(Ein) HomePage Sand(Bau)kasten" 
U3="github.com Version"




#-------------------------------------------------------------------------------
# RSS Überschrift (HTML)
#-------------------------------------------------------------------------------
RSS_TITEL = "Neuigkeiten von rumex Baukasten"




#-------------------------------------------------------------------------------
# CSS, Template des Baukastens
#-------------------------------------------------------------------------------
CSSALL = "rxtpl/css/all.css"
CSSSCREEN = "rxtpl/css/screen.css"
CSSPRINT = "rxtpl/css/print.css"




#-------------------------------------------------------------------------------
# Bild für das Seitenbanner
#-------------------------------------------------------------------------------
SEITENBANNER = "rxtpl/img/rumex.png"




#-------------------------------------------------------------------------------
# Schalter ob das externe Tool von moot.it eingebunden werden soll
# Man sollte hier den Kontonamen angeben..
# Wird moot.it nicht verwendet, den Parameter kommentieren. 
#-------------------------------------------------------------------------------
MOOTIT = "rumex"




#-------------------------------------------------------------------------------
#  Autor für den Weblog Eintrag
#-------------------------------------------------------------------------------
WEBLOGAUTOR = "IT-Bayer"




#-------------------------------------------------------------------------------
# Rumexsuche, Verzeichnis für die JavaScript Suchfunktion
#-------------------------------------------------------------------------------
RUMEXSUCHE = "rxtpl/js"




#-------------------------------------------------------------------------------
# Favicon
#-------------------------------------------------------------------------------
FAVICON = "favicon.gif"




#-------------------------------------------------------------------------------
# FTP Upload Funktion mit sitecopy
#
#SITECOPY = /usr/bin/sitecopy
#-------------------------------------------------------------------------------




#==============================================================================
#  Die Variabel ab hier brauchst du nicht unbedingt anpassen.
#==============================================================================


#-------------------------------------------------------------------------------
# Auswahl der Pandoc Vorlagen zur Seiten Erstellung
#
# ...ist im .rx/ Verzeichnis eine entsprechende Datei vorhanden
# wird diese verwendet.
# Ansonst wird die Datei aus dem Verzeichnis 
# .rumex/default verwendet.
#-------------------------------------------------------------------------------
#
HTML_TEMPLATE = $(shell if [ -f ../.rx/html.template ];then echo \"../.rx/html.template\";else echo \"../.rumex/default/html.template\";fi)
KOPF_TEMPLATE = $(shell if [ -f ../.rx/kopf.html ];then echo \"../.rx/kopf.html\";else echo \"../.rumex/default/kopf.html\";fi)
HEADER_TEMPLATE = $(shell if [ -f ../.rx/header.html ];then echo \"../.rx/header.html\";else echo \"../.rumex/default/header.html\";fi)
FUSS_TEMPLATE = $(shell if [ -f ../.rx/fuss.html ];then echo \"../.rx/fuss.html\";else echo \"../.rumex/default/fuss.html\";fi)



#-------------------------------------------------------------------------------
# META Angabe der unterschiedlichen Seitentypen
# rx?s, rx?v, rx?w
#-------------------------------------------------------------------------------
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"




#-------------------------------------------------------------------------------
# Programm zum erstellen der index.rx0x
#-------------------------------------------------------------------------------
INDEX="../.rumex/bin/index.pl"




#-------------------------------------------------------------------------------
# RSS Feed 
#-------------------------------------------------------------------------------
#
# Name der RSS Feed Datei
RSS_FILE_NAME = "rss_2"
# Endung der Eingabe Datei
RSS_RX = "rx0x"
# Endung der Ausgabe Datei
RSS_XML = "xml"

# Externe RSS URL verwenden
# 	Ist diese Variable gesetzt wird die interne
# 	RSS Verarbeitung, RSS_FILE, übersprungen.
# 	und die externe URL verwendet.
#RSS_EXTERN = "http://www.it-bayer.de/rss.xml"

# Programm zum erstellen des RSS Feed
RX2RSS = "../.rumex/bin/rx2rss.pl"




#-------------------------------------------------------------------------------
# XML Sitemap
#-------------------------------------------------------------------------------
#
# Programm zum erstellen der XML Sitemap Datei
SITEMAP_XML = "../.rumex/bin/sitemap_xml.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "../sitemap.xml"

# Programm zum erstellen der rx0v Sitemap Datei
SITEMAP_RX = "../.rumex/bin/sitemap_rx.pl"

# Zieldatei der HTML Sitemap Datei
SITEMAP_RX_FILE = "sitemap.rx0v"




#-------------------------------------------------------------------------------
# Verzeichnis in dem sich die Bilder befinden.
#-------------------------------------------------------------------------------
BVZ="../bilder"




#-------------------------------------------------------------------------------
# Pandoc Programm
#-------------------------------------------------------------------------------
PANDOC = pandoc
# PANDOC = /usr/bin/pandoc




#-------------------------------------------------------------------------------
# Rumex Suche
#
# Programm zum Erstellen der rumexsuche_config.js
#-------------------------------------------------------------------------------
SUCHE = "../.rumex/bin/suche.pl"

#-------------------------------------------------------------------------------
# Ziel Datei für die JavaScript Suche
#-------------------------------------------------------------------------------
SUCHE_JS_CONFIG="../$(RUMEXSUCHE)/rumexsuche_config.js"




#-------------------------------------------------------------------------------
# Rumex Versionshinweis für die HTML Dateien
#-------------------------------------------------------------------------------
META_GENERATOR = "rumex "$(shell cat ../.rumex/default/version.txt)

