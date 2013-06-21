#!/usr/bin/perl

use strict;

my $url = "http://www.it-bayer.de/rumex";

=head1 make_sitemap_html.pl 

=encoding utf-8

Aufruf:
	bin/make_sitemap_html.pl > markdwon/sitemap.md

	oder

	make sitemaphtml

Erstellt eine einfache Form einer C<sitemap.md> Datei.

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
% Seitenübersicht 
%
%


Übersicht aller Seiten dieser Homepage

EOF1

# Ausgelesene Dateien verarbeiten.
foreach(@files) {

	# .md wird nicht gebraucht, wird später eine .html Datei
	$_ =~ m/^markdown\/(.*)\.md\d.+$/;	
 

	# Zeile für jede Datei erstellen
	#print "* <$url/$1.html>\n";
	print ":\t* [$1]($1.html)\n";

}

