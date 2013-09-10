"
" .../.rumex/bin/rumex.vim
"
" start (g)vim aus dem .rx Verzeichnis mit 
"    gvim -S ../.rumex/bin/rumex.vim 
" oder mit der ../.rumex/bin/rumex.sh
"

" Nach dem Schreiben Konfiguration einlesen; wird hier nicht verwendet.
"autocmd! bufwritepost ~/Arbeitsfläche/test.vim source %




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

" -------------------------------------------------------------
"  Syntax Farbig machen
"  syntax on

" -------------------------------------------------------------
" Zeilennummern anzeigen
" set nu

" -------------------------------------------------------------
" öffnende und schließende Klammern hervorheben
" set showmatch

" -------------------------------------------------------------
" Vim Modus statt Vi Modus verwenden
" set nocompatible

" ==============================================================
" ENDE .vimrc Vorlage
" ==============================================================




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




" -----------------------------------------------------------
" Abkürzungen
abb rumexis Rumex mit is




" -----------------------------------------------------------
" Kurztasten für die Seitenerstellung
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% <C-R>=expand("%:r")<CR><CR>%<CR>%<CR><CR><CR><!--<CR><CR>[<C-R>=expand("%:r")<CR>](<C-R>=expand("%:r")<CR>.html)<CR>=======================================================<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg

" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht{.nn1}<CR><CR><!--<CR>\| Link: http://www.it-bayer.de/rumex/<CR>\| Autor: IT-Bayer<CR>\| Kategorie: Neues<CR>\| Datum: <ESC>:r!date -R<CR>kJA<CR>--><CR><CR>Ab hier geht die neue Nachricht los.<ESC>9k0

" Neue Weiterleitungsseite mit <Leader>rwl (RumexWeiterLeitung)
map <Leader>rwl i% Weiterleitung nach ....html<CR>%<CR>%<CR><CR><CR><script language="javascript"><CR><!--<CR>window.location.href="....html";<CR>// --><CR></script><ESC>9k13l

" Kommentar Zeile einfügen mit <Leader>rmk (RumexMootKommentar)
map <Leader>rmk i# Kommentare<cr><cr><a class="moot" href="https://moot.it/i/<C-R>=mootit_konto<cr>/blog/<C-R>=expand("%:r")<cr>"></a>

" Weblog Abschnitt einfuegen (RumexNewweBlog)
map <Leader>rnb i# Rumex WebLog<CR><ESC>:r! date +"am \%d.\%m.\%Y um \%H:\%M schrieb"<CR>I_<ESC>A <C-R>=weblog_autor<CR>_<CR><CR>Text für den Eintrag<CR><CR><div class="weblog"><CR>Text der vorerst ausgeblendet ist.<CR></div><CR><ESC>9k02l




" ----------------------------------------------------------
"  Kurztasten allgemein

" Speichern und html erstellen STRG+S
" gvim Zuordnung, funktioniert unter vim (Konsole) nicht, warum siehe unten.
map <C-S> :w<CR>:make html<CR><CR><CR>
imap <C-S> <ESC>:w<CR>:make html<CR><CR><CR>
" F11 macht das selbe weil C-S unter vim nicht funktioniert da diese
" Tastenkombination dem Terminal zugeordnet ist.
" Infolink: http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
map <F11> :w<CR>:make html<CR><CR><CR>
imap <F11> <ESC>:w<CR>:make html<CR><CR><CR>


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







" vim:ft=vim: 
