# 
# .rumex/bin/pdf.makefile
#



# ######################################################

#PDF_FILES =  $(shell for i in $(shell ls -1 *.*rx*) ;do x=$${i\#*/};  echo $${x%.*}.pdf; done)

#pdf: $(PDF_FILES)

#../%.pdf: %.rx Makefile
#	$(PANDOC) -f markdown -t latex -s \
#		-V lang=ngermanb \
#		$< -o $@




