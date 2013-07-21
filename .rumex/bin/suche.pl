#!/usr/bin/perl

use strict;

=head1 suche.pl 

=encoding utf-8

Aufruf:
	../.bin/suche.pl > ../css/rumexsuche_config.js

	oder

	make suche

Erstellt eine C<css/rumexsuche_config.js> Datei.

=cut


# sitemap für das Wurzelverzeichnis erstellen
my @files;

# .rx?? Dateien  aus dem Verzeichnis markdown auslesen
# Berücksichtigt werden nur eXclude und Standard 
# Dateien Versteckte nicht.
push(@files, glob('*.rx?x'));
push(@files, glob('*.rx?s'));


# js Inhalt erstellen
print "suchseite = new Array();\n";

# Suchseiten Zähler 
my $i = 0;
my @seitenname;

# Ausgelesene Dateien verarbeiten.
foreach(@files) {

	# .rx?? wird nicht gebraucht, wird später eine .html Datei
	$_ =~ m/^(.*)\.rx\d.+$/;	

	# jede gefunden Datei aufmachen um den Inhalt zu lesen
	open(RX, $_);

	# Dummy Zähler für die drei möglichen Überschriften
	my $d=0;

	# Seite durchlaufen und die Überschriften raus holen
	while(<RX>) {
		chomp $_;
		if ($_ =~ /^\%\s*(.*)/) {
			$seitenname[$d][$i] = $1;
			$d++;
		}
	}

	# Zeile für jede Datei erstellen
	print "suchseite[$i] = new Array(\"$seitenname[0][$i]\", '$1.html');\n";
	$i++;
	close(RX);

}

