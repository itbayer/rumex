% HTML und PDF Dateine mit pandoc und gvim erstellen
% Stefan Blechschmidt
% Oktober 2013


Vorwort
=======

Rumex verwendet pandocs markdown weil man damit sehr einfach und schnell Text erstellen 
und verschiedenen Formate wandeln kann.
Dieses kann man aber auch für Beschreibungen auf dem Rechner verwenden.
Abgesehen habe ich es bei dieser Beschreibung auf die Formate `html` 
und `pdf`.


Formate erstellen
=================

Hat man einen Text erstellt reicht ein

	pandoc -f markdown -t html5 --toc -s -o test.html test.md

um daraus ein `HTML` Datei zu erstellen.
Für PDF verwendet man den  Befehl

	pandoc -f markdown -t latex --toc -V lang=ngermanb -o test.pdf test.md

Dabei ist der Parameter `--toc` für die Anzeige des Inhaltsverzeichnis zuständig.



Gvim Kurztaste
==============

Fehlt noch die gvim Kurztaste um diese beiden Formate zu erstellen.
Da die Unterstützung nur für gvim taugen soll werden die benötigten 
Befehle in die Datei `~/.gvimrc` geschrieben.
Somit stehen sie nicht nur unter Rumex sonder Systemweit zur Verfügung.

Verwendet werden, in diesem Beispiel, die Tasten F8 und F9 
Die die aktuelle Datei speichert und in das entsprechende Format umwandelt.

F8 für HTML und F9 für das PDF Format.
Ausserdem werden noch die zwei Tasten CTRL-F8 und CTRL-F9 für die Anzeige 
konfiguriert wobei zathura[^zathura] für die PDF Anzeige verwendet wird.

[^zathura]: Zathura wurde deshalb gewählt weil dieses Programm ähnlich wie vi
über die Tastatur bedient werden kann.

Nachfolgende Zeilen einfach in die `~/.gvimrc` Datei kopieren
und fertig ist diese Anpassung.

~~~
" HTML Datei erstellen
map <F8> :w<cr>:!pandoc -f markdown -t html5 --toc -s -o <C-R>=expand("%:r")<CR>.html %<CR><CR>
" HTML Datei anzeigen
map <C-F8> :!x-www-browser %.html&<CR><CR>


" PDF Datei erstellen
map <F9> :w<cr>:!pandoc -f markdown -t latex --toc -V lang=ngermanb -o <C-R>=expand("%:r")<CR>.pdf %<CR><CR>
" PDF Datei anzeigen
map <C-F9> :!zathura %.pdf&<CR><CR>
~~~


----

Die PDF Datei dieser Beschreibung kann man sich [hier](index.pdf) ansehen.
Die Markdown Quelldatei kann man sich [hier](index.md) holen.


Rumex?
======

In Rumex kann man diese Funktion natürlich auch verwenden.
Am besten erstellt man sich dazu ein eigenes Unterverzeichnis und
erstellt dort die die Datei `index.md` mit den Texten.










