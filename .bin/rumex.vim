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

" ---------------------------------------------------------
" Rumex Menü
menu Rumex.NeueDatei<Tab>,rnd ,rnd
menu Rumex.NeuerNews\ Eintrag<Tab>j,rnn j,rnn
menu Rumex.-------------------show------------------------- :
menu &Rumex.show<Tab>:make\ show :make show&<CR><CR>
menu Rumex.showwww<Tab>:make\ showwww :make showwww&<CR><CR>
menu Rumex.-------------------make------------------------- :
menu <silent> Rumex.make.html :make html<CR><CR>
menu Rumex.make.bilder :make bilder<CR>
menu Rumex.make.rss :make rss<CR>
menu Rumex.make.suche :make suche<CR>
menu Rumex.make.index :make index<CR>
menu Rumex.make.sitemap :make sitemap<CR>
menu Rumex.make.--------all------- : 
menu Rumex.make.all :make all<CR>
menu Rumex.make.online :make online<CR>
menu Rumex.make.------sauber------ :
menu Rumex.make.clean.Bilder :make bclean<CR>
menu Rumex.make.clean.HTML :make hclean<CR>
menu Rumex.make.clean.XML :make xclean<CR>
menu Rumex.make.clean.alles :make clean<CR>
menu Rumex.-----------------config--------------------------- :
menu Rumex.Vim\ Konfiguration\ Neu\ einlesen :unmenu Rumex<CR>:so %<CR>

" Abkürzungen
abb test Ich bin nur eine Testzeile

" -----------------------------------------------------------
" Kurztasten
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% NAME<CR>%<CR>%<CR><CR><CR><!--<CR><CR># NAME<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg

" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht{.nn1}<CR><CR><!--<CR>\| Link: http://was.auch.immer/<CR>\| Autor: IT-Bayer<CR>\| Kategorie: Neues<CR>\| Datum: <ESC>:r!date -R<CR>kjA<CR>--><CR><CR>Ab hier geht die neue Nachricht los.<ESC>10k0


