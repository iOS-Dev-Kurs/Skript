# iOS Dev Kurs der Universität Heidelberg

Dieses Repository enthält das vorlesungsbegleitende Skript. Es ist in die folgenden Dokumente aufgeteilt:

- **Skript:** Grundlagen der Kursthemen
- **App Katalog:** Schritt-für-Schritt Anleitungen für die im Rahmen des Kurses erstellten Apps und wöchentliche Übungsaufgaben
- **Beispiellösungen der Übungsaufgaben**

Während des Semesters entspricht der `master` Branch dem Stand des Kurses. Die letzte vollständige Version, i.A. des vergangenen Semesters, ist hingegen unter dem Tag `public` erreichbar.

## Typesetting

Die Dokumente werden mit [XeLaTex](http://www.xelatex.org) gesetzt.

Es werden u.a. folgende Packages verwendet:

- [menukeys](https://github.com/tweh/menukeys) für Tasten- und Menüsymbolik
- [minted](https://github.com/gpoore/minted) für Code-Highlighting

Für `minted` muss das Python Package `pygments` installiert sein:

	pip install pygments

Außerdem muss die Option `--shell-escape` angegeben werden. Bei TexPad darf _Hide intermediate files_ nicht aktiviert sein.
