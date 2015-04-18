//: # Vorlesung 2 - Objektorientierte Programmierung in Swift

// Eine Klasse stellt einen "Bauplan" für Objekte dar. Sie definiert Attribute und Methoden.
// Objekte werden nach diesem Bauplan erstellt (initialisiert). Ihren Attributen können dann Werte zugewiesen und die Methoden aufgerufen werden.

/// Repräsentation einer Person mit einem Namen
class Person {
    
    /// Der Name der Person. Jedes Objekt der Klasse besitzt dieses Attribut.
    let name: String
    
    // Neue Objekte dieser Klasse werden durch Aufruf des Initializers erstellt. Wurde dieser ausgeführt, muss jedes Attribut einen Wert besitzen.
    init(name: String) {
        self.name = name
        self.sayHello()
    }
    
    // Funktionen einer Klasse werden Methoden genannt:
    
    /// Diese Methode gibt einen Gruß in der Konsole aus, wenn sie aufgerufen wird.
    func sayHello() {
        println("Hello World! My name is \(name).")
    }
    
    /// Diese Methode grüßt eine andere Person, die als Argument übergeben wird.
    func sayHelloTo(otherPerson: Person) {
        println("Hi \(otherPerson.name)! My name is \(name)")
    }
    
    /// Nur ein shortcut für sayHelloTo
    func 👋(👤: Person) {
        self.sayHelloTo(👤)
    }
    
    func 💋(👤: Person) -> Person {
        // xxx
        return Person(name: 👤.name + " Jr.")
    }
    
}

// Durch Aufruf des Initializers können wir nun Objekte dieser Klasse erstellen
let 👩🏻 = Person(name: "Alice")
👩🏻.name
let 👨🏼 = Person(name: "Bob")

// Rufe die Methode sayHelloTo: auf dem Objekt 👩🏻 auf und übergebe 👨🏼 als argument
👩🏻.👋(👨🏼)

👩🏻.💋(👨🏼)

// Erstelle eine Liste von Namen, also ein Array<String>
let names = ["Alice", "Bob", "Cindy", "Bruce", "Chris", "Bill", "Susan"]
// Erstelle eine leere Liste von Personen
var 👥 = Array<Person>()

// Erstelle ein neues Objekt der Klasse Person für jeden Namen und füge es der Liste hinzu
for name in names {
    let 👤 = Person(name: name)
    👥.append(👤)
}

// Das geht auch schneller mit der map() Funktion:
👥 = names.map { Person(name: $0) }

// Lass dich von jeder Person in der Liste hingebungsvoll grüßen!
let 👽 = Person(name: "<Dein Name>")
for 👤 in 👥 {
    👤.sayHelloTo(👽)
}


//: ## Structs

// Structs funktionieren sehr ähnlich zu Klassen. Während eine Instanz einer Klasse (Objekt) jedoch als solches im Speicher existiert und eine *Referenz* weitergegeben wird ("Reference Type"), werden Structs jedes mal kopiert, wenn sie weitergegeben werden ("Value Type"). Daher eignen sie sich bspw., um Attribute zu bündeln und zusätzliche Funktionalität zu implementieren:
struct Address {
    
    let street: String
    let postalCode: String
    let city: String
    
    // Structs, wie auch Klassen und Enums, können *Computed Properties* besitzen. Dies sind Attribute, deren Wert (wie durch Aufruf einer Methode) auf Anfrage generiert wird:
    var description: String {
        return "\(street), \(postalCode) \(city)"
    }
    
}

// Für Structs wird automatisch ein Initializer mit allen Attributen generiert:
let address = Address(street: "Im Neuenheimer Feld 227", postalCode: "", city: "Heidelberg")
println(address.description)
let sameAddress = address // sameAddress ist nun eine Kopie von address, keine Referenz!

//: ## Enums

// Enums repräsentieren eine Menge von Fällen:
enum Gender {
    case Female, Male
}

var gender = Gender.Female // Type Inference funktioniert natürlich mit Enums
gender = .Male // Der Typ kann weggelassen werden, wenn er aus dem Kontext erschlossen werden kann

// Das `switch` Statement eignet sich ideal für Enums:
switch gender {
case .Female:
    println("Female")
case .Male:
    println("Male")
}

// Jeder Fall kann zusätzliche Informationen als *Associated Values* tragen:
import Foundation
enum Contact {
    case Phone(phoneNumber: String), Email(email: String), Website(url: NSURL), Post(address: Address)
    
    // Außerdem sind Enumerations in Swift so mächtig wie Klassen und Structs und können ebenfalls bspw. Computed Properties oder Funktionen definieren:
    var description: String {
        switch self {
        case .Phone(let phoneNumber):
            return "Phone <\(phoneNumber)>"
        case .Email(let email):
            return "Email <\(email)>"
        case .Website(let url):
            return "Website <\(url)>"
        case .Post(let address):
            return "Post <\(address)>"
        }
    }
    
}

let contact = Contact.Email(email: "n.fischer@stud.uni-heidelberg.de")
println(contact.description)
