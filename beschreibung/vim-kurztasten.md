Alle Rumex Kurztasten, für den Editor VIM, beginnen mit einem `,r`[^ausnahmen].
Für die Bedienung von Rumex braucht mein nur ein paar. Viele der
Kurztasten beinhalten eine Kombination einzelner Kurztasten bzw.
Befehle.

[^ausnahmen]: Ausnahmen bestätigen die Regel. So wurde für die zwei spaltige
    Darstellung\
    `,spn2` verwendet.

Am Anfang ist es sicher einfacher GVIM zu verwenden, da hier ein Menü
eingebaut ist welches unter anderem auch die Kurztasten anzeigt.

Wer jedoch mit der
[tilda](beschreibung.html#homepage-änderung-schnell-und-immer-aktuell)
Unterstützung arbeitet sollte sich schon ein paar Kurztasten einprägen.

Textbausteine
=============

Mittels dieser Kurztasten können Textbausteine eingebunden werden.

`,rnd` (RumexNeueDatei)
-----------------------

Erstellt ein neues Datei Gerüst. Dabei wird der Dateiname gleich mit
eingebunden.

**So schaut’s aus**

    % vim-kurztasten
    %
    %


    <!--

     [vim-kurztasten](vim-kurztasten.html)
     =======================================================

    Vortext INDEX

    -->

    Vortext INDEX und SEITE

    <!-- schnipp -->

    TEXT DER SEITE

    <!-- vim: set ft=pandoc: -->

`,rnn` (RumexNeueNachricht)
---------------------------

Erstellt einen neuen News Eintrag. Diese Kurztaste macht eigentlich nur
in der Datei `rss.rx0x` Sinn. Das Datum hinter dem Titel, Überschrift 1,
wird von Rumex gesetzt, ist also immer die aktuelle Systemzeit beim
ausführen von `,rnn`.

     # Neue Nachricht <!-- 2013/11/10 00:30 -->

    <!--
    !> Link: http://www.it-bayer.de/rumex/
    !> Autor: IT-Bayer
    !> Kategorie: Neues
    -->

    Ab hier geht die neuen Nachricht los.

`,rwl` (RumexWeiterLeitung)
---------------------------

Erstellt einen neue Weiterleitungsseite.

**So schaut’s aus**

    % Weiterleitung nach ....html
    %
    %


    <script language="javascript">
    <!--
    //window.location.href="....html";
    // -->
    </script>

Anmerkung: Die Zeile `window.location.href=....html;` wurde hier
Kommentiert da sonst die javascript Weiterleitung greift. Normalerweise
findet man kein `//` vor der Zeile `window.location.href=....html`.

`,rmk` (RumexMootitKommentar)
-----------------------------

Erstellt einen Moot.it Kommentar Abschnitt. Als Kennzeichnung wird der
Dateiname ohne `rx??` eingebaut / angehängt.

     # Kommentare

    <a class="moot" href="https://moot.it/i/rumex/blog/vim-kurztasten"></a>

`,rnb` (RumexNeuenweBlog)
-------------------------

Erstelle einen neuen Weblog Eintrag.

     # Rumex WebLog

    _am 09.09.2013 um 15:21 schrieb IT-Bayer_

    Text für den Eintrag

    <div class="weblog">
    Text der vorerst ausgeblendet ist.
    </div>

Git Kommandos
=============

`,rgp` (RumexGitPull)
---------------------

Git pull

`,rgs` (RumexGitStatus)
-----------------------

Git status

Text Formatierung
=================

`,rff` (RumexFormatFett)
------------------------

Markierte Textstelle fett darstellen

`,rfk` (RumexFormatKursiv)
--------------------------

Markierte Textstelle kursiv darstellen

`,rfl` (RumexFormatListe)
-------------------------

Markierte Zeilen in eine Liste wandeln

`,rfn` (RumexFormatNummernliste)
--------------------------------

Markierte Zeile in eine Nummernliste wandeln

`,rfb` (RumexFormatBlock)
-------------------------

Markierte Zeile in einen Block wandeln

,rfc
:   Markierte Zeile als Code darstellen

,spn2
:   Text mit 2er Spalten Formatierung umschließen

,spn3
:   Text mit 3er Spalten Formatierung umschließen

,spn4
:   Text mit 4er Spalten Formatierung umschließen

Make Befehle
============

`,rma` (RumexMakeAll)
---------------------

Speichert alle offenen Dokumente und erstellt daraus die HTML Datei.

`,rmb` (RumexMakeBild)
----------------------

Erstellt die unterschiedlichen Bildgrößen

`,rmca` (RumexMakeCleanAll)
---------------------------

Löscht alle html Dateien, alle Bildergrößen und alle xml Dateien.
beinhaltet die drei Befehle `make bclean`, `make hclean`, `make xclean`.

`,rmcb` (RumexMakeCleanBilder)
------------------------------

Löscht alle Bildgrößen aus dem `bilder/` Verzeichnis. Es werden nur die
Bilder gelöscht die von Rumex erstellt wurden siehe `make bilder`.

`,rmch` (RumexMakeCleanHtml)
----------------------------

Löscht alle `.html` Dateien die von Rumex erstellt wurden.

`,rmcx` (RumexMakeCleanXml)
---------------------------

Löscht alle `.xlm` Dateien die von Rumex erstellt wurden.

`,rmcf5` (RumexMakeCleanF8htm)
------------------------------

Löscht alle `.htm` Dateien die mittels der Gvim Taste F5, siehe [HTML
und PDF Dateine mit pandoc und gvim
erstellen](http://www.it-bayer.de/rumex/statik/index.htm), erstellt
wurden.

`,rmh` (RumexMakeHtml)
----------------------

Erstellt die `.html` Dateien.

`,rmi` (RumexMakeIndex)
-----------------------

Erstellt die index Datei.

`,rmm` (RumexMakesiteMap)
-------------------------

Erstellt die sitemap Datei.

`,rmo` (RumexMakeOnline)
------------------------

Speichert alle Dateien und stellt diese online.

`,rmr` (RumexMakeRss)
---------------------

Erstellt die rss Datei.

`,rms` (RumexMakeSuche)
-----------------------

Erstellt die Rumex Suche, bzw. die Dateiliste die für die Suche
verwendet werden soll.

Vorschau
========

`,rsf` (RumexShowFile)
----------------------

Zeigt eine Vorschau der Seite der Datei `file:///` im Standardbrowser.

`,rsw` (RumexShowWww)
---------------------

Zeigt eine Vorschau der Seite **Online** im Standardbrowser.

`,rsl` (RumexShowLocal)
-----------------------

Zeigt eine Vorschau der Seite auf dem eigenen Rechner. Diese Kurztaste
kann aber nur verwendet werden wenn auf dem Rechner der Apache
installiert und entsprechend eingerichtet ist.

Sonstiges
=========

`,rku`
------

Öffnet das Unterverzeichnis `.rx` in einem neuen VimTab Fenster. Keine
Ahnung warum ich diese Kurztaste so benannt habe.

`,ros` (RumexOpenStart)
-----------------------

Öffnet die `start.rx0s` in einen neuen VIM Tab Fenster.

`,ror` (RumexOpenRss)
---------------------

Öffnet die `rss.rx0x` in einen neuen VIM Tab Fenster.

