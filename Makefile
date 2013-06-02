# --------------------------------------------------------
# pandoc 2 html
# --------------------------------------------------------

# Programm zum erstellen der index.md
INDEX="bin/make_index.pl"
# Überschriften für die Index Seite
U1="Ein github HomePage Sand(Bau)kasten" 
U2="IT Bayer"
U3="2013,"


PANDOC = pandoc
HTML_TEMPLATE = inc/html.template

HTML_FILES =  $(shell for i in $(shell ls -1 markdown/*.md) ;do x=$${i\#*/}; echo $${x%.*}.html; done)
PDF_FILES =  $(shell for i in $(shell ls -1 markdown/*.md) ;do x=$${i\#*/};  echo $${x%.*}.pdf; done)


# ###################################################
#
# --self-contained \

html: $(HTML_FILES) 

%.html: markdown/%.md Makefile inc/all.css
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B inc/kopf.html \
		-H inc/header.html \
		-A inc/fuss.html \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@



# ######################################################

pdf: $(PDF_FILES)

%.pdf: %.md Makefile
	$(PANDOC) -f markdown -t latex -s \
		-V lang=ngermanb \
		$< -o $@



# ######################################################

index: 
	 $(INDEX) $(U1) $(U2) $(U3)



# ######################################################

all: html pdf



# ######################################################

online:
	git add .
	git commit -a -m"...."
	git push
