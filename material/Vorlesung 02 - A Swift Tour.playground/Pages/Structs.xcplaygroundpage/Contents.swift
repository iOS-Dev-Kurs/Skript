/*:
 Softwareentwicklung für iOS | Universität Heidelberg | SS 2016 | Nils Fischer | [ios-dev-kurs.github.io](ios-dev-kurs.github.io)
 
 ---
 
 ## Structs

 Structs funktionieren sehr ähnlich zu Klassen. Während ein Objekt einer Klasse jedoch als *Referenz* weitergegeben wird werden Structs jedes mal kopiert, wenn sie weitergegeben werden. Klassen sind also _Reference Types_ und Structs _Value Types_. Außerdem gibt es keine Vererbung bei Structs. Wir verwenden daher Structs um statische Dinge zu repräsentieren, wie bspw. eine Adresse:
*/
struct Address {
    
    let street: String
    let postalCode: String
    let city: String
    
    // Structs, wie auch Klassen und Enums, können _Computed Properties_ besitzen. Dies sind Attribute, deren Wert (wie durch Aufruf einer Methode) auf Anfrage zurückgegeben wird:
    var description: String {
        return "\(street), \(postalCode) \(city)"
    }
    
}

// Für Structs wird automatisch ein Initializer mit allen Attributen generiert:
let address = Address(street: "Im Neuenheimer Feld 227", postalCode: "", city: "Heidelberg")
address.description

/*:
 ### Klasse oder Struct?
 
 Entscheide für jede Datenstruktur, ob eine Klasse oder ein Struct angemessen ist.
 
 - Verwende ein Struct, wenn die Datenstruktur hauptsächlich einige Attribute bündelt und eine Klasse, wenn du den Vererbungs-Mechanismus benötigst.
 - Überlege außerdem, ob du erwartest, dass jede Instanz der Datenstruktur ein _Objekt_ ist welches du als _Referenz_ weitergibst, oder eher eine statische Sammlung von Werten, die als _Kopie_ weitergegeben wird.
 - Ein guter Anhaltspunkt ist außerdem, wie du die _Identität_ von zwei Instanzen der Datenstruktur definierst. Zwei Instanzen eines Structs sind i.A. _identisch_ wenn ihre Attribute den gleichen Wert haben, wie bspw. zwei gleiche Adressen. Zwei Objekte einer Klasse sind hingegen nie identisch sondern können nur _gleich_ sein, wie bspw. zwei Personen den gleichen Namen haben können obwohl sie nicht identisch sind.
 
 > Swift optimiert die Speicherverwaltung von Value Types: Structs verhalten sich zwar, als würden sie bei jeder Weitergabe kopiert, doch tatsächlich geschieht dies nur wenn es notwendig ist. Du solltest also Structs nicht aus Performancebedenken vermeiden! Durch die statische Natur von Structs sind sie i.A. sogar performanter als Klassen.
*/
 
