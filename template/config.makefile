#
# template/config.makefile
#


# Überschriften für die Index Seite
U1="Der(Ein) HomePage Sand(Bau)kasten" 
U2="IT Bayer's rumex"
U3=""

# Programm zum erstellen der index.md
INDEX="bin/make_index.pl"


# META
META_ROBOTS_STANDARD = "all"
META_ROBOTS_VERSTECKT = "noindex,nofollow,noarchive"
META_ROBOTS_WEITERLEITUNG = "noindex,follow,noarchive"


# Programm zum erstellen des RSS Feed
MD2RSS = "bin/md2rss.pl"

# RSS Feed
RSS_TITLE = "Neues vom rumex Baukasten"
RSS_FILE = "rss.xml"


# Sitemap
# Programm zum erstellen der Sitemap Datei
MDSITEMAP = "bin/make_sitemap.pl"


# Zieldatei der Sitemap Datei
SITEMAP_FILE = "sitemap.xml"


# Verzeichnis in dem sich die Bilder befinden.
BVZ="bilder"

PANDOC = pandoc

HTML_TEMPLATE = template/html.template
KOPF_TEMPLATE = template/kopf.html
HEADER_TEMPLATE = template/header.html
FUSS_TEMPLATE = template/fuss.html 



