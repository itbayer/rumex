RSS Feed Funktion
=================

TODO

Wird nicht aus den einzelnen Dateien erstellt sondern muss manuell
editiert werden, Datei `.rx/rss.rx0x`.

Jede Überschrift eines Eintrags muss mit einem `{.nn1}` enden.

Danach kommen die Angaben zu:

**Link:** *Verweis zur Seite mit weiteren Informationen*\
**Autor:** *Autor der den Eintrag geschrieben hat*\
**Kategorie:** *Kategoie des Eintrags*\
**Datum:** *Datum des Eintrags.* Das richtige Format bekommt man mit dem
Befehl `date -R`.

die in HTML Kommentar Marker eingeschlossen sind.

Anschließend folgt die Meldung. Zur Zeit werden folgende `pandoc`
Formatierungen unterstützt.

-   Überschriften ab der Stufe 3 `###`

-   Aufzählungen `-`

-   Aufzählungen `*`

-   Zitate `>`

-   Links `[Link](http://muster.tdl)`. Diese dürfen nicht am Anfang
    einer Zeile stehen.

-   Bilder `![Bild](../bilder/muster.png muster.png)`, Diese dürfen
    nicht am Anfang einer Zeile stehen.

-   Code \`Code\`.

Beispiel einer RSS Feed Seite
-----------------------------

RSS Dateiname
-------------

Der Dateiname ist mit `rss.xml` vorbelegt und kann über die Variable
`RSS_FILE` in der `config.md` geändert werden.

RSS Titel
---------

Der Title des RSS Feed wird durch die Variable `RSS_TITEL` angepasst.

    RSS_TITEL = "Neuigkeiten von rumex Baukasten"

RSS auslagern
-------------

Den RSS Link kann man auch auslagern so dass dieser auf eine andere
Seite zeigt. Dazu setzt man die Variable `RSS_EXTERN` mit dem
entsprechenden Link. Die Variabel `RSS_FILE` wird dadurch nicht mehr
verwendet. Auch der RSS Lauf wird dadurch ausgeschaltet und durch eine
Meldung ersetzt.

RSS Kurztaste
-------------

Für die einzelnen Einträge steht auch eine Kurztaste `.rnn` zur
Verfügung.\
In Gvim unter

    Rumex -> TextBausteine -> NeuerNews Eintrag

Eingefügt wird dann folgende Vorgabe. Der Wert hinter Datum wird von
System ausgelesen und entsprechende gesetzt.

     # Neue Nachricht{.nn1}

    <!--
    | Link: http://www.it-bayer.de/rumex/
    | Autor: IT-Bayer
    | Kategorie: Neues
    | Datum: Mon, 28 Oct 2013 07:36:56 +0100
    -->

    Ab hier geht die neue Nachricht los.

Interna
-------

Durch die beschriebenen RSS Variablen wird die Erstellung des RSS Feed
gesteuert. Es wird in jede HTML Datei nachfolgender Header Abschnitt
eingebaut wenn die `RSS_TITLE` Variable gesetzt wurde. `RSS_FILE` bzw.
`RSS_EXTERN` steuern den `href` Eintrag.
