# it-bayers tex4ht Vorlage
#

info:
	@echo
	@echo "Folgende Befehle stehen zur Verfügung"
	@echo
	@echo "make pdf"
	@echo "make dvi"
	@echo "make html"
	@echo "make clean"
	@echo "make clean_pdf"
	@echo "make clean_ps"
	@echo "make clean_html"
	@echo "make clean_all"
	@echo "make eps"
	@echo "make online"
	@echo


# PDF Datei erstellen
pdf:
	make -s clean
	pdflatex rumex.tex
	pdflatex rumex.tex
	pdflatex rumex.tex
	make -s clean


dvi:
	make -s clean
	latex rumex.tex
	latex rumex.tex
	latex rumex.tex
	make -s clean


# HTML Dateien erstellen
html:
	make -s clean
	make -s eps
	htlatex rumex "html,info"
	#htlatex tex4ht_itb "html,info,2,fn-in"
	# mit der next Erweiterung wird auf der Startseite
	# auch ein Link "Nächsten Seite" eingeblendet
	# htlatex tex4ht_itb "html,info,2,fn-in,next"
	make -s clean


clean:
	rm -f *.aux
	rm -f *.out 
	rm -f *.lg
	rm -f *.tmp
	rm -f *.toc
	rm -f *.xref
	rm -f *.idv 
	rm -f *.log
	rm -f *.synctex.gz 
	rm -f *.4*

clean_pdf:
	rm -f *.pdf

clean_ps:
	rm -f *.ps

clean_html:
	rm -f *.html
	rm -f *.css

clean_dvi:
	rm -f *.dvi 

clean_all:
	make -s clean
	make -s clean_pdf
	make -s clean_ps
	make -s clean_dvi
	make -s clean_html


# Alle Ausgabeformate erstellen
all:
	make -s clean_all
#	make -s dvi
#	make -s clean
	make -s html
	make -s clean
	make -s pdf
	make -s clean


# Alle Dateien erstellen und Online bringen
online:
	make -s all
	make -s tar
	make -C ../.rx/ online

# Grafiken umwandeln

# Testen ob die eps Variante der Datei schon vorhanden ist.
JPG = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}.eps; done)
PNG = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}.eps; done)


eps: $(JPG) $(PNG)

%.eps: %.jpg
	convert $< $@

%.eps: %.png
	convert $< $@
