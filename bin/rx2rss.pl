#!/usr/bin/perl 
#
# rx2rss.pl V:0.1
#
#

=head1 Beschreibung

Ein kleines Programm das aus einer Markdown Datei einen RSS Feed erstellt.
Als Vorlage wird C<pandocs markdown> verwendet.

=cut


use strict;
use warnings;
use utf8;

=head3 rss.rx0x

Datei aus der der Inhalt für die Datei rss.xml gelesen wird
Als Eingabe ist die Datei C<rss.rx0x> vorbelegt.

=cut 
my $file = "rss.rx0x";

# pandoc inc. Parameter
my $pandoc = "pandoc --email-obfuscation=none";

# Ablage für die Kopf Daten
my %kopf;

# Ablage für die Berichtsdaten
my %item;

# Zähler für die einzelnen Berichte
my $item_zaehler = 0;

# Inhalt der Berichtsdaten ab arbeiten
open ("rss_rx", "< $file");

while (<rss_rx>) {

	# Pandocs Kopfzeile raus filtern und merken.
	if ($_ =~ m/^\%\s+(.*)$/) {
		$kopf{'dummy'} .= $1;
	}

	# -----------------------------------------------------
	# RSS Kopf Parameter
	# -----------------------------------------------------

	# Wenn ein pandoc Kopf gefunden wurden die einzelnen RSS
	# Elemente raus suchen und merken.
	if ($kopf{'dummy'}) {	

		if ($_ =~ m/^\|\s+Titel:\s+(.*)$/) {
			$kopf{'titel'} = $1;
		}

		if ($_ =~ m/^\|\s+Beschreibung:\s+(.*)$/) {
			$kopf{'beschreibung'} = $1;
		}

		if ($_ =~ m/^\|\s+KLink:\s+(.*)$/) {
			$kopf{'link'} = $1;
		}

		if ($_ =~ m/^\|\s+Lang:\s+(.*)$/) {
			$kopf{'lang'} = $1;
		}

		# ---------------------------------------------------------
		# Bild Datei für den Kopf raus suchen und Parameter merken
		if ($_ =~ m/^\|\s+BildTitel:\s+(.*)$/) {
			$kopf{'bild_titel'} = $1;
		}

		if ($_ =~ m/^\|\s+BildURL:\s+(.*)$/) {
			$kopf{'bild_url'} = $1;
		}

		if ($_ =~ m/^\|\s+BildLink:\s+(.*)$/) {
			$kopf{'bild_link'} = $1;
		}

		if ($_ =~ m/^\|\s+BildBeschreibung:\s+(.*)$/) {
			$kopf{'bild_beschreibung'} = $1;
		}

		# ----------------------------------------------
		# Überschrift für den ersten Eintrag
		#
		# BUG: RegEx Fehler
		#      Die erste Überschrift muss  mit einem {} abschließen.
		if ($_ =~ m/^#\s+(.+)\s*\{.*\}.*$/) {
			$item_zaehler++;
			$item{$item_zaehler}{'titel'} = $1;
		}

		# Parameter für die einzelnen Einträge
		if ($_ =~ m/^\|\s+Link:\s+(.*)$/) {
			$item{$item_zaehler}{'link'} = $1;
		}

		if ($_ =~ m/^\|\s+Autor:\s+(.*)$/) {
			$item{$item_zaehler}{'autor'} = $1;
		}

		if ($_ =~ m/^\|\s+Kategorie:\s+(.*)$/) {
			$item{$item_zaehler}{'kategorie'} = $1;
		}

		# --------------------------------------------------------
		# Text der einzelnen Einträge
		#
		# Zeilen aus der Datei raus holen die per pandoc nach
		# HTML umwandeln.
		# 
		# BUG:
		#	Links und Bilder die am Anfang einer Zeile stehen
		#	werden nicht übernommen.
		#	Hier fehlt noch der entsprechende Filter.
		#

		$item{$item_zaehler}{'text'} .= $_ if (
			$_ =~ m/^\w+.*$/ # Alles was mit einem Buchstaben beginnt
			|| $_ =~ m/^$/ # Leere Zeilen, braucht man für die Absatztrennung
			|| $_ =~ m/\*\s+\w+.*$/ # Aufzählung  mit  Stern
			|| $_ =~ m/\-\s+\w+.*$/ # Aufzählungen mit Minus
			# Überschrift 2 wird nicht verwendet, schaut scheiße aus
			|| $_ =~ m/^###.*$/ # Überschrift 3
			|| $_ =~ m/^####.*$/ # Überschrift 4
			|| $_ =~ m/^#####.*$/ # Überschrift 5
			|| $_ =~ m/^######.*$/ # Überschrift 6
			|| $_ =~ m/^>.*$/ # Zitate
				and  $_ !~ m/.*<!--.*-->.*/ # Kommentare nicht mit nehmen
		);
	}
}

