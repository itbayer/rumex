#-----------------------------------------------------------------------
# .rx/config.mk
#
# SEITEN EINSTELLUNG :: Bitte anpassen!
#
# Weitere Einstellungen findet man in der 
# ../.rumex/makefile/config.mk
# 
#-----------------------------------------------------------------------


#-----------------------------------------------------------------------
# URL der Seite : ohne abschließenden /
#-----------------------------------------------------------------------
URL = "http://www.it-bayer.de/rumex"


#-----------------------------------------------------------------------
# Überschrift der index Seite
#-----------------------------------------------------------------------
INDEX_TITEL = "IT Bayer's rumex <sup style=\"font-size: .4em;\">(github.com Version)</sup>"


#-----------------------------------------------------------------------
# RSS Überschrift (HTML) @fixme template.html
#-----------------------------------------------------------------------
RSS_TITEL = "Neuigkeiten von rumex Baukasten"


#-----------------------------------------------------------------------
#  Autor Einträge
#-----------------------------------------------------------------------
WEBLOGAUTOR = "IT-Bayer"
INDEX_AUTOR = "Stefan Blechschmidt"


#-----------------------------------------------------------------------
# Autor Angaben für den HTML Kopf DC.META.Format
#-----------------------------------------------------------------------
META_PUBLISHER = "IT-Bayer"
META_CREATOR = "IT-Bayer (Stefan Blechschmidt)"


#-----------------------------------------------------------------------
# Bildname für das Seitenbanner
#-----------------------------------------------------------------------
SEITENBANNER = "rxtpl/img/rumex.png"


#-----------------------------------------------------------------------
# Schalter ob das externe Tool von moot.it eingebunden werden soll
# Man muss hier den Kontonamen angeben..
# Wird moot.it nicht verwendet, den Parameter kommentieren. 
#-----------------------------------------------------------------------
MOOTIT = "rumex"

# FIXME :: wird wahrscheinlich nicht mehr gebraucht, wurde
# 			ersetzt durch sitecopy
#-----------------------------------------------------------------------
# FTP URL / Zugangsdaten. Ist diese Variabel gesetzt wird das 
# Programm wput bzw. bin/wput.sh verwendet um die Daten auf
# den Server zu laden. 
# Dazu muss sich auch das Programm wput auf dem Rechner befinden.
# 
# Wenn die Variabel kommentiert ist (Standard)
# wird git verwendet.
#-----------------------------------------------------------------------
#
# FTP = "ftp://USER:PASS@SERVER:PORT/WWW_DIR/"


