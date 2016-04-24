/*:
 Softwareentwicklung für iOS | Universität Heidelberg | SS 2016 | Nils Fischer | [ios-dev-kurs.github.io](ios-dev-kurs.github.io)
 
 ---
 
 ## Protokolle
 
 Ein Protokoll definiert Attribute und Methoden ohne sie zu implementieren. Klassen, Structs oder Enums können das Protokoll erfüllen, indem sie diese Attribute und Methoden implementieren. Mit Protokollen können wir Dinge nach ihren _Eigenschaften_ und nicht nach ihrer Implementierung klassifizieren.
*/
/// Dieses Protokoll beschreibt Datenstrukturen deren Instanzen einen Namen haben.
protocol Named {
    
    // Jede Datenstruktur, die das Protokoll erfüllen will, muss ein Attribut `name: String` bereitstellen.
    var name: String { get }
    
}


// Diese Klasse erfüllt das Protokoll, indem es ein konstantes Attribut `name` besitzt
class Pet: Named {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

let 🐶 = Pet(name: "Susi")


// Dieses Enum erfüllt das Protokoll durch eine Computed Property
enum Season: Named {
    case spring, summer, fall, winter
    
    var name: String {
        switch self {
        case .spring: return "Frühling"
        case .summer: return "Sommer"
        case .fall: return "Herbst"
        case .winter: return "Winter"
        }
    }
}

let 🌱 = Season.spring

// In einer _Extension_ können wir Klassen, Structs oder Enums um Computed Properties und Methoden erweitern. So können wir auch Protokolle erfüllen:
extension Person: Named {
    
    // Nichts zu tun, die Klasse erfüllt das Protokoll schon!
    
}

let 👸 = Person(name: "Alice")


let namedThings: [Named] = [ 🐶, 👸, 🌱 ]
for namedThing in namedThings {
    // Über diese Elemente wissen wir nur eines: sie alle haben einen `name`.
    print(namedThing.name)
}


/*:
 ### Protokollorientierte Programmierung
 
 Swift wird auch die erste _Protokollorientierte Programmiersprache_ genannt. Statt durch Vererbungshierarchien sind Typen durch die Protokolle definiert, die sie erfüllen.
 
 - Damit zwei Instanzen eines Typs mit dem Gleichheitsoperator `==` verglichen werden können, muss der Typ `Equatable` sein.
 
   **Hinweis:** Structs sollten per Definition **immer** `Equatable` sein.
*/
extension Address: Equatable {}

public func ==(lhs: Address, rhs: Address) -> Bool {
    return lhs.street == rhs.street && lhs.postalCode == rhs.postalCode && lhs.city == rhs.city
}

Address(street: "Im Neuenheimer Feld 227", postalCode: "", city: "Heidelberg") == Address(street: "Im Neuenheimer Feld 227", postalCode: "", city: "Heidelberg")
/*:
 - Jeder Typ der das `CollectionType` Protokoll erfüllt kann in einer `for`-Schleife iteriert werden. `Array`, `Dictionary` und `Set` sind bspw. `CollectionType`s
 - Indem ein Typ das `CustomStringConvertible` Protokoll erfüllt kann er eine Textrepräsentation definieren, die bspw. von der `print`-Funktion ausgegeben wird.
*/
extension Person: CustomStringConvertible {
    
    public var description: String {
        return name
    }
    
}
print(👸)
