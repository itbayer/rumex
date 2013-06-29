# #############################################
# config.makefile
# #############################################

# ##############################################################
# Überschriften für die Index Seite
U1="Der(Ein) HomePage Sand(Bau)kasten" 
U2="IT Bayer's rumex"
U3=""


# ##############################################################
#
HTML_TEMPLATE = ../template/html.template
KOPF_TEMPLATE = ../template/kopf.html
HEADER_TEMPLATE = ../template/header.html
FUSS_TEMPLATE = ../template/fuss.html 


# ##############################################################
# META Angabe der unterschiedlichen Seitentypen
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"


# ##############################################################
# Programm zum erstellen der index.rx0x
INDEX="../bin/index.pl"


# ##############################################################
# Programm zum erstellen des RSS Feed
RX2RSS = "../bin/rx2rss.pl"


# ##############################################################
# RSS Feed
RSS_FILE = "../rss.xml"


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

