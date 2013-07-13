"
" .../.bin/rumex.vim
"
" start (g)vim aus dem .rumex Verzeichnis mit 
"    gvim -S ../.bin/rumex.vim 
" oder mit der ../.bin/rumex.sh
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


" ---------------------------------------------------------
" Rumex Menü
menu &Rumex.Öffne\ &Startseite<Tab>:e\ start\.rx0s :tabnew<CR>:e start.rx0s<CR><CR>
menu &Rumex.Öffne\ Newsseite\ (&RSS)<Tab>:e\ rss\.rx0x :tabnew<CR>:e rss.rx0x<CR><CR>
menu &Rumex.-------------------textbaustein----------------- :
menu &Rumex.Einfügen\ Neues\ &Dateigerüst<Tab>,rnd ,rnd
menu &Rumex.Einfügen\ Neuen\ &News\ Eintrag<Tab>,rnn ,rnn
menu &Rumex.Einfügen\ Neuen\ &Weiterleitungs\ Eintrag<Tab>,rwl ,rwl
menu &Rumex.-------------------show------------------------- :
menu &Rumex.&show<Tab>:make\ show :make show&<CR><CR>
menu &Rumex.show&www<Tab>:make\ showwww :make showwww&<CR><CR>
menu &Rumex.-------------------make------------------------- :
menu &Rumex.&make.html<Tab>:make\ html :make html<CR><CR>
menu &Rumex.&make.bilder<Tab>:make\ bilder :make bilder<CR>
menu &Rumex.&make.rss<Tab>:make\ rss :make rss<CR>
menu &Rumex.&make.suche<Tab>:make\ suche :make suche<CR>
menu &Rumex.&make.index<Tab>:make\ index :make index<CR>
menu &Rumex.&make.sitemap<Tab>:make\ sitemap :make sitemap<CR>
menu Rumex.make.--------make_all------- : 
menu &Rumex.&make.&all<Tab>:make\ all :make all<CR>
menu &Rumex.&make.&online<Tab>:make\ online :make online<CR>
menu Rumex.make.------make_sauber------ :
menu &Rumex.&make.&clean.&Bilder<Tab>:make\ bclean :make bclean<CR>
menu &Rumex.&make.&clean.&HTML<Tab>:make\ hclean :make hclean<CR>
menu &Rumex.&make.&clean.&XML<Tab>:make\ xclean :make xclean<CR>
menu &Rumex.&make.&clean.&alles<Tab>:make\ clean :make clean<CR>
menu Rumex.-----------------git--------------------------- :
menu &Rumex.Änderungen\ &holen<Tab>:!git\ pull :!git pull<CR>
menu &Rumex.Änderungen\ &anzeigen<Tab>:!git\ status :!git status<CR>
menu Rumex.-----------------config--------------------------- :
menu Rumex.Öffne\ User\ Konfiguration<Tab>:e\ \.\./\.bin/user\.config\.makefile :tabnew<CR>:e ../.bin/user.config.makefile<CR>
menu Rumex.Öffne\ System\ Konfiguration<Tab>:e\ \.\./\.bin/sys\.config\.makefile :tabnew<CR>:e ../.bin/sys.config.makefile<CR>
menu Rumex.-----------------config-einelesen----------------- :
menu Rumex.Vim\ Konfiguration\ Neu\ einlesen :unmenu Rumex<CR>:so ../.bin/rumex.vim<CR>

" Abkürzungen
abb rumexis Rumex mit is

" -----------------------------------------------------------
" Kurztasten
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% NAME<CR>%<CR>%<CR><CR><CR><!--<CR><CR># NAME<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg

" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht{.nn1}<CR><CR><!--<CR>\| Link: http://www.it-bayer.de/rumex/<CR>\| Autor: IT-Bayer<CR>\| Kategorie: Neues<CR>\| Datum: <ESC>:r!date -R<CR>kJA<CR>--><CR><CR>Ab hier geht die neue Nachricht los.<ESC>9k0

" Neue Weiterleitungsseite mit <Leader>rwl (RumexWeiterLeitung)
map <Leader>rwl i% Weiterleitung nach ....html<CR>%<CR>%<CR><CR><CR><script language="javascript"><CR><!--<CR>window.location.href="....html";<CR>// --><CR></script><ESC>9k13l


" vim:ft=vim: 
