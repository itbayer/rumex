#!/usr/bin/perl

use strict;

my $url = "http://www.it-bayer.de/rumex";

=head1 make_sitemap.pl 

=encoding utf-8

Aufruf:
	bin/make_sitemap.pl > sitemap.xml

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

# .md?* Dateien  aus dem Verzeichnis markdown auslesen
# Berücksichtigt werden nur eXclude und Standard 
# Dateien Versteckte nicht.
push(@files, glob('markdown/*.md?x'));
push(@files, glob('markdown/*.md?s'));


# xml Inhalt erstellen
print <<EOF1;
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOF1

# Ausgelesene Dateien verarbeiten.
foreach(@files) {

	# .md wird nicht gebraucht, wird später eine .htm Datei
	$_ =~ m/^markdown\/(.*)\.md\d.+$/;	
 

	# Zeile für jede Datei erstellen
	print "<url>\n";
	print "    <loc>";
	print "$url/$1.html</loc>\n";
	print "</url>\n";


}

print "</urlset>\n";