# <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
print <<EOF1;
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
	<atom:link href="http://www.it-bayer.de/rumex/rss.xml" rel="self" type="application/rss+xml" />
		<title>$kopf{'titel'}</title>
		<description>
			<![CDATA[
			$kopf{'beschreibung'}
			]]>
		</description>
		<link>$kopf{'link'}</link>
		<language>$kopf{'lang'}</language>

		<image>
			<title>$kopf{'bild_titel'}</title>
			<url>$kopf{'bild_url'}</url>
			<link>$kopf{'bild_link'}</link>
			<description>
				<![CDATA[
				$kopf{'bild_beschreibung'}	
				]]>
			</description>
		</image>


EOF1



# Verarbeiten der einzelnen Nachrichten

my $x;
my $i;
for (keys %item) {$x++};
for ($i = 1; $i < $x; $i++){

	print <<EOF2;

<item>
	<title>$item{$i}{'titel'}</title>
	<description>
	<![CDATA[

EOF2


=head2 Anmerkung zum Autor(en) Eintrag

Der Eintrag wurde raus genommen da hier eine E-Mail Adresse
angegeben werden muss.

<author>sb\@it-bayer.de(it-bayer)</author>

Ersetzt wurde der Eintrag durch

<dc:creator>$item{$i}{'autor'}</dc:creator>

dazu musste aber im Kopf der TAG

<rss...

um diesen Eintrag

xmlns:dc="http://purl.org/dc/elements/1.1/"

erweitert werden.

=cut

# Anmerkung zu $item{$i}{'text'}
# ------------------------------
# Bei diesem Eintrag darf kein "" verwendet werden.
# echo würde sonst versuchen den Text, der ein
# pandoc code Element enthält (`beispiel`),
# als Programm auszuführen.
# system("echo \"$item{$i}{'text'}\" | $pandoc"); 
# funktioniert nicht.

system("echo '$item{$i}{'text'}' | $pandoc");
#print $item{$i}{'text'}."\n";

print <<EOF3;

]]>
	</description>
		<link>$item{$i}{'link'}</link>
		<guid>$item{$i}{'link'}</guid>
		<dc:creator>$item{$i}{'autor'}</dc:creator>
		<category><![CDATA[$item{$i}{'kategorie'}]]></category>
</item>

EOF3
}


print <<EOF4;

</channel>
</rss>

EOF4


close("rss_rx");


=head2 Vorlage der rss.rx0x Datei

Als rss.rx0x kann man sich an folgender Vorlage orientieren.

=cut

=begin text

% Abo Seite - Newsletter - RSS Feed
% 
%


<!--
| Titel: Hochfelder Meldungen 
| Beschreibung: Aktuelles und Neuigkeiten von der Hochfelder Seite
| KLink: http://www.hochfelder.de/
| Lang: de-DE
| BildTitel: Hochfelder Meldungen
| BildURL: http://www.hochfelder.de/xicons/404.png
| BildLink: http://www.hochfelder.de/
| BildBeschreibung: Aktuelles und Neuigkeiten von der Hochfelder Seite.
-->


# Änderungen auf der Hochfelder Seite {#aenderung}

<!-- 
| Link: http://www.hochfelder.de/rss.htm#aenderung
| Autor: Stefan v. Hochfeld
| Kategorie: Neues
-->

Auf der Seite gibt es wieder ein paar Änderungen über die
ich euch kurz informieren möchte.

# Zweiter Eintrag {#e2}

<!-- 
| Link: http://www.hochfelder.de/rss.htm#e2
| Autor: Stefan v. Hochfeld
| Kategorie: Neues
-->

Auf der Seite gibt es wieder ein paar Änderungen über die
ich euch kurz informieren möchte.

=end text



