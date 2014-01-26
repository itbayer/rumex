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
    
	my $titel;	
	my $file = $_;

	# Ueberspringen einzelner Dateien
	# ...wird in der HTML Version der sitemap nicht gebraucht.
	next if($file eq "index.rx0x");
	next if($file eq "start.rx0s");

	# Auslesen des Titels
	open(FH,"< $file");
	# Merker nur erste Überschrift auslesen
	my $auslassen = 0;
	while(<FH>){
		# Überschrift gefunden, Rest auslassen
		if ($_ =~ /^\%\s(.*)/ && !$auslassen) {
			$titel = $1;
			$auslassen = 1;
		}
	}

	# Die Endung .rx?? wird nicht gebraucht, wird später eine .html Datei
	$file =~ m/^(.*)\.rx\d.+$/;	
 

	# Zeile für jede Datei erstellen
	print ":\t* [$titel]($1.html)\n";

}

print "</div>\n";
