# 
# Makefile
#

# Default Konfiguraton laden
INC = ../.rumex/makefile/config.mk
# ...wenn eine user/config.makefile vorhanden ist, dieses verwenden
INC += $(shell if [ -f ../.rx/config.mk ];then echo ../.rx/config.mk;fi)
INC += ../.rumex/makefile/main.mk
INC += ../.rumex/makefile/html.mk
INC += ../.rumex/makefile/bilder.mk
INC += ../.rumex/makefile/pdf.mk

include $(INC)

inctest:
	@echo $(INC)
