#!/usr/bin/perl

use strict;

# URL aus erstem Parameter lesen, wird vom make Aufruf übergeben
my $url = "$ARGV[0]";

=head1 make_sitemap.pl 

=encoding utf-8

Aufruf:
	./.rumex/bin/make_sitemap.pl > sitemap.xml

	oder

	make sitemap

Erstellt eine einfache Form einer C<sitemap.xml> Datei.

Diese Datei wird u.a von Google Webmaster Tool gebraucht.
Auch andere Suchmaschinen verwenden diese Datei.
Sie kann in der C<robots.txt> durch die Zeile

C<Sitemap: http://www.it-bayer.de/rumex/sitemap.xml>

bekannt gemacht werden.

=cut


# sitemap für das Wurzelverzeichnis erstellen
my @files;

# .rx?[x|s] Dateien  auslesen
# Berücksichtigt werden nur eXclude und Standard Dateien.
push(@files, glob('*.rx?x'));
push(@files, glob('*.rx?s'));


# xml Inhalt erstellen
print <<EOF1;
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOF1

# Ausgelesene Dateien verarbeiten.
foreach(@files) {

	# Ueberspringen einzelner Dateien
	# ...wird in der HTML Version der sitemap nicht gebraucht.
	#
	# Bei der XML Version von sitemap sollen die index.html
	# erscheinen, siehe auch sitemap_rx.pl
	#next if($_ eq "index.rx0x");
	next if($_ eq "start.rx0s");



	# Die Endung .rx?? wird nicht gebraucht, wird später eine .html Datei
	$_ =~ m/(.*)\.rx\d.+$/;	
 

	# Zeile für jede Datei erstellen
	print "<url>\n";
	print "    <loc>";
	print "$url/$1.html</loc>\n";
	print "</url>\n";


}

print "</urlset>\n";
