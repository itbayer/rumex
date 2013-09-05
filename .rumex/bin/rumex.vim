"
" .../.rumex/bin/rumex.vim
"
" start (g)vim aus dem .rx Verzeichnis mit 
"    gvim -S ../.rumex/bin/rumex.vim 
" oder mit der ../.rumex/bin/rumex.sh
"

" Nach dem Schreiben Konfiguration einlesen; wird hier nicht verwendet.
"autocmd! bufwritepost ~/Arbeitsfläche/test.vim source %


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
set spell
set spelllang=de
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
map <Leader>rmk i## Kommentare<cr><cr><a class="moot" href="https://moot.it/i/<C-R>=mootit_konto<cr>/blog/<C-R>=expand("%:r")<cr>"></a>


" ----------------------------------------------------------
"  Kurztasten allgemein

" Speichern und html erstellen STRG+S
map <C-S> :w\|make html<CR><CR>
imap <C-S> <ESC>:w\|make html<CR><CR>


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

" vim:ft=vim: 
