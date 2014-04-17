#!/usr/bin/perl 
#
# rx2rss.pl V:1.0
#
#

use strict;
use warnings;
use utf8;




=pod

=encoding utf8

=head1 rx2rss

rx2rss ist kleines Programm das aus einer Markdown Datei einen RSS Feed erstellt.

Zum schreiben der Texte wird der erweiterte Markdown Syntax von pandoc verwendet.
Pandoc ist auch für die Umwandlung der Texte innerhalb der XML Datei zuständig.
Muss also auf dem System installiert werden.

	apt-get install pandoc

=cut




=head1 Manueller Aufruf

Das Programm wird mit 

	perl rx2rss.pl URL+NAME (ohne Endung)

gestartet. 
Die Ausgabe erfolgt auf dem Bildschirm.

=cut

# Einlesen der URL
# und des Dateinamens
# Zusammenbau der erforderlichen Variablen.
my ($url, $name ) = split('\+', $ARGV[0]);
# Kompletter Name der Eingabe Datei
my $name_rx = $name.".rx0x";
# Kompletter Name der Ausgabe Datei
my $name_xml = $name.".xml";


# pandoc inc. Parameter email nicht maskieren.
my $pandoc = "pandoc --email-obfuscation=none";




# -------------------------------------------------------------------
# Arbeitsvariable
# -------------------------------------------------------------------

# Ablage für Titel Daten
my %titel;

# Zähler für die Titelzeilen
my $titel_zaehler = 0;

# Ablage für die Kopf Daten
my %kopf;

# Zähler für die Kopfzeilen
my $kopf_zaehler = 0;

# Ablage für die Meldungen
my %item;

# Zähler für die einzelnen Meldungen
my $item_zaehler = 0;




=head1 RSS Feed Standard Werte

=head2 Kopf

Für die RSS Grund Datei werden Standardwerte vorgespannt.
Diese können jedoch in der jeweiligen Datei angepasst werden.
Folgende Kopfwerte stehen zur Verfügung.

=over 

=item *	
	%> Titel: IT Bayers Rumex - Ein Home Page Baukasten

=item *
	%> Beschreibung: Aktuelles und Neuigkeiten

=item *
    %> Link: http://www.it-bayer.de/rumex/

=item *
	%> Lang: de-DE

=item *
	%> BildTitel: IT Bayers Rumex - Ein Home Page Baukasten

=item *
	%> BildURL: http://www.it-bayer.de/rumex/rxtpl/img/rss.png

=item *
	%> BildLink: http://www.it-bayer.de/rumex/

=item *
	%> BildBeschreibung: Aktuelles und Neuigkeiten von der rumex Seite.




=back

=head2 Meldung


=over

=item *
	!> Autor: IT-Bayer

=item *
	!> Link: http://www.it-bayer.de/rumex/

=item *
	!> Kategorie: Neues

=back

=cut


=head1 Sonstiges

=head2 Titel nach pandoc


B<Beispiel>

	% Abo Seite - Newsletter - RSS Feed
	% 
	%

Die Zeilen müssen am Anfang der Datei stehen.

=cut




#-------------------------------------------------------------------------------
# Datei auslesen und abarbeiten
#-------------------------------------------------------------------------------
open ("rss_rx", "< $name_rx");





while (<rss_rx>) {

#-------------------------------------------------------------------------------
# Pandocs Titelzeile raus suchen und merken.
# Die Titelzeile beginnt mit dem Zeichen %
#-------------------------------------------------------------------------------

	if ($_ =~ m/^\%\s+(.*)$/) {
		$titel_zaehler ++;
		$titel{$titel_zaehler} = $1;
	}




#-------------------------------------------------------------------------------
#	Kopfzeile raus suchen und merken
#	Die Kopfzeile beginnt mit den Zeichen %>
#	und ist von einem HTML Kommentar TAG umschlossen
#-------------------------------------------------------------------------------

	if ($_ =~ m/^%\>\s+Titel:\s+(.*)\s*?$/) {
		$kopf{'titel'} = $1;
	}

	if ($_ =~ m/^%\>\s+Beschreibung:\s+(.*)\s*?$/) {
		$kopf{'beschreibung'} = $1;
	}

	if ($_ =~ m/^%\>\s+Link:\s+(.*)\s*?$/) {
		$kopf{'link'} = $1;
	}

	if ($_ =~ m/^%\>\s+Lang:\s+(.*)\s*?/) {
		$kopf{'lang'} = $1;
	}



#-------------------------------------------------------------------------------
# Bild Datei für den Kopf raus suchen und Parameter merken
#-------------------------------------------------------------------------------
	if ($_ =~ m/^%\>\s+BildTitel:\s+(.*)\s*?$/) {
		$kopf{'bild_titel'} = $1;
	}

	if ($_ =~ m/^%\>\s+BildURL:\s+(.*)\s*?$/) {
		$kopf{'bild_url'} = $1;
	}

	if ($_ =~ m/^%\>\s+BildLink:\s+(.*)\s*?$/) {
		$kopf{'bild_link'} = $1;
	}

	if ($_ =~ m/^%\>\s+BildBeschreibung:\s+(.*)\s*?$/) {
		$kopf{'bild_beschreibung'} = $1;
	}





#-------------------------------------------------------------------------------
# MeldungsZeilen raus suchen und merken
#
# Die Überschrift muss in dem Format
# Überschrift <!-- Thu, 17 Apr 2014 15:16:02 +0200 -->
# erstellt werden.
#-------------------------------------------------------------------------------

	if ($_ =~ m/#\s+(.*?)\s*?\<\!--\s*?(.{3}),\s*?(\d{2})\s*?(.{3})\s*?(\d{4})\s*?(\d{2}:\d{2}:\d{2})\s*?(\+\d{4})\s*?--\>\s*?$/) {

		$item_zaehler++;
		$item{$item_zaehler}{'ueberschrift'} = $1;
		$item{$item_zaehler}{'tag_name'} = $2;
		$item{$item_zaehler}{'tag_zahl'} = $3;
		$item{$item_zaehler}{'monat'} = $4;
		$item{$item_zaehler}{'jahr'} = $5;
		$item{$item_zaehler}{'zeit'} = $6;
		$item{$item_zaehler}{'zeit_zone'} = $7;
	}

	# MeldungsLink setzen wenn vorhanden
	if ($_ =~ m/^!\>\s+Link:\s+(.*)$/) {
		$item{$item_zaehler}{'link'} = $1;
	}

	# MeldungsAutor setzen wenn vorhanden
	if ($_ =~ m/^!\>\s+Autor:\s+(.*)$/) {
		$item{$item_zaehler}{'autor'} = $1;
	}

	# MeldungsKategorie setzen wenn vorhanden
	if ($_ =~ m/^!\>\s+Kategorie:\s+(.*)$/) {
		$item{$item_zaehler}{'kategorie'} = $1;
	}

	# Text des Berichtes raus suchen und Merken
	#	Dabei werden die Schlüssel der Kennzeichnung ausgeschlossen.
	if ($_ !~ m/^!\>/ &&
		$_ !~ m/^\<!--/	&&
		$_ !~ m/^--\>/	&&
		$_ !~ m/^#.*?\<\!--.*?--\>/	
	) {
		$item{$item_zaehler}{'text'} .= $_;	
	}
}

