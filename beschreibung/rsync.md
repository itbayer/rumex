Upload mit rsync
================================

Ab der Version `0.8.5.1` wird ein Upload mittels `rsync` unterstützt.
Für diese Funktion ist ein `SSH` Zugang zum Server erforderlich.


Die entsprechenden Variablen findet man in der Datei
`.rumex/makefile/config.mk`.



**Ausschnitt aus der Datei `.rumex/makefile/main.mk`**

~~~
  #-------------------------------------------------------------------------------
  # Upload mit rsync
  # 
  # Variable für die Aktualisierung
  #
  # Schalter für die rsync Funktion.
  #RSYNC = /usr/bin/rsync
  #
  # Datei mit den Mustern die nicht hoch geladen werden.
  RSYNCEXCLUDE = rsync-exclude
  # ssh Benutzername
  RSYNCUSER = USER
  # Quellverzeichnis ab dem rsync arbeiten soll
  RSYNCQUELLE = ../
  # Zielverzeichnis auf dem Server
  RSYNCZIEL = $(RSYNCUSER):~/www.it-bayer.de/
  # Parameter für Rsync
  RSYNCPARAMETER = -e "ssh" --checksum -rlvzu --delete-excluded --exclude-from=$(RSYNCEXCLUDE)
  #
~~~





Beschreibung der Makefile Schalter
------------------------------------------------------------

RSYNC
:	Diese Variable hat zwei Funktionen

	1. Pfadangabe des `rsync` Programms
	2. Schalter ob diese Funktion verwendet wird.
	_Dieser Schalter ist per Standard kommentiert._

	Vorgabe: \
	`/usr/bin/rsync`


RSYNCEXCLUDE
:	Datei in der die Muster definiert werden die **nicht**
	synchronisiert werden. Die Datei findet man im `.rx/`
	Verzeichnis.
	
	Vorgabe: \
	`rsync-exclude`


RSYNCUSER
:	Benutzername des SSH Zugangs 
	
	Vorgabe: \
	`USER`

RSYNCQUELLE 
:	Quelle ab dem `rsync` die Dateien berücksichtigen soll.
	_Da das Programm `make` im `.rx` Verzeichnis ausgeführt
	wird ist die Vorgabe ein Verzeichnis tiefer._
	Diese Variable braucht normal nicht geändert werden.
	
	Vorgabe: \
	`../`

RSYNCZIEL 
:	Zeilverzeichnis auf dem Server.
	Das Verzeichnis muss vorhanden und beschreibbar sein.
	
	Vorgabe: \
	`$(RSYNCUSER):~/www.it-bayer.de/`

RSYNCPARAMETER
:	Parameter für den rsync Lauf.
	Dieser Parameter braucht normal nicht geändert werden.
	
	Vorgabe: \
	`-e "ssh" --checksum -rlvzu --delete-excluded --exclude-from=$(RSYNCEXCLUDE)`


