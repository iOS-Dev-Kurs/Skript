/*:
 Softwareentwicklung für iOS | Universität Heidelberg | SS 2016 | Nils Fischer | [ios-dev-kurs.github.io](ios-dev-kurs.github.io)
 
 ---
 
 # Vorlesung 2 - A Swift Tour

 ## Klassen

 Eine _Klasse_ stellt einen "Bauplan" für _Objekte_ dar. Sie definiert Attribute und Methoden. Objekte werden nach diesem Bauplan erstellt (initialisiert). Ihren Attributen können dann Werte zugewiesen und die Methoden aufgerufen werden.
*/
/// Repräsentation einer Person mit einem Namen
class Person {
    
    /// Der Name der Person. Jedes Objekt der Klasse besitzt dieses Attribut.
    let name: String
    
    // Neue Objekte dieser Klasse werden durch Aufruf des Initializers erstellt. Wurde dieser ausgeführt, muss jedes Attribut einen Wert besitzen.
    init(name: String) {
        self.name = name
        self.sayHello()
    }
    
    // Funktionen einer Klasse werden _Methoden_ genannt:
    
    /// Diese Methode gibt einen Gruß in der Konsole aus, wenn sie aufgerufen wird.
    func sayHello() {
        print("Hello World! My name is \(name).")
    }

    /// Diese Methode grüßt eine andere Person, die als Argument übergeben wird.
    func sayHelloTo(otherPerson: Person) {
        print("Hi \(otherPerson.name)! My name is \(name)")
    }
    
    /// Nur ein Shortcut für `sayHelloTo(_:)`
    func 👋(👤: Person) {
        self.sayHelloTo(👤)
    }
    
}

// Durch Aufruf des Initializers können wir nun Objekte dieser Klasse erstellen
let 👩🏻 = Person(name: "Alice")
👩🏻.name
let 👨🏼 = Person(name: "Bob")

// Rufe die Methode sayHelloTo: auf dem Objekt 👩🏻 auf und übergebe 👨🏼 als argument
👩🏻.👋(👨🏼)

/*:
 ### Vererbung
 
 Klassen können von einer anderen Klasse ableiten, sodass sie deren Funktionalität erben, erweitern und überschreiben können.
*/
// Die Klasse `Scientist` ist eine Subklasse von `Person`. Sie erbt deren Attribute und Methode.
class Scientist: Person {
    
    // Subklassen können Methoden ihrer Superklasse überschreiben...
    override func sayHello() {
        print("Hello World! My name is \(name). Ask me for prime numbers! 🤓")
    }
    
    // ...und neue Funktionalität implementieren
    func sayPrimeNumbersUpTo(maxNumber: Int) {
        print("These are the prime numbers up to \(maxNumber): \(primeNumbersUpTo(maxNumber))")
    }
    
}
let 👨 = Scientist(name: "Peter")
👨.sayPrimeNumbersUpTo(100)

