#
# inc/config.makefile
#

# Programm zum erstellen der index.md
INDEX="bin/make_index.pl"

PANDOC = pandoc
HTML_TEMPLATE = inc/html.template
KOPF_TEMPLATE = inc/kopf.html
HEADER_TEMPLATE = inc/header.html
FUSS_TEMPLATE = inc/fuss.html 

DEV = Makefile inc/all.css inc/screen.css inc/print.css inc/header.html inc/kopf.html inc/fuss.html inc/html.template inc/config.makefile inc/main.makefile inc/ueberschrift.makefile inc/bilder.makefile inc/pandoc_html.makefile inc/pandoc_pdf.makefile


