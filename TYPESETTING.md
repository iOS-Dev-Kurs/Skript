# Typesetting

Die Dokumente werden mit [XeLaTex](http://www.xelatex.org) gesetzt.

Es werden u.a. folgende Packages verwendet:

- [menukeys](https://github.com/tweh/menukeys) für Tasten- und Menüsymbolik
- [minted](https://github.com/gpoore/minted) für Code-Highlighting

Für `minted` muss das Python Package `pygments` installiert sein:

	pip install pygments

Außerdem muss die Option `--shell-escape` angegeben werden. Bei TexPad darf _Hide intermediate files_ nicht aktiviert sein.
