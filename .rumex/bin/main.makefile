# ##############################################
# main.makefile
# ##############################################



# ######################################################
# alle HTML Dateien zusammen
html: html0s html0x html0v html0w html1s html1x html1v html2s html2x html2v html3s html3x html3v html4s html4x html4v html5s html5x html5v html6s html6x html6v 


# ######################################################
# index.rx0x Seite erstellen
index: 
	$(INDEX) $(U1) $(U2) $(U3)


# ######################################################
# alle Schritte der Seiten Erstellung zusammen
all: 
	make -s index 
	make -s suche
	make -s sitemap
	make -s rss
	make -s html 
	make -s bilder
	make -s ../robots.txt


# ######################################################
# Seite online stellen. Wenn die FTP Variable in config.makefile
# gesetzt ist wput.sh verwenden, sonst mit git.
online:
	make -s all
ifdef FTP
	../.rumex/bin/wput.sh $(FTP)
else
	git add ../.
	git commit -a -m"...."
	git push
endif


# #######################################################
# RSS Datei erstellen

../rss.xml: rss.rx0x
	$(RX2RSS) $(URL)/$(RSS_FILE) > ../$(RSS_FILE)

rss: 
	make -s ../rss.xml


# #######################################################
# alle XML und rs sitemap zusammen
sitemap:
	make -s sitemaprx
	make -s sitemapxml


# #######################################################
# Sitemap XML Datei erstellen
sitemapxml:
	$(SITEMAP_XML) $(URL) > $(SITEMAP_XML_FILE)


# #######################################################
# Sitemap rx?? Datei erstellen. Die eigentliche rss.html
# wird dann durch make html erstellt.
sitemaprx:
	$(SITEMAP_RX) $(URL) > $(SITEMAP_RX_FILE)


# #######################################################
# alle clean's auf einmal
clean:
	make -s hclean
	make -s xclean
	make -s bclean


# #######################################################
# HTML Dateien aus dem root Verzeichnis löschen
hclean:
	rm ../*.html


# #######################################################
# XML aus dem root Verzeichnis löschen
xclean:
	rm ../*.xml


# #######################################################
# Bild Verzeichnis bereinigen
bclean: 
	rm ../bilder/*_???_.*


# #######################################################
# rumex Verzeichnis löschen und Vorlage kopieren
install:
	../.rumex/bin/install.sh

# #######################################################
# index.html im Standard Browser öffnen
show:
	x-www-browser ../index.html &

# ######################################################
# Online Seite öffnen
showwww:
	x-www-browser $(URL) &

# ######################################################
# localhost öffnen
showlocal:
	x-www-browser localhost &


# ######################################################
# Konfigurationsdatei für die JavaScript Suche erstellen
suche:
	$(SUCHE) > $(SUCHE_JS_CONFIG)

# ######################################################
# robots.txt updaten
../../robots.txt: ../.rumex/user/config.makefile
	../.rumex/bin/update_robots.txt.pl

robots.txt:
	make  ../../robots.txt
