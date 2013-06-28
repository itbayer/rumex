#!/usr/bin/perl

use strict;

# =====================================================
=head1 make_index.pl

=encoding utf-8

Dieses Script erstellt aus den einzelnen Dateien die
index.rx0x.

TODO: herbei werden Textteile aus den einzelnen rx 
Dateien ausgelesen

=cut

# -----------------------------------------------------
=head2 start.rx0v

In der Datei C<start.rx0v> können Texte, die später in 
die C<index.rx0x> eingearbeitet werden, geschrieben werden.
Somit ist es möglich Nachrichten und Meldung in die 
C<index.rx0x> einzubauem.

Der Name dieser Datei, Vorgabe C<start.rx0v> kann in der Variable
C<$start_rx> geändert werden.

=cut

my $start_rx = "start.rx0v";


# index.rx0x zum schreiben öffne
open (INDEX, ">index.rx0x");

# Vortext Merker
my $schnipp;

# ----------------------------------------------------
=head2 Überschrift der Seite

Die Überschrift der Seite, bestehend aus den drei
ersten Zeilen die bei pandoc mit C<%> gekennzeichnet sind,
wird aus dem C<template/config.makefile> gelesen.

B<Makefile Beispiel>

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
=head2 Datum der start.rx0s

Der Inhalt der start.rx0s sollte immer ganz oben stehen
darum wird das Datum dieser Datei mit touch bei jedem 
Lauf neu gesetzt.
Somit ist sicher gestellt dass bei einer Seitenänderung
der Inhalt der C<start.rx0s> immer oben steht.

Gesetzt wird das Datum aber nur wenn die Datei start.rx0s vorhanden ist.

=cut

system ("/usr/bin/touch $start_rx") if (-e $start_rx);

# ----------------------------------------------------------
# Dateinamen der rx?? Dateien auslesen incl. Datum der letzten Änderung
open (FH, "ls -lt1 --time-style=+\"%Y-%m-%d\" *.rx* |");

# ----------------------------------------------------------
# Schleife über die ausgelesenen Dateinamen
while (<FH>) {
	chop($_);

	# Datum und Name aus den Zeilen des Befehls ls ...
	# raus schneiden.
	(my $dummy1, my $dummy2, my $dummy3, my $dummy4, my $dummy5, my
		$datum, my $name) = split(/\s+/, $_);

	# =========================================================

=head2 Dateien die nicht in die index.rx0x aufgenommen werden

Alle Dateien die mit einem x bzw. v enden werden nicht in die
index.rx0x aufgenommen.

=cut

	next if ($name =~ m/.*?x$/);
	next if ($name =~ m/.*?v$/);
	next if ($name =~ m/.*?w$/);

	# .rx?? gegen .html austauschen
	(my $htmlname, $dummy1) = split(/\./, $name);
	$htmlname = $htmlname.".html";

	# DIV um jeden Eintrag wickeln
	print INDEX "<div class=\"indexliste\">\n";

	# Datum der letzten Änderung vor dem Vortext stellen
	# ... nicht setzen wenn es sich um die start.rx0s handelt.
	print INDEX "\n*$datum*\n" if ($name ne $start_rx);

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
	# .. nicht anzeigen bei start.rx0?.
	print INDEX "[... weiter lesen]($htmlname)\n\n" if ($name ne $start_rx);

	# Schlussstrich setzen, nicht bei start.rx0?.
	print INDEX "---\n" if ($name ne $start_rx);
	
	print INDEX "\n";
	print INDEX "</div>\n";
	print INDEX "\n\n\n";

}

close(INDEX);
close(DAT);
close(IN);
