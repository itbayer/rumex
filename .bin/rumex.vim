"
" ~/Arbeitsfläche/test.vim
"
" ...start (g)vim mit vim -S test.vim 
"

"autocmd! bufwritepost ~/Arbeitsfläche/test.vim source %


" -------------------------------------------------------------
"  Taste für eine Befehlserweiterung
"  siehe Tabs 
"  let mapleader=","


set modeline

" -------------------------------------------------------------
" Suche erweitern / umschreiben
set incsearch " inkrementelle Suche aktivieren. Bei der Suche werden die
              " gefundenen Zeichen gleich hervorgehoben.
set ic " Groß-/Kleinschreibung bei der Suche ignorieren
set hlsearch " Suche Farblich hervorheben

" Rumex Menü
menu Rumex.NeueDatei ,rnd
menu Rumex.NeuerNews\ Eintrag j,rnn
menu Rumex.Vim\ Konfiguration\ Neu\ einlesen :so %<CR>


" Abkürzungen
abb test Ich bin nur eine Testzeile

" -----------------------------------------------------------
" Kurztasten
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% NAME<CR>%<CR>%<CR><CR><CR><!--<CR><CR># NAME<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg

" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht{.nn1}<CR><CR><!--<CR>\| Link: http://was.auch.immer/<CR>\| Autor: IT-Bayer<CR>\| Kategorie: Neues<CR>\| Datum: <ESC>:r!date -R<CR>kjA<CR>--><CR><CR>Ab hier geht die neue Nachricht los.<ESC>10k0


