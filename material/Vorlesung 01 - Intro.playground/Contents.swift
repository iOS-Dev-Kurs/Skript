/*:
 Softwareentwicklung für iOS | Universität Heidelberg | SS 2016 | Nils Fischer | [ios-dev-kurs.github.io](ios-dev-kurs.github.io)
 
 ---
 
 # Vorlesung 1 - Hello World!

 Software-Vorraussetzungen:
 
 - [Xcode](https://itunes.apple.com/de/app/xcode/id497799835?mt=12) aus dem Mac App Store laden
 - Account auf [GitHub](https://github.com) erstellen: https://github.com/join
 - [GitHub Desktop App](https://desktop.github.com) laden: https://desktop.github.com **oder** Erfahrung im Umgang mit der Kommandozeile / Git
 
 Materialien:

 - auf der [Vorlesungswebseite](ios-dev-kurs.github.io): [ios-dev-kurs.github.io/material](ios-dev-kurs.github.io/material)

*/

let c = 1

var x: Double = 1
x = 1.5

let friends = [ "Alice", "Bob", "Peter" ]
if let index = friends.indexOf("Peter") {
    print("Der Index ist \(index)")
} else {
    print("Nicht enthalten.")
}
