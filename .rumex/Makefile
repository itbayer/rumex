# 
# Makefile
#

# Default Konfiguraton laden
INC = ../.rumex/bin/config.makefile
# ...wenn eine user/config.makefile vorhanden ist, dieses verwenden
INC += $(shell if [ -f ../.rumex/user/config.makefile ];then echo ../.rumex/user/config.makefile;fi)
INC += ../.rumex/bin/main.makefile
INC += ../.rumex/bin/html.makefile
INC += ../.rumex/bin/bilder.makefile
INC += ../.rumex/bin/pdf.makefile

include $(INC)

inctest:
	@echo $(INC)
