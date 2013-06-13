# ---------------------------------------
#  Bilder in die verschiedenen Größen umwandeln
# ---------------------------------------


BILD_JPG_100 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}_100_.jpg; done)

BILD_PNG_100 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}_100_.png; done)

BILD_JPG_200 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}_200_.jpg; done)

BILD_PNG_200 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}_200_.png; done)

BILD_JPG_400 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}_400_.jpg; done)

BILD_PNG_400 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}_400_.png; done)

BILD_JPG_600 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}_600_.jpg; done)

BILD_PNG_600 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}_600_.png; done)

BILD_JPG_800 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.jpg") ; do echo $${i%.*}_800_.jpg; done)

BILD_PNG_800 = $(shell for i in $(shell find $(BVZ) -regextype sed -regex ".*[^_]\.png") ; do echo $${i%.*}_800_.png; done)


bilder: $(BILD_JPG_100) $(BILD_PNG_100) $(BILD_JPG_200) $(BILD_PNG_200) $(BILD_JPG_400) $(BILD_PNG_400) $(BILD_JPG_600) $(BILD_PNG_600) $(BILD_JPG_800) $(BILD_PNG_800)

%_100_.jpg: %.jpg
	convert $< -resize 100x $@

%_100_.png: %.png
	convert $< -resize 100x $@

%_200_.jpg: %.jpg
	convert $< -resize 200x $@

%_200_.png: %.png
	convert $< -resize 200x $@

%_400_.jpg: %.jpg
	convert $< -resize 400x $@

%_400_.png: %.png
	convert $< -resize 400x $@

%_600_.jpg: %.jpg
	convert $< -resize 600x $@

%_600_.png: %.png
	convert $< -resize 600x $@

%_800_.jpg: %.jpg
	convert $< -resize 800x $@

%_800_.png: %.png
	convert $< -resize 800x $@

