"
" .../.rumex/bin/rumex.vim
"
" start (g)vim aus dem .rx Verzeichnis mit 
"    gvim -S ../.rumex/bin/rumex.vim 
" oder mit der ../.rumex/bin/rumex.sh
"




" =============================================================
" Einstellungen die eigentlich in der.vimrc stehen.
" Darum sind diese auch hier kommentiert.
" =============================================================

" -------------------------------------------------------------
" pathogen starten
" pathogen ist ein Programm das Plugins automatisch einbindet.
" Dazu werden die Plugins in einem extra Verzeichnis "bundle"
" gespeichert.
" Das Schöne daran, die Plugins können direkt vom githup per clone
" in das Verzeichnis gelegt werden.
"  call pathogen#infect()

" ==============================================================
" ENDE .vimrc Vorlage
" ==============================================================


" -------------------------------------------------------------
"  Syntax Farbig machen
syntax on

" -------------------------------------------------------------
" Zeilennummern anzeigen
set nu

" -------------------------------------------------------------
" öffnende und schließende Klammern hervorheben
set showmatch

" -------------------------------------------------------------
" Vim Modus statt Vi Modus verwenden
set nocompatible





" -------------------------------------------------------------
"  Taste für eine Befehlserweiterung
"  siehe Tabs 
let mapleader=","

" Vim Konfiguration am Ende der Datei verwenden
set modeline




" -------------------------------------------------------------
" Suche erweitern / umschreiben
set incsearch " inkrementelle Suche aktivieren. Bei der Suche werden die
              " gefundenen Zeichen gleich hervorgehoben.
set ic " Groß-/Kleinschreibung bei der Suche ignorieren
set hlsearch " Suche Farblich hervorheben




"---------------------------------------------------------
" Rechtschreibung einschalten (Deutsch)
set spelllang=de
set spell
" Darstellung falscher Wörter für die Konsole (tilda) anpassen.
hi SpellBad term=reverse cterm=underline ctermbg=7 ctermfg=1 gui=undercurl guisp=Red
" Darstellung für klein geschriebene Wörter die nach einem Satzende kommen.
hi SpellCap term=reverse cterm=underline ctermbg=7 ctermfg=4 gui=undercurl guisp=Blue


" -----------------------------------------------------------
" Abkürzungen
abb rumexis Rumex mit is




" -----------------------------------------------------------
" Kurztasten für die Seitenerstellung
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% <C-R>=expand("%:r")<CR><CR>%<CR>%<CR><CR><CR><!--<CR><CR>[<C-R>=expand("%:r")<CR>](<C-R>=expand("%:r")<CR>.html)<CR>=======================================================<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg


" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht <!-- <ESC>:r!date -R<CR>kJA --><CR><CR><!--<CR>!> Link: http://?????????<CR>!> Autor: ?????????<CR>!> Kategorie: Neues<CR>--><CR><CR>Ab hier geht die neuen Nachricht los.<ESC>8k02l


" Neue Weiterleitungsseite mit <Leader>rwl (RumexWeiterLeitung)
map <Leader>rwl i% Weiterleitung nach ....html<CR>%<CR>%<CR><CR><CR><script language="javascript"><CR><!--<CR>window.location.href="....html";<CR>// --><CR></script><CR><CR><noscript><CR><p>Die Seite ist umgezogen und ist nun &uuml;ber<CR><a href="....html">diesen Link</a><CR>erreichbar.<p><CR></noscript><ESC>15k11l


" Kommentar Zeile einfügen mit <Leader>rmk (RumexMootKommentar)
map <Leader>rmk i# Kommentare<cr><cr><a class="moot" href="https://moot.it/i/<C-R>=mootit_konto<cr>/blog/<C-R>=expand("%:r")<cr>"></a>


" Weblog Abschnitt einfuegen (RumexNewweBlog)
map <Leader>rnb i# Rumex WebLog<CR><ESC>:r! date +"Am \%d.\%m.\%Y um \%H:\%M schrieb"<CR>I_<ESC>A <C-R>=weblog_autor<CR>_<CR><CR>Text für den Eintrag<CR><CR><div class="weblog"><CR>Text der vorerst ausgeblendet ist.<CR></div><CR><ESC>9k02l




