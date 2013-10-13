% HTML und PDF Dateine mit pandoc und gvim erstellen
% Stefan Blechschmidt
% Oktober 2013




Vorwort
=======

Rumex verwendet pandocs markdown weil man damit sehr einfach und schnell Text erstellen 
und verschiedenen Formate wandeln kann.
Diese Funktion kann man aber auch für Beschreibungen auf dem Rechner verwenden.
Abgesehen habe ich es bei dieser Beschreibung auf die Formate `html` 
und `pdf`.




Formate erstellen
=================

Hat man einen Text erstellt reicht ein

	pandoc -f markdown -t html5 --toc -s -o test.html test.md

um daraus ein `HTML` Datei zu erstellen.
Für PDF[^pdf] verwendet man den  Befehl

	pandoc -f markdown -t latex --toc -V lang=ngermanb -o test.pdf test.md

Dabei ist der Parameter `--toc` für die Anzeige des Inhaltsverzeichnis zuständig.

[^pdf]: Für das Erstellen des PDF Formats muss jedoch LaTeX 
auf dem System installiert werden.

Fehlen noch die Editor Kurztaste um diese beiden Formate mit einem 
Tastendruck erstellen zu können.




Gvim Kurztaste
==============

Da die Unterstützung nur für gvim aber auch ausserhalb
Rumex funktionieren soll werden die benötigten 
Befehle in die Datei `~/.gvimrc` geschrieben und an Kurztasten
gebunden.

Verwendet werden, in diesem Beispiel die Tasten F8 und F9.
F8 für HTML und F9 für das PDF Format.
Ausserdem werden noch die zwei Tasten ALT-F8 und ALT-F9 für die Anzeige 
konfiguriert wobei zathura[^zathura] für die PDF Anzeige verwendet wird.

[^zathura]: Zathura wurde deshalb gewählt weil dieses Programm ähnlich wie vi
über die Tastatur bedient werden kann.

Nachfolgende Zeilen einfach in die `~/.gvimrc` Datei kopieren
und fertig ist diese Anpassung.

~~~
" HTML Datei erstellen
map <F8> :w<cr>:!pandoc -f markdown -t html5 --toc -s -o <C-R>=expand("%:r")<CR>.html %<CR><CR>
" HTML Datei anzeigen
map <A-F8> :!x-www-browser <C-R>=expand("%:r")<CR>.html&<CR><CR>


" PDF Datei erstellen
map <F9> :w<cr>:!pandoc -f markdown -t latex --toc -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>
" PDF Datei anzeigen
map <A-F9> :!zathura <C-R>=expand("%:r")<CR>.pdf&<CR><CR>
~~~




Rumex?
======

In Rumex kann man diese Funktion natürlich auch verwenden.
Am besten erstellt man sich dazu ein eigenes Unterverzeichnis und
erstellt dort die Datei `index.md` mit den Texten.




----

Die PDF Datei dieser Beschreibung kann man sich [hier](index.pdf) ansehen.
Die Markdown Quelldatei kann man sich [hier](index.md) holen.







