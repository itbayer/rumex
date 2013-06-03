# 
# inc/main.makefile
#

html: html0s html0x html1s html1x html2s html2x html3s html3x html4s html4x html5s html5x html6s html6x

# ######################################################

index: 
	$(INDEX) $(U1) $(U2) $(U3)


# ######################################################

all: index html 


# ######################################################

online: all
	git add .
	git commit -a -m"...."
	git push
