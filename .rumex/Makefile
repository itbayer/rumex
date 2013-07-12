# 
# Makefile
#

INC = ../.bin/sys.config.makefile
INC += ../.inc/default/user.config.makefile
INC += $(shell if [ -f ../.inc/static/user.config.makefile ];then echo ../.inc/static/user.config.makefile;fi)
INC += ../.bin/main.makefile
INC += ../.bin/html.makefile
INC += ../.bin/pdf.makefile
INC += ../.bin/bilder.makefile

include $(INC)


inctest:
	@echo $(INC)