" ----------------------------------------------------------
"  Kurztasten allgemein

"	Datei Speichern und html erstellen STRG+S
" gvim Zuordnung, funktioniert unter vim (Konsole) nicht, siehe unten.
map <C-S> :w<CR>:make html<CR><CR><CR>
imap <C-S> <ESC>:w<CR>:make html<CR><CR><CR>
"
"	Ausgeschaltet Funktionstasten werden für die Statik 
" Funktion verwendet.
" <F5> für vim bereitstellen. Macht das selbe wie <C-S> 
" weil <C-S> unter vim nicht funktioniert, 
" diese Tastenkombination ist dem Terminal zugeordnet.
" Infolink: http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
"map <F5> :w<CR>:make html<CR><CR><CR>
"imap <F5> <ESC>:w<CR>:make html<CR><CR><CR>


" Rumex Verzeichnis .rx anzeigen
map <Leader>rku :tabnew<CR>:e ../.rx/.<CR>




" -----------------------------------------------------------
"  Kurztasten git

map <Leader>rgp :!git pull<CR>
map <Leader>rgs :!git status<CR>




" -----------------------------------------------------------
"  Kurztasten zur Text Formatierung

" Markierung Fett darstellen <Leader>rff (RumexFormatFett)
vmap <Leader>rff xi****<esc>2hp<esc>

" Markierung Kursiv darstellen <Leader>rfk (RumexFormatKursiv)
vmap <Leader>rfk xi__<esc>hp<esc>

