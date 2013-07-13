# 
# Makefile
#

# Default Konfiguraton laden
INC = ../.bin/config.makefile
# ...wenn eine user/config.makefile vorhanden ist, dieses verwenden
INC += $(shell if [ -f ../.inc/user/config.makefile ];then echo ../.inc/user/config.makefile;fi)
INC += ../.bin/main.makefile
INC += ../.bin/html.makefile
INC += ../.bin/bilder.makefile
INC += ../.bin/pdf.makefile

include $(INC)


inctest:
	@echo $(INC)