close("rss_rx");




#-------------------------------------------------------------------------------
# Ausgabe der rss Datei
#-------------------------------------------------------------------------------


# Kopfdatei schreiben
print "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
print "<rss version=\"2.0\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n";
print "<channel>\n";
print "<atom:link href=\"$url/$name_xml\" rel=\"self\" type=\"application/rss+xml\" />\n";
print "<title>$kopf{'titel'}</title>\n";
print "<description>\n";
print "<![CDATA[\n";
print "$kopf{'beschreibung'}\n";
print "]]>\n";
print "</description>\n";
print "<link>$kopf{'link'}</link>\n";
print "<language>$kopf{'lang'}</language>\n";

print "<image>\n";
print "<title>$kopf{'bild_titel'}</title>\n";
print "<url>$kopf{'bild_url'}</url>\n";
print "<link>$kopf{'bild_link'}</link>\n";
print "<description>\n";
print "<![CDATA[\n";
print "$kopf{'bild_beschreibung'}	\n";
print "]]>\n";
print "</description>\n";
print "</image>\n";





#-------------------------------------------------------------------------------
# Einzelne Meldungen verarbeiten und ausgeben
#-------------------------------------------------------------------------------
my $i;
for ($i = 1; $i <= $item_zaehler; $i++){

	print "<item>\n";
	print "<title>$item{$i}{'ueberschrift'}</title>\n";
	print "<description>\n";
	print "<![CDATA[\n";




#-------------------------------------------------------------------------------
# Anmerkung zu $item{$i}{'text'}
# ------------------------------
# Bei diesem Eintrag darf kein "" verwendet werden.
# echo würde sonst versuchen den Text, der ein
# pandoc code Element enthält (`beispiel`),
# als Programm auszuführen.
# system("echo \"$item{$i}{'text'}\" | $pandoc"); 
# funktioniert also nicht.
#-------------------------------------------------------------------------------

	system("echo '$item{$i}{'text'}' | $pandoc");

	print "]]>\n";
	print "</description>\n";
	print "<link>$item{$i}{'link'}</link>\n";




#-------------------------------------------------------------------------------
# Dieser Eintrag braucht einen eindeutige Kennung
# sonst wird unter Liferea immer nur der letzte Eintrag 
# angezeigt.
# Die eindeutige Kennung wird Anhand des Datums erstellt 
#-------------------------------------------------------------------------------
	print "<guid isPermaLink=\"false\">$item{$i}{'link'}_$item{$i}{'tag_name'}_$item{$i}{'tag_zahl'}$item{$i}{'monat'}$item{$i}{'jahr'}</guid>\n"; 



#-------------------------------------------------------------------------------
# Der Eintrag wurde raus genommen da hier eine E-Mail Adresse
# angegeben werden muss.
# 
# <author>sb\@it-bayer.de(it-bayer)</author>
# 
# Ersetzt wurde der Eintrag durch
# 
# <dc:creator>$item{$i}{'autor'}</dc:creator>
# 
# dazu musste aber im Kopf der TAG
# 
# <rss...
# 
# um diesen Eintrag
# 
# xmlns:dc="http://purl.org/dc/elements/1.1/"
# 
# erweitert werden.
#-------------------------------------------------------------------------------


	print "<dc:creator>$item{$i}{'autor'}</dc:creator>\n";

	print "<pubDate>$item{$i}{'tag_name'}, $item{$i}{'tag_zahl'} $item{$i}{'monat'} $item{$i}{'jahr'} $item{$i}{'zeit'} $item{$i}{'zeit_zone'}</pubDate>\n";
	print "<category><![CDATA[$item{$i}{'kategorie'}]]></category>\n";
	print "</item>\n";
}

print "</channel>\n";
print "</rss>\n"; 