" Markierte Zeilen in eine Liste wandeln <Leader>rfl (RumexFormatListe)
vmap <Leader>rfl :s/^/* /<CR>

" Markierte Zeilen in eine NummernListe wandeln <Leader>rfn (RumexFormatNummernliste)
vmap <Leader>rfn :s/^/#. /<CR>

" Markierte Zeilen in eine Block wandeln <Leader>rfb (RumexFormatBlock)
vmap <Leader>rfb :s/^/\| /<CR>

" Markierte Zeile als Code darstellen <Leader>rfc (RumexFormatCode)
vmap <Leader>rfc xi``<esc>hp<esc>

" CSS Text mit 2er Spalte umschliessen
vmap <Leader>spn2 xi<div class="spn2"><cr></div><!-- ENDE .spn2 Darstellung --><esc>P

" CSS Text mit 3er Spalte umschliessen
vmap <Leader>spn3 xi<div class="spn3"><cr></div><!-- ENDE .spn3 Darstellung --><esc>P

" CSS Text mit 4er Spalte umschliessen
vmap <Leader>spn4 xi<div class="spn4"><cr></div><!-- ENDE .spn4 Darstellung --><esc>P




" -----------------------------------------------------------
" Kurztasten make 

map <Leader>rma :wall<CR>:make all<CR>
map <Leader>rmb :make bilder<CR>
map <Leader>rmca :make clean<CR>
map <Leader>rmcb :make bclean<CR>
map <Leader>rmch :make hclean<CR>
map <Leader>rmcx :make xclean<CR>
map <Leader>rmcf5 :make statikclean<CR>
map <Leader>rmh :make html<CR>
map <Leader>rmi :make index<CR>
map <Leader>rmm :make sitemap<CR>
map <Leader>rmo :wall<CR>:make online<CR>
map <Leader>rmr :make rss<CR>
map <Leader>rms :make suche<CR>
 



" -----------------------------------------------------------
" Kurztasten show

map <Leader>rsf :make show&<CR><CR>
map <Leader>rsw :make showwww&<CR><CR>
map <Leader>rsl :make showlocal&<CR><CR>




" -----------------------------------------------------------
" Kurztasten öffnen

map <Leader>ros :tabnew<CR>:e start.rx0s<CR><CR>
map <Leader>ror :tabnew<CR>:e rss.rx0x<CR><CR>




" -----------------------------------------------------------
"  Rumex Twitter Unterstützung
"
" Nachricht an Twitter senden (RumexToTwitter)
"  Anmerkung: 
"    Bei dieser Kurztaste wurde auf das abschließende
"    <CR> verzichtete. Somit kann man noch die Nachricht,
"    vor dem Senden überprüfen und ggf. Editieren.
"    Zum Beispiel müssen ! vor dem Senden maskiert \! werden.
"
" Variante 1: 
"   Kopiert den Text und sendet diesen an Twitter
"   Unterstützt auch mehr als eine Zeile.
"vmap <Leader>rtt y:!twiet -ssl -status="<C-R>""
"
" Variante 2: 
"   Sendet den Text an Twitter und entfernt diesen
"   anschließend.
"   Diese Kurztaste hat den Nachteil das die Meldung in einer Zeile 
"   stehen muss.
"   Bei Meldungen aufgeteilt in zwei Zeilen wird nur die 
"   zweite Zeile gesendet.
"
"   Sun, 23 Mar 2014 18:16:43 +0100
"   Option -ssl eingebaut. 
"   TTYtter meldet *** server reports: 'SSL is required' 
vmap <Leader>rtt !twiet -ssl -script<CR>

" KurzLink erzeugen mit is.gd (RumexKürzeLink)
vmap <Leader>rkl x:r!echo "/sh <C-R>""\|twiet -script<CR>




" ---------------------------------------------------------------
"  Funktionstasten für die Statik Seiten


" ---------------------------------------------------------------
" HTML Datei ohne Inhaltsverzeichnis erstellen
"	--self-contained wurde raus genommen da dadurch die HTML
"	Datei unter Umständen sehr groß wird.
"	Außerdem werden die Bilder des Dokuments bei den Suchmaschinen
"	nicht mehr aufgenommen.
map <F5> :w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>
imap <F5> <ESC>:w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>

" HTML Datei mit Inhaltsverzeichnis bis Ebene 3 erstellen
map <S-F5> :w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --toc --toc-depth=3 --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>
imap <S-F5> <ESC>:w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --toc --toc-depth=3 --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>

" HTML Datei mit kompletten Inhaltsverzeichnis bzw. bis Ebene 5 erstellen,
"	da LaTeX auch nicht mehr Ebenen unterstützt und die Ausgabe Formate
"	annähernd identisch sein sollten.
map <A-F5> :w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --toc --toc-depth=5 --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>
imap <A-F5> <ESC>:w<CR>:!pandoc -f markdown -t html5 --bibliography=rumex.bib --csl=rumex.csl --toc-depth=5 --toc --css ../rxtpl/css/statik.css -s -o <C-R>=expand("%:r")<CR>.htm %<CR><CR>

" HTML Datei anzeigen
map <C-F5> :!x-www-browser <C-R>=expand("%:r")<CR>.htm&<CR><CR>




" --------------------------------------------------------------------
" PDF Datei ohne Inhaltsverzeichnis erstellen
map <F6> :w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>
imap <F6> <ESC>:w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>


" PDF Datei mit Inhaltsverzeichnis bis Ebene 3 erstellen
map <S-F6> :w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex --toc --toc-depth=3 -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>
imap <S-F6> :w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex --toc --toc-depth=3 -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>


" PDF Datei mit kompletten Inhaltsverzeichnis erstellen bzw. bis Ebene 5
"	da LaTeX nicht mehr Ebenen unterstützt.
map <A-F6> :w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex --toc --toc-dept=5 -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>
imap <A-F6> :w<CR>:!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t latex --toc --toc-depth=5 -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>


" PDF Datei anzeigen
map <C-F6> :!zathura <C-R>=expand("%:r")<CR>.pdf&<CR><CR>




" ---------------------------------------------------------------
" Rest erstellen: epub, mobi, odt 
map <F7> :w<CR>:!pandoc -f markdown -t epub --bibliography=rumex.bib --csl=rumex.csl -V lang=de_DE -s -o <C-R>=expand("%:r")<CR>.epub %<CR><CR> :!pandoc -f markdown --bibliography=rumex.bib --csl=rumex.csl -t odt -s -o <C-R>=expand("%:r")<CR>.odt %<CR><CR> :!ebook-convert <C-R>=expand("%:r")<CR>.epub <C-R>=expand("%:r")<CR>.mobi --output-profile=kindle<CR><CR>




" ---------------------------------------------------------------
" jabref starten
map <C-F7> :!jabref rumex.bib&<CR><CR>


" vim:ft=vim: 
