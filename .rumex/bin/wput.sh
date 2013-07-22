#!/bin/bash


DATEI_LISTE="*.html *.xml robots.txt rxtpl/ bilder/"

cd ..

for i in $DATEI_LISTE; do

	wput -N $i $1

done;
