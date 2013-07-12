# #############################################
# user.config.makefile
#
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

# ##############################################################
# FTP URL / Zugangsdaten. Ist diese Variabel gesetzt wird das 
# Programm wput bzw. bin/wput.sh verwendet um die Daten auf
# den Server zu laden. Wenn die Variabel kommentiert ist (Standard)
# wird git verwendet.
#
# FTP = "ftp://USER:PASS@SERVER:PORT/WWW_DIR/"

# ##############################################################
# HTML Template 
HTML_TEMPLATE = ../.inc/static/html.template
KOPF_TEMPLATE = ../.inc/static/kopf.html
HEADER_TEMPLATE = ../.inc/static/header.html
FUSS_TEMPLATE = ../.inc/static/fuss.html 

