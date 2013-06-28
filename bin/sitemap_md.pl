#!/usr/bin/perl

use strict;

my $url = "http://www.it-bayer.de/rumex";

=head1 sitemap_md.pl 

=encoding utf-8

Aufruf:
	bin/sitemap_md.pl > markdwon/sitemap.md0v

	oder

	make sitemapmd

Erstellt eine C<sitemap.md0v> Datei.

=cut


# sitemap für das Wurzelverzeichnis erstellen
my @files;

# .md?* Dateien  aus dem Verzeichnis markdown auslesen
# Berücksichtigt werden nur eXclude und Standard 
# Dateien Versteckte nicht.
push(@files, glob('rumex/*.md?x'));
push(@files, glob('rumex/*.md?s'));


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

	# .md wird nicht gebraucht, wird später eine .html Datei
	$_ =~ m/^rumex\/(.*)\.md\d.+$/;	
 

	# Zeile für jede Datei erstellen
	print ":\t* [$1]($1.html)\n";

}

print "</div>\n";
