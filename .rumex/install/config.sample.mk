# #############################################
# .rumex/user/config.makefile
#
# SEITEN EINSTELLUNG :: Bitte anpassen!
#
# #############################################

# URL der Seite : ohne abschließenden /
URL="http://www.it-bayer.de/rumex"

# Überschriften für die Index Seite
U1="IT Bayer's rumex"
U2="Der(Ein) HomePage Sand(Bau)kasten" 
U3="github.com Version"

# RSS Überschrift
RSS_TITEL = "Neuigkeiten von rumex Baukasten"

# CSS
CSSALL = "rxtpl/css/all.css"
CSSSCREEN = "rxtpl/css/screen.css"
CSSPRINT = "rxtpl/css/print.css"

# Bild für das Seitenbanner
SEITENBANNER = "rxtpl/img/rumex.png"


# Schalter ob das externe Tool von moot.it eingebunden werden soll
# ... wenn nicht einen leeren Parameter definieren.
MOOTIT = "rumex"

# Rumexsuche
RUMEXSUCHE = "rxtpl/js"


# ##############################################################
# FTP URL / Zugangsdaten. Ist diese Variabel gesetzt wird das 
# Programm wput bzw. bin/wput.sh verwendet um die Daten auf
# den Server zu laden. 
# Dazu muss sich auch das Programm wput auf dem Rechner befinden.
# 
# Wenn die Variabel kommentiert ist (Standard)
# wird git verwendet.
#
# FTP = "ftp://USER:PASS@SERVER:PORT/WWW_DIR/"


