# 
# bin/pandoc_html.makefile
#

#
#
#
# --section-divs \
#  raus genommen. Liefert einen schlechten HTML Code bei der 
#  index.html, section und div sind durch einander.
#


# -------------------------------------------------------------------
# HTML Datei ohne Inhaltsverzeichnis
#

HTML0S =  $(shell for i in $(shell ls -1 *.md0s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0s: $(HTML0S) 

../%.html: %.md0s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@

HTML0X =  $(shell for i in $(shell ls -1 *.md0x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0x: $(HTML0X) 

../%.html: %.md0x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML0V =  $(shell for i in $(shell ls -1 *.md0v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0v: $(HTML0V) 

../%.html: %.md0v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


# 
# Weiterleitung per JavaScript
# Für diesen Type gibt es nur die Stufe 0
# Inhaltsverzeichnis wäre hier sinnlos.
#
# Einbau der Weiterleitung
#
#    <script language="javascript">
#    <!--
#    window.location.href="ZIEL.html";
#    // -->
#    </script> 
#
HTML0W =  $(shell for i in $(shell ls -1 *.md0w 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0w: $(HTML0W) 

../%.html: %.md0w $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_WEITERLEITUNG) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@




# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 1
#
HTML1S =  $(shell for i in $(shell ls -1 *.md1s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1s: $(HTML1S) 

../%.html: %.md1s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML1X =  $(shell for i in $(shell ls -1 *.md1x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1x: $(HTML1X) 

../%.html: %.md1x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML1V =  $(shell for i in $(shell ls -1 *.md1v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1v: $(HTML1V) 

../%.html: %.md1v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=1 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 2
#
HTML2S =  $(shell for i in $(shell ls -1 *.md2s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2s: $(HTML2S) 

../%.html: %.md2s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML2X =  $(shell for i in $(shell ls -1 *.md2x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2x: $(HTML2X) 

../%.html: %.md2x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML2V =  $(shell for i in $(shell ls -1 *.md2v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2v: $(HTML2V) 

../%.html: %.md2v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=2 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@



# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 3
#
HTML3S =  $(shell for i in $(shell ls -1 *.md3s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3s: $(HTML3S) 

../%.html: %.md3s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML3X =  $(shell for i in $(shell ls -1 *.md3x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3x: $(HTML3X) 

../%.html: %.md3x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML3V =  $(shell for i in $(shell ls -1 *.md3v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3v: $(HTML3V) 

../%.html: %.md3v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=3 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 4
#
HTML4S =  $(shell for i in $(shell ls -1 *.md4s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4s: $(HTML4S) 

../%.html: %.md4s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML4X =  $(shell for i in $(shell ls -1 *.md4x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4x: $(HTML4X) 

../%.html: %.md4x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML4V =  $(shell for i in $(shell ls -1 *.md4v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4v: $(HTML4V) 

../%.html: %.md4v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=4 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 5
#
HTML5S =  $(shell for i in $(shell ls -1 *.md5s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5s: $(HTML5S) 

../%.html: %.md5s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML5X =  $(shell for i in $(shell ls -1 *.md5x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5x: $(HTML5X) 

../%.html: %.md5x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML5V =  $(shell for i in $(shell ls -1 *.md5v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5v: $(HTML5V) 

../%.html: %.md5v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=5 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


# -------------------------------------------------------------------
# HTML Datei mit Inhaltsverzeichnis Stufe 6
#
HTML6S =  $(shell for i in $(shell ls -1 *.md6s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6s: $(HTML6S) 

../%.html: %.md6s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML6X =  $(shell for i in $(shell ls -1 *.md6x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6x: $(HTML6X) 

../%.html: %.md6x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML6V =  $(shell for i in $(shell ls -1 *.md6v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6v: $(HTML6V) 

../%.html: %.md6v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		--toc \
		--toc-depth=6 \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


