index.rx0x
=============================

Die index.rx0x Seite wird mittels des Programms
`.rumex/bin/index.pl` erstellt bzw. zusammengebaut.
Die Reihenfolge bzw. der Zusammenbau ist dabei im
Bild 1 zu sehen.

![Bild1: Zusammenbau der index.rx0x](dia/index.rx0x.png)

Aus den einzelnen `rx?s` Seiten wird dabei der Text
bis zum Schlüsselwort `<!-- schnipp -->` verwendet.
Dieser Vortext oder auch Teile davon 
kann auch mit einem HTML Kommentar umschlossen werden,
so dass dieser auf der eigentlichen Seite nicht erscheint.

- Die Reihenfolge der Seiten bestimmt das Änderungsdatum.

- Vor den einzelnen Seiten werden die zwei Seite eingebaut

	- start.rx0s 
	- weblog.rx0s

<!-- vim: set ft=pandoc: -->
