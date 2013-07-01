# #############################################
# config.makefile
# #############################################

# #############################################
# SEITEN EINSTELLUNG :: Bitte anpassen
# #############################################

# URL der Seite
URL="http://www.it-bayer.de/rumex"

# Überschriften für die Index Seite
U1="Der(Ein) HomePage Sand(Bau)kasten" 
U2="IT Bayer's rumex"
U3="github.com Version"

# RSS Überschrift
RSS_TITEL = "Neuigkeiten von rumex Baukasten"

# ##############################################################
# FTP URL / Zugangsdaten. Ist diese Variabel gesetzt wird das 
# Programm wput bzw. bin/wput.sh verwendet um die Daten auf
# den Server zu laden. Wenn die Variabel kommentiert ist (Standard)
# wird git verwendet.
# FTP = "ftp://USER:PASS@SERVER:PORT/WWW_DIR/"







# ##############################################################
# ##############################################################
#
# SYSTEM VARIABEL
#
# Diese müssen für den Standard Betrieb nicht geändert werden.
#
# ##############################################################
# ##############################################################


# ##############################################################
# HTML Template 
HTML_TEMPLATE = ../inc/html.template
KOPF_TEMPLATE = ../inc/kopf.html
HEADER_TEMPLATE = ../inc/header.html
FUSS_TEMPLATE = ../inc/fuss.html 


# ##############################################################
# META Angabe der unterschiedlichen Seitentypen
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"


# ##############################################################
# Programm zum erstellen der index.rx0x
INDEX="../bin/index.pl"


# ##############################################################
# RSS Feed 

# Name der RSS Feed Datei
RSS_FILE = "rss.xml"

# Programm zum erstellen des RSS Feed
RX2RSS = "../bin/rx2rss.pl"


# ##############################################################
# XML Sitemap

# Programm zum erstellen der XML Sitemap Datei
SITEMAP_XML = "../bin/sitemap_xml.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "../sitemap.xml"

# Programm zum erstellen der rx0v Sitemap Datei
SITEMAP_RX = "../bin/sitemap_rx.pl"

# Zieldatei der HTML Sitemap Datei
SITEMAP_RX_FILE = "sitemap.rx0v"


# ##############################################################
# Verzeichnis in dem sich die Bilder befinden.
BVZ="../bilder"


# ##############################################################
# Pandoc Programm
PANDOC = pandoc
# PANDOC = /usr/bin/pandoc


