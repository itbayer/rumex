#!/usr/bin/perl

use strict;

=head1 sitemap_rx.pl 

=encoding utf-8

Aufruf:
	../.rumex/bin/sitemap_rx.pl > sitemap.rx0v

	oder

	make sitemaprx

Erstellt eine C<sitemap.rx0v> Datei.

=cut


# sitemap für das Wurzelverzeichnis erstellen
my @files;

# .rx?? Dateien  aus dem Verzeichnis markdown auslesen
# Berücksichtigt werden nur eXclude und Standard 
# Dateien Versteckte nicht.
push(@files, glob('*.rx?x'));
push(@files, glob('*.rx?s'));


# xml Inhalt erstellen
print <<EOF;
% Seitenübersicht 
%
%

<div id="sitemap">
Übersicht aller Seiten dieser Homepage
EOF

# Ausgelesene Dateien verarbeiten.
foreach(@files) {

	# Ueberspringen einzelner Dateien
	# ...wird in der HTML Version der sitemap nicht gebraucht.
	next if($_ eq "index.rx0x");
	next if($_ eq "start.rx0s");

	# Die Endung .rx?? wird nicht gebraucht, wird später eine .html Datei
	$_ =~ m/^(.*)\.rx\d.+$/;	
 

	# Zeile für jede Datei erstellen
	print ":\t* [$1]($1.html)\n";

}

print "</div>\n";