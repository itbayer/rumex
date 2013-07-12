# #############################################
# sys.config.makefile
#
#
# Diese Variable müssen für den Standard Betrieb nicht geändert werden.
#
# ##############################################################




# ##############################################################
# META Angabe der unterschiedlichen Seitentypen
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"


# ##############################################################
# Programm zum erstellen der index.rx0x
INDEX="../.bin/index.pl"


# ##############################################################
# RSS Feed 

# Name der RSS Feed Datei
RSS_FILE = "rss.xml"

# Programm zum erstellen des RSS Feed
RX2RSS = "../.bin/rx2rss.pl"


# ##############################################################
# XML Sitemap

# Programm zum erstellen der XML Sitemap Datei
SITEMAP_XML = "../.bin/sitemap_xml.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "../sitemap.xml"

# Programm zum erstellen der rx0v Sitemap Datei
SITEMAP_RX = "../.bin/sitemap_rx.pl"

# Zieldatei der HTML Sitemap Datei
SITEMAP_RX_FILE = "sitemap.rx0v"


# ##############################################################
# Verzeichnis in dem sich die Bilder befinden.
BVZ="../bilder"


# ##############################################################
# Pandoc Programm
PANDOC = pandoc
# PANDOC = /usr/bin/pandoc


# ##############################################################
# Rumex Suche

# Programm zum erstellen der rumexsuche_config.js
SUCHE = "../.bin/suche.pl"

# Ziel Datei für die JavaScript Suche
SUCHE_JS_CONFIG="../css/rumexsuche_config.js"
