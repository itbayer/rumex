# 
# inc/pandoc_html.makefile
#


# -------------------------------------------------------------------
# HTML Datei ohne Inhaltsverzeichnis
#

HTML0S =  $(shell for i in $(shell ls -1 markdown/*.md0s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html0s: $(HTML0S) 

%.html: markdown/%.md0s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@

HTML0X =  $(shell for i in $(shell ls -1 markdown/*.md0x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html0x: $(HTML0X) 

%.html: markdown/%.md0x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML0V =  $(shell for i in $(shell ls -1 markdown/*.md0v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html0v: $(HTML0V) 

%.html: markdown/%.md0v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 1
#
HTML1S =  $(shell for i in $(shell ls -1 markdown/*.md1s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html1s: $(HTML1S) 

%.html: markdown/%.md1s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML1X =  $(shell for i in $(shell ls -1 markdown/*.md1x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html1x: $(HTML1X) 

%.html: markdown/%.md1x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML1V =  $(shell for i in $(shell ls -1 markdown/*.md1v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html1v: $(HTML1V) 

%.html: markdown/%.md1v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 2
#
HTML2S =  $(shell for i in $(shell ls -1 markdown/*.md2s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html2s: $(HTML2S) 

%.html: markdown/%.md2s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML2X =  $(shell for i in $(shell ls -1 markdown/*.md2x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html2x: $(HTML2X) 

%.html: markdown/%.md2x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML2V =  $(shell for i in $(shell ls -1 markdown/*.md2v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html2v: $(HTML2V) 

%.html: markdown/%.md2v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@



# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 3
#
HTML3S =  $(shell for i in $(shell ls -1 markdown/*.md3s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html3s: $(HTML3S) 

%.html: markdown/%.md3s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML3X =  $(shell for i in $(shell ls -1 markdown/*.md3x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html3x: $(HTML3X) 

%.html: markdown/%.md3x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML3V =  $(shell for i in $(shell ls -1 markdown/*.md3v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html3v: $(HTML3V) 

%.html: markdown/%.md3v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 4
#
HTML4S =  $(shell for i in $(shell ls -1 markdown/*.md4s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html4s: $(HTML4S) 

%.html: markdown/%.md4s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML4X =  $(shell for i in $(shell ls -1 markdown/*.md4x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html4x: $(HTML4X) 

%.html: markdown/%.md4x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML4V =  $(shell for i in $(shell ls -1 markdown/*.md4v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html4v: $(HTML4V) 

%.html: markdown/%.md4v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 5
#
HTML5S =  $(shell for i in $(shell ls -1 markdown/*.md5s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html5s: $(HTML5S) 

%.html: markdown/%.md5s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML5X =  $(shell for i in $(shell ls -1 markdown/*.md5x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html5x: $(HTML5X) 

%.html: markdown/%.md5x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML5V =  $(shell for i in $(shell ls -1 markdown/*.md5v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html5v: $(HTML5V) 

%.html: markdown/%.md5v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 6
#
HTML6S =  $(shell for i in $(shell ls -1 markdown/*.md6s 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html6s: $(HTML6S) 

%.html: markdown/%.md6s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML6X =  $(shell for i in $(shell ls -1 markdown/*.md6x 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html6x: $(HTML6X) 

%.html: markdown/%.md6x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


HTML6V =  $(shell for i in $(shell ls -1 markdown/*.md6v 2>/dev/null) ;do x=$${i\#*/}; echo $${x%.*}.html; done)

html6v: $(HTML6V) 

%.html: markdown/%.md6v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		--template=$(HTML_TEMPLATE) \
		--section-divs \
		$< -o $@


