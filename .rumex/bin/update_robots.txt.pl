#!/usr/bin/perl


=head1 update_robots.txt

Liest die Seite URL aus der ../.rumex/user/config.makefile
und wechselt diese in der robots.txt aus.

=cut

# Aus dieser Datei wird die URL geholt
my $make_config = "../.rx/config.makefile";

# Diese Datei wird geändert
my $robots = "../robots.txt";

# Zwischenspeicher neue URL
my $url;

# Neuer Inhalt der Datei
my $neu = "";

# -----------------------------------------------------
# URL der Installation holen
open (MC, $make_config);

while (<MC>) {
	chomp $_;
	$url = $1 if $_ =~ m/URL="(.*)"/g;
}

close(MC);


# -----------------------------------------------------
# Aktuellen Inhalt der robots.txt auslesen
# und URL Tauschen
open (RB, $robots);

while (<RB>) {
	chomp $_;
	if ($_ =~ m/^Sitemap/) {
		$neu .= "Sitemap: ".$url."/sitemap.xml\n";
	} else {
		$neu .= $_."\n";
	}
}
close(RB);


# -----------------------------------------------------
# Neuen Inhalt zurück schreiben.
open (RX, ">". $robots);

	print RX $neu;

close(RX);



