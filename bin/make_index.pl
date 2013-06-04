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

my $start_md = "markdown/start.md0s";


# index.md0x zum schreiben öffne
open (INDEX, ">markdown/index.md0x");

# Vortext Merker
my $schnipp;

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
=head2 Datum der start.md0s

Der Inhalt der start.md0s sollte immer ganz oben stehen
darum wird das Datum dieser Datei mit touch bei jedem 
Lauf neu gesetzt.
Somit ist sicher gestellt dass bei einer Seitenänderung
der Inhalt der C<start.md0s> immer oben steht.

Gesetzt wird das Datum aber nur wenn die Datei start.md0s vorhanden ist.

=cut

system ("/usr/bin/touch $start_md") if (-e $start_md);

# ----------------------------------------------------------
# Dateinamen der md?? Dateien auslesen incl. Datum der letzten Änderung
open (FH, "ls -lt1 --time-style=+\"%Y-%m-%d\" markdown/*.md* |");

# ----------------------------------------------------------
# Schleife über die ausgelesenen Dateinamen
while (<FH>) {
	chop($_);

	# Datum und Name aus den Zeilen des Befehls ls ...
	# raus schneiden.
	(my $dummy1, my $dummy2, my $dummy3, my $dummy4, my $dummy5, my
		$datum, my $name) = split(/\s+/, $_);

	# =========================================================

=head2 Dateien die nicht in die index.md0x aufgenommen werden

Alle Dateien die mit einem x bzw. v enden werden nicht in die
index.md0x aufgenommen.
Ausserdem wird die C<readme.md>, die in github.com
vorkommen kann, auch ausgeschlossen.

=cut

	next if ($name =~ m/markdown\/.*?x$/);
	next if ($name =~ m/markdown\/.*?v$/);
	next if ($name eq "markdown/readme.md");

	# Dateiname für Link bauen 
	#
	# Verzeichnis markdown raus schneiden
	($dummy1, my $dateiname) = split(/\//, $name);
	#
	# .md?? gegen .html austauschen
	(my $htmlname, $dummy1) = split(/\./, $dateiname);
	$htmlname = $htmlname.".html";

	# DIV um jeden Eintrag wickeln
	print INDEX "<div class=\"indexliste\">\n";

	# Datum der letzten Änderung vor dem Vortext stellen
	# ... nicht setzen wenn es sich um die start.md0s handelt.
	print INDEX "\n*$datum*\n" if ($name ne $start_md);

	# Einzelnen Dateien auslesen um den Vortext zu 
	# erstellen.
	open (DAT, "< $name");

	# Vortextmerker setzen
	$schnipp = 0; 

	while (<DAT>) {
		chomp($_);

		# pandoc Kopfzeilen überspringen
		# wenn schnipp noch nicht gefunden wurde.
		next if (!$schnipp && $_ =~ m/^\%.*/ );

		# Wenn schnipp gefunden wurde Ende des Vortextes setzen.
		$schnipp = 1 if($_ =~ m/<!--.*schnipp.*-->/);

		# Der Vortext kann auch kommentiert werden
		# sodass er zwar auf der index.html erscheint
		# im eigentlichen Artikel aber nicht.
		next if ($_ =~ m/.*<!--.*/);
		next if ($_ =~ m/.*-->.*/);

		# Vortext ausgeben wenn der Vortextmerker
		# noch nicht gesetzt wurde und die
		# Zeile keine pandoc Kopfzeile ist.
		print INDEX $_ . "\n" if(!$schnipp && $_ !~ m/^\%.*/);
	}


	# Vortext Abschluss und Link zur eigentlichen Seite setzen ...
	# .. nicht anzeigen bei start.md0s.
	print INDEX "[... weiter lesen]($htmlname)\n\n" if ($name ne $start_md);

	# Schlussstrich setzen, nicht bei start.md0s.
	print INDEX "---\n" if ($name ne $start_md);
	
	print INDEX "\n";
	print INDEX "</div>\n";
	print INDEX "\n\n\n";

}

close(INDEX);
close(DAT);
close(IN);
