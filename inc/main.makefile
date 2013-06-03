# 
# inc/main.makefile
#

# ###################################################
#
# --self-contained \

html: $(HTML_FILES) 

%.html: markdown/%.md $(DEV)
	$(PANDOC) -f markdown -t html5 -s \
		--email-obfuscation=references \
		--smart \
		-B $(KOPF_TEMPLATE) \
		-H $(HEADER_TEMPLATE) \
		-A $(FUSS_TEMPLATE) \
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

all: index html 



# ######################################################

online:
	git add .
	git commit -a -m"...."
	git push
