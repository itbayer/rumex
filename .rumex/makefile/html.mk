# ##############################################
# .bin/html.makefile
# ##############################################



# ---------------------------------------------
#  Wenn die Variable RSS_EXTERN gesetzt wurde
#  	diesen Wert für den Header Link 
#		-V rssfile=$(RSS_FILE) \
#  	verwenden bzw. die Variable RSS_FILE mit diesem
#  	Wert überschreiben.
ifdef RSS_EXTERN
	RSS_FILE = $(RSS_EXTERN)
endif




# ##############################################
# HTML Datei ohne Inhaltsverzeichnis
# ##############################################

HTML0S =  $(shell for i in $(shell ls -1 *.rx0s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0s: $(HTML0S) 

../%.html: %.rx0s $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@

HTML0X =  $(shell for i in $(shell ls -1 *.rx0x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0x: $(HTML0X) 

../%.html: %.rx0x $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_STANDARD) \
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML0V =  $(shell for i in $(shell ls -1 *.rx0v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0v: $(HTML0V) 

../%.html: %.rx0v $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_VERSTECKT) \
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@





# ================================
# Weiterleitung per JavaScript
# ================================
# 
# Für diesen Type gibt es nur die Stufe 0
# Inhaltsverzeichnis wäre hier sinnlos.
#
# Einbau der Weiterleitung
# ------------------------
#    <script language="javascript">
#    <!--
#    window.location.href="ZIEL.html";
#    // -->
#    </script> 

HTML0W =  $(shell for i in $(shell ls -1 *.rx0w 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html0w: $(HTML0W) 

../%.html: %.rx0w $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
		-V meta_generator=$(META_GENERATOR) \
		-V meta_robots=$(META_ROBOTS_WEITERLEITUNG) \
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@





# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 1
# ##############################################

HTML1S =  $(shell for i in $(shell ls -1 *.rx1s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1s: $(HTML1S) 

../%.html: %.rx1s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML1X =  $(shell for i in $(shell ls -1 *.rx1x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1x: $(HTML1X) 

../%.html: %.rx1x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML1V =  $(shell for i in $(shell ls -1 *.rx1v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html1v: $(HTML1V) 

../%.html: %.rx1v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@




# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 2
# ##############################################

HTML2S =  $(shell for i in $(shell ls -1 *.rx2s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2s: $(HTML2S) 

../%.html: %.rx2s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML2X =  $(shell for i in $(shell ls -1 *.rx2x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2x: $(HTML2X) 

../%.html: %.rx2x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML2V =  $(shell for i in $(shell ls -1 *.rx2v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html2v: $(HTML2V) 

../%.html: %.rx2v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@




# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 3
# ##############################################

HTML3S =  $(shell for i in $(shell ls -1 *.rx3s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3s: $(HTML3S) 

../%.html: %.rx3s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML3X =  $(shell for i in $(shell ls -1 *.rx3x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3x: $(HTML3X) 

../%.html: %.rx3x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML3V =  $(shell for i in $(shell ls -1 *.rx3v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html3v: $(HTML3V) 

../%.html: %.rx3v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@



# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 4
# ##############################################

HTML4S =  $(shell for i in $(shell ls -1 *.rx4s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4s: $(HTML4S) 

../%.html: %.rx4s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML4X =  $(shell for i in $(shell ls -1 *.rx4x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4x: $(HTML4X) 

../%.html: %.rx4x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML4V =  $(shell for i in $(shell ls -1 *.rx4v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html4v: $(HTML4V) 

../%.html: %.rx4v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@



# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 5
# ##############################################

HTML5S =  $(shell for i in $(shell ls -1 *.rx5s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5s: $(HTML5S) 

../%.html: %.rx5s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML5X =  $(shell for i in $(shell ls -1 *.rx5x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5x: $(HTML5X) 

../%.html: %.rx5x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML5V =  $(shell for i in $(shell ls -1 *.rx5v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html5v: $(HTML5V) 

../%.html: %.rx5v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@



# ##############################################
# HTML Datei mit Inhaltsverzeichnis Stufe 6
# ##############################################

HTML6S =  $(shell for i in $(shell ls -1 *.rx6s 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6s: $(HTML6S) 

../%.html: %.rx6s $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML6X =  $(shell for i in $(shell ls -1 *.rx6x 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6x: $(HTML6X) 

../%.html: %.rx6x $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@


HTML6V =  $(shell for i in $(shell ls -1 *.rx6v 2>/dev/null) ;do x=$${i\#*/}; echo ../$${x%.*}.html; done)

html6v: $(HTML6V) 

../%.html: %.rx6v $(DEV)
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
		-V meta_filedat=$(shell ls $< -l --time-style=+%Y-%m-%d | awk '{print $$6}') \
		-V meta_publisher=$(META_PUBLISHER) \
		-V meta_creator=$(META_CREATOR) \
		-V rsstitel=$(RSS_TITEL) \
		-V rssfile=$(RSS_FILE) \
		-V cssall=$(CSSALL) \
		-V cssscreen=$(CSSSCREEN) \
		-V cssprint=$(CSSPRINT) \
		-V csshandheld=$(CSSHANDHELD) \
		-V seitenbanner=$(SEITENBANNER) \
		-V mootit=$(MOOTIT) \
		-V favicon=$(FAVICON) \
		-V rumexsuche=$(RUMEXSUCHE) \
		--template=$(HTML_TEMPLATE) \
		$< -o $@



