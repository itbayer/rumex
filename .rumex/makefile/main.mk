# ##############################################
# main.makefile
# ##############################################



# ######################################################
# alle HTML Dateien zusammen
html: html0s html0x html0v html0w html1s html1x html1v html2s html2x html2v html3s html3x html3v html4s html4x html4v html5s html5x html5v html6s html6x html6v 


# ######################################################
# index.rx0x Seite erstellen

index:
	$(INDEX) $(INDEX_TITEL) $(INDEX_AUTOR) $(INDEX_DATUM)
	make -s html


# ######################################################
# alle Schritte der Seiten Erstellung zusammen
all: 
	make -s index 
	make -s suche
	make -s sitemap
	make -s rss
	make -s html 
	make -s bilder
	make -s robots




# ######################################################
# Seite online stellen. Wenn die SITECOPY Variable in config.mk
# gesetzt ist wird sitecopy verwenden, sonst git.
online:
	make -s all
	git add ../.
	git commit -a -m"...."
ifdef SITECOPY
	$(SITECOPY) -r ../.rumex/sitecopy/config -p ../.rumex/sitecopy/cache/ --update rumex
else
	git push
endif




# #######################################################
# RSS Datei erstellen

../rss.xml: rss.rx0x
	$(RX2RSS) $(URL)+rss > ../rss.xml

rss: 
ifdef RSS_EXTERN
	@echo "INFO: RSS ist ausgelagert, $(RSS_EXTERN)"
else
	make -s ../rss.xml
endif




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
	make -s html


# #######################################################
# alle clean's auf einmal
clean:
	make -s hclean
	make -s xclean
	make -s bclean
	make -s statikclean


# #######################################################
# HTML Dateien aus dem root Verzeichnis löschen
hclean:
	rm -f ../*.html


# #######################################################
# XML aus dem root Verzeichnis löschen
xclean:
	rm -f ../*.xml


# #######################################################
# Bild Verzeichnis bereinigen
bclean: 
	rm -f ../bilder/*_???_.*

# #######################################################
# .htm Dateien die per F5, F6 oder F7 erstellt wurde aus dem .rx 
# 	Verzeichnis löschen. 
# 	Siehe dazu http://it-bayer.de/rumex/statik/.
statikclean: 
	rm -f *.htm
	rm -f *.pdf
	rm -f *.epub
	rm -f *.odt
	rm -f *.mobi

# #######################################################
# rumex Installieren
install:
	../.rumex/bin/install.sh

# #######################################################
# rumex Updaten
update:
	../.rumex/bin/update.sh

# #######################################################
# index.html im Standard Browser öffnen
show:
	x-www-browser ../index.html 2>/dev/null

# ######################################################
# Online Seite öffnen
showwww:
	x-www-browser $(URL) 2>/dev/null

# ######################################################
# localhost öffnen
showlocal:
	x-www-browser localhost 2>/dev/null


# ######################################################
# Konfigurationsdatei für die JavaScript Suche erstellen
suche:
	$(SUCHE) > $(SUCHE_JS_CONFIG)

# ######################################################
# robots.txt updaten
robots: 
	../.rumex/bin/robots.txt_update.pl


