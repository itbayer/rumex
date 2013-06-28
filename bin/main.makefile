# 
# bin/main.makefile
#

# ######################################################
META_GENERATOR = "pandoc rumex 0.4.0"


# ######################################################
DEV = Makefile ../template/all.css ../template/screen.css ../template/print.css ../template/header.html ../template/kopf.html ../template/fuss.html ../template/html.template ../template/config.makefile ../bin/main.makefile ../bin/bilder.makefile ../bin/pandoc_html.makefile ../bin/pandoc_pdf.makefile


# ######################################################
html: html0s html0x html0v html1s html1x html1v html2s html2x html2v html3s html3x html3v html4s html4x html4v html5s html5x html5v html6s html6x html6v html0w


# ######################################################
index: 
	$(INDEX) $(U1) $(U2) $(U3)


# ######################################################
# Schritte werden hier einzeln aufgerufen
# somit kann sicher gestellt werden dass
# zuerst die index.md0x erstellt und dann
# daraus die html Datei gemacht wird.
#
# Bei der Schreibweise
#
# 	all: index html
#
# war die Reihenfolge nicht eindeutig
#
all: 
	make -s index 
	make -s sitemap
	make -s rss
	make html 
	make -s bilder


# ######################################################
online:
	make all
	git add .
	git commit -a -m"...."
	git push


# #######################################################
rss:
	$(MD2RSS) > $(RSS_FILE)



# #######################################################
sitemap:
	make -s sitemapmd
	make -s sitemapxml


# #######################################################
sitemapxml:
	$(SITEMAP_XML) > $(SITEMAP_XML_FILE)


# #######################################################
sitemapmd:
	$(SITEMAP_MD) > $(SITEMAP_MD_FILE)

