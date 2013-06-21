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


# XML Sitemap
# Programm zum erstellen der XML Sitemap Datei
MD_SITEMAP_XML = "bin/make_sitemap_xml.pl"


# Zieldatei der Sitemap Datei
SITEMAP_XML_FILE = "sitemap.xml"

# HTML Sitemap
# Programm zum erstellen der HTML Sitemap Datei
MD_SITEMAP_HTML = "bin/make_sitemap_html.pl"


# Zieldatei der HTML Sitemap Datei
SITEMAP_HTML_FILE = "markdown/sitemap.md0v"

# Verzeichnis in dem sich die Bilder befinden.
BVZ="bilder"

PANDOC = pandoc

HTML_TEMPLATE = template/html.template
KOPF_TEMPLATE = template/kopf.html
HEADER_TEMPLATE = template/header.html
FUSS_TEMPLATE = template/fuss.html 



