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



" ---------------------------------------------------------
" Menu Entwicklung
"
" Vim Konfiguration neu einlesen
menu &Rumex.Vim\ Konfiguration\ Neu\ einlesen :unmenu Rumex<CR>:so ../.rumex/bin/rumex.vim<CR>
" Versionsdatei öffnen
menu &Rumex.Versionsdatei\ öffnen :tabnew<CR>:e ../.rumex/default/version.txt<CR>

" ---------------------------------------------------------
" Rumex Menü
menu Rumex.-----------------Dateien\ öffnen----------------- :
menu &Rumex.&Öffnen.&Startseite<Tab>:e\ start\.rx0s :tabnew<CR>:e start.rx0s<CR><CR>
menu &Rumex.&Öffnen.&Newsseite\ (&RSS)<Tab>:e\ rss\.rx0x :tabnew<CR>:e rss.rx0x<CR><CR>

menu Rumex.-------------------textbaustein----------------- :
menu &Rumex.Text&Bausteine.\ Neues\ &Dateigerüst<Tab>,rnd ,rnd
menu &Rumex.Text&Bausteine.\ Neuen\ &News\ Eintrag<Tab>,rnn ,rnn
menu &Rumex.Text&Bausteine.\ Neuen\ &Weiterleitung<Tab>,rwl ,rwl
menu &Rumex.Text&Bausteine.\ moot\.it\ &Kommentar<Tab>,rmk ,rmk


menu Rumex.-------------------show------------------------- :
menu &Rumex.&show.&file<Tab>:make\ show :make show&<CR><CR>
menu &Rumex.&show.&www<Tab>:make\ showwww :make showwww&<CR><CR>
menu &Rumex.&show.&local<Tab>:make\ showllocal :make showlocal&<CR><CR>

menu Rumex.-------------------make------------------------- :
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
menu &Rumex.&Git.Änderungen\ &holen<Tab>:!git\ pull :!git pull<CR>
menu &Rumex.&Git.Änderungen\ &anzeigen<Tab>:!git\ status :!git status<CR>

menu Rumex.-----------------config--------------------------- :
menu &Rumex.&Konfiguration.User\ Verzeichnis<Tab>:e\ \.\./\.rx/. :tabnew<CR>:e ../.rx/.<CR>

menu Rumex.-----------------Formatierung----------------- :
vmenu &Rumex.&Formatierung.&Fett<Tab>,rff ,rff 
vmenu &Rumex.&Formatierung.&Kursiv<Tab>,rfk ,rfk 
vmenu &Rumex.&Formatierung.&Liste<Tab>,rfl ,rfl 
vmenu &Rumex.&Formatierung.&Nummernliste<Tab>,rfn ,rfn 
vmenu &Rumex.&Formatierung.&Block<Tab>,rfb ,rfb 
vmenu &Rumex.&Formatierung.&Code<Tab>,rfc ,rfc

" -----------------------------------------------------------
" Abkürzungen
abb rumexis Rumex mit is

" -----------------------------------------------------------
" Kurztasten für die Seitenerstellung
"
" Neue Datei mit <Leader><rnd> (RumexNeueDatei)
map <Leader>rnd i% NAME<CR>%<CR>%<CR><CR><CR><!--<CR><CR># NAME<CR><CR>Vortext INDEX<CR><CR>--><CR><CR>Vortext INDEX und SEITE<CR><CR><!-- schnipp --><CR><CR>TEXT DER SEITE<CR><CR><!-- vim: set ft=pandoc: --><ESC>gg

" Neuer NEWS Eintrag mit <Leader><rnn> (RumexNeuNews)
map <Leader>rnn i# Neue Nachricht{.nn1}<CR><CR><!--<CR>\| Link: http://www.it-bayer.de/rumex/<CR>\| Autor: IT-Bayer<CR>\| Kategorie: Neues<CR>\| Datum: <ESC>:r!date -R<CR>kJA<CR>--><CR><CR>Ab hier geht die neue Nachricht los.<ESC>9k0

" Neue Weiterleitungsseite mit <Leader>rwl (RumexWeiterLeitung)
map <Leader>rwl i% Weiterleitung nach ....html<CR>%<CR>%<CR><CR><CR><script language="javascript"><CR><!--<CR>window.location.href="....html";<CR>// --><CR></script><ESC>9k13l

" Kommentar Zeile einfügen mit <Leader>rmk (RumexMootKommentar)
map <Leader>rmk i## Kommentare<cr><cr><a class="moot" href="https://moot.it/i/<C-R>=mootit_konto<cr>/blog/<C-R>=expand("%:r")<cr>">



" -----------------------------------------------------------
"  Kurztasten für die Text Formatierung

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

" vim:ft=vim: 
