//: # Vorlesung 1 - Grundlagen der Programmierung in Swift


//: ## Hello World!

print("Hello World!")


//: ## Konstanten und Variablen

let c = 1
// c = 2 // Konstanten können ihren Wert nicht ändern, ...
var x = 1
x = 2 // ... aber Variablen schon!


//: ## Einfache Datentypen & Type Inference

let i: Int = -42 // integer
let f: Float = 2.5 // floating-point number
let d: Double = 3.14 // double precision floating-point number
let b: Bool = true // boolean
let s: String = "Hello World!" // text

var z1 = 1 // z1 ist vom Typ Int (Alt-Klick auf Variablenname)
z1 = 2 // funktioniert
//z1 = 2.5 // ist nicht mit Int kompatibel!
z1 = Int(2.5) // wir können einen integer aus einem Float erstellen
var z2: Float = 1 // z2 ist vom Typ Float
z2 = 2.5 // funktioniert

var city = "Melbourne"
var cities: [String] = [ "Melbourne", "Sydney", "Heidelberg" ] // oder type-inferred oder Array<String>
cities[0] // Zugriff über Subscript
var populations = [ "Melbourne": 4e6, "Sydney": 4e6, "Heidelberg": 150e3] // oder Dictionary<String, Int>
populations["Heidelberg"]

let π = 3.1415 // Unicode Zeichen!
var 🌳 = [ "🌳" ]
let 💧 = 10
for i in 0...💧 {
    🌳 += 🌳
}
print(🌳)


//: ## String Formatierung

print("Heidelberg hat \(150e3) Einwohner.")
print("Planted \(🌳.count) trees.")


//: ## Einfache Operatoren

let nine = (1 + 2) * 3 // nine ist jetzt Int(9)
let four = nine / 2 // four ist jetzt Int(4), da sowohl nine als auch 2 integer sind
let nineHalf = Float(nine) / 2 // Hier wird der Wert 2 als Float interpretiert, somit ist ist c jetzt Float(4.5)


//: ## Abfragen

let year = 2015

if year < 2015 {
    print("Vergangenheit")
} else if year == 2015 {
    print("Gegenwart");
} else if year > 2015 {
    print("Zukunft");
} else {
    print("unmöglich!");
}

var chineseYear: String

switch year {
    
case 2013:
    chineseYear = "serpent"
case 2014:
    chineseYear = "horse"
case 2015:
    chineseYear = "sheep"
case 2016:
    chineseYear = "monkey"
default:
    chineseYear = "[some other animal]"
}

print("\(year) is the chinese year of the \(chineseYear)")


//: ## Schleifen

for city in cities {
    print(city)
}

for (name, population) in populations {
    print("\(name) hat \(population) Einwohner.")
}

var p: Float = 1
var target: Float = 1000
while abs(p - target) > 1 {
    p += (target - p) / 2
}

print(p)


//: ## Funktionen & Optionals

import Foundation // (brauchen wir nur, um die Funktion pow() zu verwenden)

// Eine *Funktion* nimmt Argumente an und gibt Rückgabewerte zurück
// Jeder Typ kann als *Optional* vorliegen: entweder hält er den Wert, oder nichts (nil)
// Diese Funktion hat bspw. den Namen "numberForDigits", nimmt eine Liste von integern (die Ziffern einer Zahl) an und gibt einen optional integer (die entsprechende Zahl, oder nichts, wenn die Liste leer ist) zurück:
func numberForDigits(digits: [Int]) -> Int? {
    if digits.count > 0 { // Ist mindestens eine Ziffer in der Liste?
        // Berechne die Zahl aus den Ziffern
        var number = 0
        for (index, digit) in digits.reverse().enumerate() {
            number += digit * Int(pow(10, Double(index)))
        }
        return number // Gebe die Zahl zurück
    } else {
        // Die Liste enthält keine Ziffern, gebe nichts zurück
        return nil
    }
}

// Wir können die Funktion nun aufrufen und den Rückgabewert einer Konstanten zuweisen:
let n = numberForDigits([ 1, 0, 2]) // n ist nun eine Optional Int
print("Result: \(n).")

// Optionals müssen entpackt werden. Die Optional Binding Syntax vereinfacht dies:
if let n = n { // Einer neuen Konstanten n wird der Wert von n zugewiesen, wenn es einen solchen gibt
    // Nun können wir den Wert verwenden
    print("The number is \(n).")
} else { // Wenn kein Wert vorliegt (nil), wird dieser Code ausgefürt
    print("No digits specified.")
}

// Optionals sind in Swift allgegenwärtig. Wenn eine Typ optional ist, kann er nil werden und der Programmierer muss dies berücksichtigen. Andernfalls kann man sich darauf verlassen, dass immer ein Wert vorliegt.
// So werden Laufzeitfehler vermieden und unsere App stürzt bei unbeabsichtigtem Verhalten nicht ab!

// Bspw. der Zugriff auf Objekte in einem Dictionary gibt einen Optional zurück, da wir nicht wissen, ob ein Wert zu diesem Key existiert:
print(populations["Heidelberg"])

// Wenn klar ist, dass ein Wert vorhanden ist, **kann** man sich mit einem *Force Unwrap* über das Optional-Verhalten hinwegsetzen:
print(populations["Heidelberg"]!)
// Dies deutet aber in vielen Fällen auf schlechte Programmierung hin! Verwendet den Force Unwrap nur mit äußerster Vorsicht.


let 👋 = "👋"
👋 + 👋 // Bis zur nächsten Vorlesung!
