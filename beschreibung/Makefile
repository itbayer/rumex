JPG = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}.eps; done)
PNG = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}.eps; done)

pdf:
	pdflatex rumex.tex
	pdflatex rumex.tex
	pdflatex rumex.tex

html:
	htlatex rumex "xhtml,info,2,fn-in"
	# mit der next Erweiterung wird auf der Startseite
	# auch ein Link "Nächsten Seite" eingeblendet
	# htlatex tex4ht_itb "html,info,2,fn-in,next"


clean:
	rm -f *.aux
	rm -f *.dvi 
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

clean_all:
	make -s clean
	make -s clean_pdf
	make -s clean_ps
	make -s clean_html

online:
	make -C ../.rx/ online

eps: $(JPG) $(PNG)

%.eps: %.jpg
	convert $< $@

%.eps: %.png
	convert $< $@
