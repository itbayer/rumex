#
# inc/config.makefile
#

# Programm zum erstellen der index.md
INDEX="bin/make_index.pl"

# Programm zum erstellen des RSS Feed
MD2RSS = "bin/md2rss.pl"

# Zieldatei des RSS Feed
RSS_XML = "rss.xml"

# Programm zum erstellen der Sitemap Datei
MDSITEMAP = "bin/make_sitemap.pl"

# Zieldatei der Sitemap Datei
SITEMAP_XML = "sitemap.xml"

# Verzeichnis in dem sich die Bilder befinden.
BVZ="bilder"

PANDOC = pandoc
RUMEX = "pandoc rumex 0.3.5"
HTML_TEMPLATE = template/html.template
KOPF_TEMPLATE = template/kopf.html
HEADER_TEMPLATE = template/header.html
FUSS_TEMPLATE = template/fuss.html 

DEV = Makefile template/all.css template/screen.css template/print.css template/header.html template/kopf.html template/fuss.html template/html.template inc/config.makefile inc/main.makefile template/index.makefile inc/bilder.makefile inc/pandoc_html.makefile inc/pandoc_pdf.makefile


