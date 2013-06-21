# 
# bin/pandoc_pdf.makefile
#



# ######################################################

#PDF_FILES =  $(shell for i in $(shell ls -1 markdown/*.*md*) ;do x=$${i\#*/};  echo $${x%.*}.pdf; done)

#pdf: $(PDF_FILES)

#%.pdf: %.md Makefile
#	$(PANDOC) -f markdown -t latex -s \
#		-V lang=ngermanb \
#		$< -o $@




