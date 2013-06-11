# 
# inc/main.makefile
#

html: html0s html0x html0v html1s html1x html1v html2s html2x html2v html3s html3x html3v html4s html4x html4v html5s html5x html5v html6s html6x html6v

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
	make index 
	make html 
	make rss
	make sitemap


# ######################################################

online:
	make all
	git add .
	git commit -a -m"...."
	git push

# #######################################################

rss:
	$(MD2RSS) > $(RSS_XML)


# #######################################################
sitemap:
	$(MDSITEMAP) > $(SITEMAP_XML)

