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
=head2 start.rx0s

In der Datei C<start.rx0s> können Texte, die später in 
die C<index.rx0x> eingearbeitet werden, geschrieben werden.
Somit ist es möglich Nachrichten und Meldung in die 
C<index.rx0x> einzubauem.

Der Name dieser Datei, Vorgabe C<start.rx0s> kann in der Variable
C<$start_rx> geändert werden.

=cut

my $start_rx = "start.rx0s";

# -----------------------------------------------------
=head2 weblog.rx0s


Der Name dieser Datei, Vorgabe C<weblog.rx0s> kann in der Variable
C<$weblog_rx> geändert werden.

=cut


my $weblog_rx = "weblog.rx0s";


# index.rx0x zum schreiben öffne
open (INDEX, ">index.rx0x");

# Vortext Merker
my $schnipp;

# ----------------------------------------------------
=head2 Überschrift der Seite

Die Überschrift der Seite, bestehend aus den drei
ersten Zeilen die bei pandoc mit C<%> gekennzeichnet sind,
wird aus dem C<.rx/config.mk> gelesen.

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
=head2 Datum der start.rx0s und weblog.rx0s

Der Inhalt der start.rx0s bzw. weblog.rx0s sollte immer ganz oben stehen
darum wird das Datum dieser Dateien mit touch bei jedem 
Lauf neu gesetzt.
Somit ist sicher gestellt dass bei einer Seitenänderung
der Inhalt der C<start.rx0s> bzw. C<weblog.rx0s>  immer oben steht.

Gesetzt wird das Datum aber nur wenn die Datei start.rx0s bzw. weblog.rx0s vorhanden ist.

=cut

system ("/usr/bin/touch $weblog_rx") if (-e $weblog_rx);
system ("/usr/bin/touch $start_rx") if (-e $start_rx);

# ----------------------------------------------------------
# Dateinamen der rx?? Dateien auslesen incl. Datum der letzten Änderung
open (FH, "ls -lt1 --time-style=+\"%Y-%m-%d\" *.rx* |");

# ----------------------------------------------------------
# Schleife über die ausgelesenen Dateinamen
# Dateien verarbeiten
while (<FH>) {
	chop($_);

	# Datum und Name aus den Zeilen des Befehls ls ...
	# raus schneiden.
	(my $dummy1, my $dummy2, my $dummy3, my $dummy4, my $dummy5, my
		$datum, my $name) = split(/\s+/, $_);

	# =========================================================

=head2 Dateien die nicht in die index.rx0x aufgenommen werden

Alle Dateien die mit einem x,w bzw. v enden werden nicht in die
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
	#
	# Ausgeschaltet - wird nun unter der Überschrift
	# eingebaut siehe ca. Z:152
	# print INDEX "\n<p class=\"datum\">$datum</p>\n" if ($name ne $start_rx);

	# Einzelnen Dateien auslesen um den Vortext zu 
	# erstellen.
	open (DAT, "< $name");

	# Vortextmerker setzen
	$schnipp = 0; 

	# Text verarbeiten
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

		# Datum einbauen wenn die Überschrift erkannt wurde.
		print INDEX "\n<p class=\"datum\">Letzte Bearbeitung: $datum</p>\n" if(!$schnipp && $_ =~ m/^=+/);


	} # ENDE :: Text verarbeiten


	# Vortext Abschluss und Link zur eigentlichen Seite setzen ...
	# .. nicht anzeigen bei start.rx0s.
	print INDEX "[... Artikel öffnen]($htmlname)\n\n" if ($name ne $start_rx && $name ne $weblog_rx);

	print INDEX "\n";
	print INDEX "</div>\n";
	
	# Die Weblog Datei bekommt, zum öffnen, einen anderen Link.
	# Dieser Link muss nach dem DIV Tag "indexliste" gesetzt 
	# werden da sonst die Klasse
	# {.webloglink} von pandoc nicht gesetzt wird.
	print INDEX "#### [... ältere Weblog Einträge anzeigen]($htmlname) {.webloglink}\n\n" if($name eq $weblog_rx);

	print INDEX "\n\n\n";

} # ENDE :: Dateien verarbeiten

close(INDEX);
close(DAT);
close(IN);
