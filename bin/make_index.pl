#!/usr/bin/perl

use strict;

# =====================================================
=head1 make_index.pl

=encoding utf-8

Dieses Script erstellt aus den einzelnen Dateien die
index.md für das jeweilige Verzeichnis.

TODO: herbei werden Textteile aus den einzelnen md 
Dateien ausgelesen

=cut

# -----------------------------------------------------
=head2 start.md

In der Datei C<start.md> können Texte, die später in 
die C<index.md> eingearbeitet werden, geschrieben werden.
Somit ist es möglich Nachrichten und Meldung in die 
C<index.md> einzubauem.

Der Name dieser Datei, Vorgabe C<start.md> kann in der Variable
C<$start_md> geändert werden.

=cut

my $start_md = "markdown/start.md";


# index.md zum schreiben öffne>
open (INDEX, ">markdown/index.md");


# ----------------------------------------------------
=head2 Überschrift der Seite

Die Überschrift der Seite, bestehend aus den drei
ersten Zeilen die bei pandoc mit C<%> gekennzeichnet sind,
wird aus dem C<Makefile> gelesen.

B<Makefile Beispiel>

# Programm zum erstellen der index.md
PROG="inc/make_index.pl"
# Überschriften für die Index Seite
U1="Willkommen auf der Hochfelder Seite" 
U2=""
U3=""

index: 
	 $(PROG) $(U1) $(U2) $(U3)


=cut

print INDEX "% $ARGV[0]\n";
print INDEX "% $ARGV[1]\n"; # HTML Leerzeichen so dass die Zeile auch angezeigt wird
print INDEX "% $ARGV[2]\n"; # Seitenüberschrift
print INDEX "\n";



# ===================================================
=head2 Datum der start.md 

Der Inhalt der start.md sollte immer ganz oben stehen
darum wird das Datum dieser Datei mit touch bei jedem 
Lauf neu gesetzt.
Somit ist sicher gestellt dass bei einer Seitenänderung
der Inhalt der C<start.md> immer oben steht.

Gesetzt wird das Datum aber nur wenn die Datei start.md vorhanden ist.

=cut

system ("/usr/bin/touch $start_md") if (-e $start_md);

# ----------------------------------------------------------
# Dateinamen der md Dateien auslesen incl. Datum der letzten Änderung
open (FH, "ls -lt1 --time-style=+\"%Y-%m-%d\" markdown/*.md |");

# ----------------------------------------------------------
# Schleife über die ausgelesenen Dateinamen
while (<FH>) {
	chop($_);

	# Datum und Name aus den Zeilen des Befehls ls ...
	# raus schneiden.
	(my $dummy1, my $dummy2, my $dummy3, my $dummy4, my $dummy5, my
		$datum, my $name) = split(/\s+/, $_);

	# =========================================================
=head2 Dateien die nicht in die index.md aufgenommen werden

Folgende Dateien werden nicht in die index.md aufgenommen.

=over 4

=item * index.md

=item * impressum.md

=item * kontakt.md

=item * rss.md

=item * readme.md

=item * Alle Dateien die mit einem I<Unterstrich> C<_> beginnen

=back

=cut

	next if ($name eq "markdown/index.md");
	next if ($name eq "markdown/impressum.md");
	next if ($name eq "markdown/kontakt.md");
	next if ($name eq "markdown/rss.md");
	next if ($name eq "markdown/readme.md");

	next if ($name =~ m/markdown\/_.*/);

	# Dateiname für Link bauen 
	#
	# Verzeichnis markdown raus schneiden
	($dummy1, my $dateiname) = split(/\//, $name);
	#
	# .md gegen .html austauschen
	(my $htmlname, $dummy1) = split(/\./, $dateiname);
	$htmlname = $htmlname.".html";

	# DIV um jeden Eintrag wickeln
	print INDEX "<div class=\"indexliste\">";

	# Datum der letzten Änderung vor dem Vortext stellen
	print INDEX "*$datum*\n" if ($name ne $start_md);
	# ..nicht anzeigen wenn es sich um eine start.md handelt.

	# Einzelnen Dateien auslesen um den Vortext zu 
	# erstellen.
	open (DAT, "< $name");
	my $vortext = 0; # Vortext Merker

	while (<DAT>) {
		chomp($_);

		# Vortext Merker hoch setzen.
		# Der Vortextmerker wird um eins erhöht
		# wenn eine Zeile mit dem Zeichen % am Anfang
		# gefunden wurden.
		# Dieses Zeichen definiert die Kopfzeile von 
		# pandoc.
		# Werden drei solche Zeilen gefunden wird der
		# Vortext in eine Datei geschrieben.
		if ($_ =~ m/^\%.*/) {
			$vortext ++;
		}

		# Wenn
		# <!-- schnipp -->
		# gefunden wurde den Vortext Merker wieder zurück
		# setzen.
		if($_ =~ m/<!--.*schnipp.*-->/) {
			$vortext = 0;
		}

		# Der Vortext kann auch kommentiert werden
		# sodass er im eigentlichen Artikel nicht mehr erscheint.
		# Diese Kommentarzeilen werden hier übersprungen.
		next if ($_ =~ m/.*<!--.*/);
		next if ($_ =~ m/.*-->.*/);


		# Wenn am Anfang der Datei drei Zeilen mit % gefunden wurden 
		# und die Zeile kein % mehr enthält dann den Text in
		# die Datei schreiben.
		if($vortext >= 3 && $_ !~ m/^\%.*/) {
			print INDEX $_ . "\n";
		}
	}


	# Vortext Abschluss
	print INDEX "[... weiter lesen]($htmlname)\n" if ($name ne
		$start_md);
	# .. nicht anzeigen wenn es sich um eine start.md handelt.
	print INDEX "\n";
	# Schlussstrich bei der start.md nicht ausgeben.
	# ..wurde eingebaut weil in der start.md auch mal eine Fusszeile
	#   vorkommen kann und dass dann sch... ausschaut.
	print INDEX "-----------------------------\n" if ($name ne
		$start_md);
	print INDEX "\n";
	print INDEX "\n";
	print INDEX "</div>\n";

}

close(INDEX);
close(DAT);
close(IN);
