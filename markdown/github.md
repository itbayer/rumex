% Deine Internetseite auf Github
% Der Notizzettel vom IT Bayern
%

<!--

# Github

Kleine Beschreibung, oder besser gesagt mein Notizzettel
wie man auf <http://github.com> eine Internetseite einrichtet.

-->

<!-- schnipp -->


Mit github ist es möglich eine Internetseite zu erstellen.
Hier gibt es zwei Varianten. 

1. Eine globale Seite / Benutzerseite 
1. Eine Seite pro Projekt


# Globale Seite

Repository erstellen in der Form

	NAME.github.io

Auf dem lokalen Rechner das Arbeitsverzeichnis erstellen
und diese Dateien hoch laden.

Hier ein Beispiel in dem nur die `readme.md` Datei erstellt und dann in 
das Repository geladen wird.

~~~{.bash}
touch readme.md
git init
git add readme.md
git commit -m "start"
git remote add origin git@github.com:NAME/NAME.github.io.git
git push -u origin master
~~~

